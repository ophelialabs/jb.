const EventEmitter = require('events');
const { Point, GeofenceShape, Geofence } = require('./GeofenceCore');

class GeofenceManager extends EventEmitter {
    constructor(options = {}) {
        super();
        this.geofences = new Map();
        this.deviceLocations = new Map();
        this.options = {
            maxGeofences: options.maxGeofences || 10000,
            maxDevices: options.maxDevices || 100000,
            cleanupInterval: options.cleanupInterval || 3600000, // 1 hour
            locationTTL: options.locationTTL || 86400000, // 24 hours
            ...options
        };

        // Start cleanup interval
        this._startCleanup();
    }

    // Geofence Management
    addGeofence(id, shape, coordinates, options = {}) {
        if (this.geofences.size >= this.options.maxGeofences) {
            throw new Error('Maximum number of geofences reached');
        }

        const geofence = new Geofence(id, shape, coordinates, options);
        this.geofences.set(id, geofence);
        this.emit('geofenceAdded', geofence);
        return geofence;
    }

    removeGeofence(id) {
        const geofence = this.geofences.get(id);
        if (geofence) {
            this.geofences.delete(id);
            this.emit('geofenceRemoved', geofence);
            return true;
        }
        return false;
    }

    updateGeofence(id, updates) {
        const geofence = this.geofences.get(id);
        if (geofence) {
            geofence.update(updates);
            this.emit('geofenceUpdated', geofence);
            return geofence;
        }
        return null;
    }

    getGeofence(id) {
        return this.geofences.get(id);
    }

    // Device Location Management
    updateDeviceLocation(deviceId, location, timestamp = Date.now()) {
        if (this.deviceLocations.size >= this.options.maxDevices) {
            throw new Error('Maximum number of devices reached');
        }

        const previousLocation = this.deviceLocations.get(deviceId);
        const locationData = {
            current: location,
            previous: previousLocation?.current,
            timestamp
        };

        this.deviceLocations.set(deviceId, locationData);
        
        // Check for geofence events
        this._checkGeofenceEvents(deviceId, locationData);
    }

    getDeviceLocation(deviceId) {
        return this.deviceLocations.get(deviceId);
    }

    // Batch Operations
    batchUpdateLocations(updates) {
        const events = [];
        updates.forEach(({ deviceId, location, timestamp }) => {
            try {
                this.updateDeviceLocation(deviceId, location, timestamp);
                events.push({
                    deviceId,
                    status: 'success',
                    timestamp
                });
            } catch (error) {
                events.push({
                    deviceId,
                    status: 'error',
                    error: error.message,
                    timestamp
                });
            }
        });
        return events;
    }

    // Query Operations
    findGeofencesByTag(tag) {
        return Array.from(this.geofences.values())
            .filter(geofence => geofence.tags.includes(tag));
    }

    findDevicesInGeofence(geofenceId) {
        const geofence = this.geofences.get(geofenceId);
        if (!geofence) return [];

        return Array.from(this.deviceLocations.entries())
            .filter(([_, locationData]) => geofence.isPointInside(locationData.current))
            .map(([deviceId]) => deviceId);
    }

    // Private Methods
    _checkGeofenceEvents(deviceId, locationData) {
        const events = [];
        this.geofences.forEach(geofence => {
            if (!geofence.active) return;

            const isInside = geofence.isPointInside(locationData.current);
            const wasInside = locationData.previous ? 
                geofence.isPointInside(locationData.previous) : 
                false;

            if (isInside && !wasInside) {
                events.push({
                    type: 'enter',
                    deviceId,
                    geofenceId: geofence.id,
                    location: locationData.current,
                    timestamp: locationData.timestamp
                });
            } else if (!isInside && wasInside) {
                events.push({
                    type: 'exit',
                    deviceId,
                    geofenceId: geofence.id,
                    location: locationData.current,
                    timestamp: locationData.timestamp
                });
            }
        });

        events.forEach(event => {
            this.emit('geofenceEvent', event);
            this.emit(`geofence${event.type}`, event);
        });

        return events;
    }

    _startCleanup() {
        setInterval(() => {
            const now = Date.now();
            
            // Clean up old device locations
            this.deviceLocations.forEach((locationData, deviceId) => {
                if (now - locationData.timestamp > this.options.locationTTL) {
                    this.deviceLocations.delete(deviceId);
                }
            });
        }, this.options.cleanupInterval);
    }

    // Statistics and Monitoring
    getStats() {
        return {
            totalGeofences: this.geofences.size,
            activeGeofences: Array.from(this.geofences.values())
                .filter(g => g.active).length,
            totalDevices: this.deviceLocations.size,
            timestamp: new Date().toISOString()
        };
    }
}

module.exports = GeofenceManager;