const express = require('express');
const bodyParser = require('body-parser');
const rateLimit = require('express-rate-limit');
const helmet = require('helmet');
const jwt = require('jsonwebtoken');
const GeofenceManager = require('./GeofenceManager');

class GeofenceAPI {
    constructor(options = {}) {
        this.app = express();
        this.geofenceManager = new GeofenceManager(options.geofenceManager);
        this.setupMiddleware();
        this.setupRoutes();
        this.setupEventHandlers();
    }

    setupMiddleware() {
        // Security middleware
        this.app.use(helmet());
        this.app.use(bodyParser.json());

        // Rate limiting
        const limiter = rateLimit({
            windowMs: 15 * 60 * 1000, // 15 minutes
            max: 100 // limit each IP to 100 requests per windowMs
        });
        this.app.use(limiter);

        // Authentication middleware
        this.app.use(this.authenticate.bind(this));

        // Error handling
        this.app.use(this.errorHandler.bind(this));
    }

    authenticate(req, res, next) {
        const authHeader = req.headers.authorization;
        if (!authHeader) {
            return res.status(401).json({ error: 'No authorization header' });
        }

        const token = authHeader.split(' ')[1];
        try {
            const decoded = jwt.verify(token, process.env.JWT_SECRET);
            req.user = decoded;
            next();
        } catch (error) {
            res.status(401).json({ error: 'Invalid token' });
        }
    }

    setupRoutes() {
        // Geofence Management
        this.app.post('/geofences', this.createGeofence.bind(this));
        this.app.get('/geofences', this.listGeofences.bind(this));
        this.app.get('/geofences/:id', this.getGeofence.bind(this));
        this.app.put('/geofences/:id', this.updateGeofence.bind(this));
        this.app.delete('/geofences/:id', this.deleteGeofence.bind(this));

        // Device Location Management
        this.app.post('/devices/location', this.updateDeviceLocation.bind(this));
        this.app.post('/devices/location/batch', this.batchUpdateLocations.bind(this));
        this.app.get('/devices/:id/location', this.getDeviceLocation.bind(this));

        // Queries
        this.app.get('/geofences/:id/devices', this.getDevicesInGeofence.bind(this));
        this.app.get('/geofences/tag/:tag', this.getGeofencesByTag.bind(this));

        // Statistics
        this.app.get('/stats', this.getStats.bind(this));
    }

    setupEventHandlers() {
        this.geofenceManager.on('geofenceEvent', this.handleGeofenceEvent.bind(this));
    }

    // Route Handlers
    async createGeofence(req, res) {
        try {
            const { id, shape, coordinates, options } = req.body;
            const geofence = this.geofenceManager.addGeofence(id, shape, coordinates, options);
            res.status(201).json(geofence);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
    }

    async listGeofences(req, res) {
        const geofences = Array.from(this.geofenceManager.geofences.values());
        res.json(geofences);
    }

    async getGeofence(req, res) {
        const geofence = this.geofenceManager.getGeofence(req.params.id);
        if (!geofence) {
            return res.status(404).json({ error: 'Geofence not found' });
        }
        res.json(geofence);
    }

    async updateGeofence(req, res) {
        const updated = this.geofenceManager.updateGeofence(req.params.id, req.body);
        if (!updated) {
            return res.status(404).json({ error: 'Geofence not found' });
        }
        res.json(updated);
    }

    async deleteGeofence(req, res) {
        const deleted = this.geofenceManager.removeGeofence(req.params.id);
        if (!deleted) {
            return res.status(404).json({ error: 'Geofence not found' });
        }
        res.status(204).send();
    }

    async updateDeviceLocation(req, res) {
        try {
            const { deviceId, location, timestamp } = req.body;
            this.geofenceManager.updateDeviceLocation(deviceId, location, timestamp);
            res.status(200).json({ status: 'success' });
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
    }

    async batchUpdateLocations(req, res) {
        try {
            const results = this.geofenceManager.batchUpdateLocations(req.body);
            res.status(200).json(results);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
    }

    async getDeviceLocation(req, res) {
        const location = this.geofenceManager.getDeviceLocation(req.params.id);
        if (!location) {
            return res.status(404).json({ error: 'Device location not found' });
        }
        res.json(location);
    }

    async getDevicesInGeofence(req, res) {
        const devices = this.geofenceManager.findDevicesInGeofence(req.params.id);
        res.json(devices);
    }

    async getGeofencesByTag(req, res) {
        const geofences = this.geofenceManager.findGeofencesByTag(req.params.tag);
        res.json(geofences);
    }

    async getStats(req, res) {
        const stats = this.geofenceManager.getStats();
        res.json(stats);
    }

    // Event Handlers
    handleGeofenceEvent(event) {
        // Handle geofence events (e.g., send to webhook, store in database, etc.)
        console.log('Geofence event:', event);
    }

    // Error Handler
    errorHandler(err, req, res, next) {
        console.error(err.stack);
        res.status(500).json({
            error: 'Internal server error',
            message: process.env.NODE_ENV === 'development' ? err.message : undefined
        });
    }

    // Server
    start(port = 3000) {
        return new Promise((resolve, reject) => {
            this.server = this.app.listen(port, () => {
                console.log(`Geofence API listening on port ${port}`);
                resolve();
            });
        });
    }

    stop() {
        return new Promise((resolve, reject) => {
            this.server.close(err => {
                if (err) reject(err);
                else resolve();
            });
        });
    }
}

module.exports = GeofenceAPI;