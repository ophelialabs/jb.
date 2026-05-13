const MongoClient = require('mongodb').MongoClient;
const { Point } = require('./GeofenceCore');

class GeofencePersistence {
    constructor(options = {}) {
        this.options = {
            url: options.url || 'mongodb://localhost:27017',
            dbName: options.dbName || 'geofencing',
            ...options
        };
    }

    async connect() {
        this.client = await MongoClient.connect(this.options.url);
        this.db = this.client.db(this.options.dbName);
        
        // Create collections
        this.geofences = this.db.collection('geofences');
        this.devices = this.db.collection('devices');
        this.events = this.db.collection('events');

        // Create indexes
        await this.createIndexes();
    }

    async createIndexes() {
        // Geofences indexes
        await this.geofences.createIndex({ id: 1 }, { unique: true });
        await this.geofences.createIndex({ tags: 1 });
        await this.geofences.createIndex({ active: 1 });

        // Devices indexes
        await this.devices.createIndex({ deviceId: 1 }, { unique: true });
        await this.devices.createIndex({ 'location.coordinates': '2dsphere' });
        await this.devices.createIndex({ lastUpdate: 1 });

        // Events indexes
        await this.events.createIndex({ timestamp: 1 });
        await this.events.createIndex({ deviceId: 1 });
        await this.events.createIndex({ geofenceId: 1 });
        await this.events.createIndex({ type: 1 });
    }

    // Geofence Operations
    async saveGeofence(geofence) {
        const doc = {
            ...geofence.toJSON(),
            _id: geofence.id
        };
        await this.geofences.updateOne(
            { _id: geofence.id },
            { $set: doc },
            { upsert: true }
        );
    }

    async loadGeofence(id) {
        const doc = await this.geofences.findOne({ _id: id });
        if (!doc) return null;
        return this._documentToGeofence(doc);
    }

    async deleteGeofence(id) {
        const result = await this.geofences.deleteOne({ _id: id });
        return result.deletedCount > 0;
    }

    async loadAllGeofences() {
        const docs = await this.geofences.find({}).toArray();
        return docs.map(doc => this._documentToGeofence(doc));
    }

    // Device Operations
    async updateDeviceLocation(deviceId, location, timestamp) {
        const doc = {
            deviceId,
            location: {
                type: 'Point',
                coordinates: [location.lng, location.lat]
            },
            lastUpdate: timestamp
        };
        await this.devices.updateOne(
            { deviceId },
            { $set: doc },
            { upsert: true }
        );
    }

    async loadDeviceLocation(deviceId) {
        const doc = await this.devices.findOne({ deviceId });
        if (!doc) return null;
        return {
            current: new Point(
                doc.location.coordinates[1],
                doc.location.coordinates[0]
            ),
            timestamp: doc.lastUpdate
        };
    }

    // Event Operations
    async saveGeofenceEvent(event) {
        await this.events.insertOne({
            ...event,
            timestamp: new Date(event.timestamp)
        });
    }

    async queryEvents(filter, options = {}) {
        const query = {};
        
        if (filter.deviceId) query.deviceId = filter.deviceId;
        if (filter.geofenceId) query.geofenceId = filter.geofenceId;
        if (filter.type) query.type = filter.type;
        if (filter.startTime || filter.endTime) {
            query.timestamp = {};
            if (filter.startTime) query.timestamp.$gte = new Date(filter.startTime);
            if (filter.endTime) query.timestamp.$lte = new Date(filter.endTime);
        }

        const cursor = this.events.find(query);
        
        if (options.sort) cursor.sort(options.sort);
        if (options.limit) cursor.limit(options.limit);
        if (options.skip) cursor.skip(options.skip);

        return cursor.toArray();
    }

    // Analytics Operations
    async getDeviceStats(startTime, endTime) {
        const pipeline = [
            {
                $match: {
                    timestamp: {
                        $gte: new Date(startTime),
                        $lte: new Date(endTime)
                    }
                }
            },
            {
                $group: {
                    _id: '$deviceId',
                    eventCount: { $sum: 1 },
                    enters: {
                        $sum: { $cond: [{ $eq: ['$type', 'enter'] }, 1, 0] }
                    },
                    exits: {
                        $sum: { $cond: [{ $eq: ['$type', 'exit'] }, 1, 0] }
                    }
                }
            }
        ];

        return this.events.aggregate(pipeline).toArray();
    }

    async getGeofenceStats(startTime, endTime) {
        const pipeline = [
            {
                $match: {
                    timestamp: {
                        $gte: new Date(startTime),
                        $lte: new Date(endTime)
                    }
                }
            },
            {
                $group: {
                    _id: '$geofenceId',
                    deviceCount: { $addToSet: '$deviceId' },
                    eventCount: { $sum: 1 }
                }
            },
            {
                $project: {
                    deviceCount: { $size: '$deviceCount' },
                    eventCount: 1
                }
            }
        ];

        return this.events.aggregate(pipeline).toArray();
    }

    // Utility Methods
    _documentToGeofence(doc) {
        const { _id, ...geofenceData } = doc;
        return geofenceData;
    }

    async close() {
        if (this.client) {
            await this.client.close();
        }
    }
}

module.exports = GeofencePersistence;