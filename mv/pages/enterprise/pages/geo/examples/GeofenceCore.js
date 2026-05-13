// Core Geofencing Implementation
class Point {
    constructor(lat, lng) {
        this.lat = lat;
        this.lng = lng;
    }

    toString() {
        return `(${this.lat}, ${this.lng})`;
    }
}

class GeofenceShape {
    static CIRCLE = 'circle';
    static POLYGON = 'polygon';
    static RECTANGLE = 'rectangle';
}

class Geofence {
    constructor(id, shape, coordinates, options = {}) {
        this.id = id;
        this.shape = shape;
        this.coordinates = coordinates; // For circle: [center, radius], for polygon/rectangle: [points]
        this.name = options.name || id;
        this.description = options.description || '';
        this.tags = options.tags || [];
        this.active = true;
        this.createdAt = new Date().toISOString();
        this.updatedAt = this.createdAt;
        this.metadata = options.metadata || {};
    }

    isPointInside(point) {
        switch (this.shape) {
            case GeofenceShape.CIRCLE:
                return this._isPointInCircle(point);
            case GeofenceShape.POLYGON:
                return this._isPointInPolygon(point);
            case GeofenceShape.RECTANGLE:
                return this._isPointInRectangle(point);
            default:
                throw new Error(`Unsupported shape: ${this.shape}`);
        }
    }

    _isPointInCircle(point) {
        const [center, radius] = this.coordinates;
        return this._calculateDistance(center, point) <= radius;
    }

    _isPointInPolygon(point) {
        const vertices = this.coordinates;
        let inside = false;
        
        for (let i = 0, j = vertices.length - 1; i < vertices.length; j = i++) {
            const xi = vertices[i].lat, yi = vertices[i].lng;
            const xj = vertices[j].lat, yj = vertices[j].lng;
            
            const intersect = ((yi > point.lng) !== (yj > point.lng))
                && (point.lat < (xj - xi) * (point.lng - yi) / (yj - yi) + xi);
                
            if (intersect) inside = !inside;
        }
        
        return inside;
    }

    _isPointInRectangle(point) {
        const [sw, ne] = this.coordinates;
        return point.lat >= sw.lat && point.lat <= ne.lat &&
               point.lng >= sw.lng && point.lng <= ne.lng;
    }

    _calculateDistance(point1, point2) {
        const R = 6371e3; // Earth's radius in meters
        const φ1 = this._toRadians(point1.lat);
        const φ2 = this._toRadians(point2.lat);
        const Δφ = this._toRadians(point2.lat - point1.lat);
        const Δλ = this._toRadians(point2.lng - point1.lng);

        const a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
                Math.cos(φ1) * Math.cos(φ2) *
                Math.sin(Δλ/2) * Math.sin(Δλ/2);
        
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        return R * c;
    }

    _toRadians(degrees) {
        return degrees * (Math.PI / 180);
    }

    update(updates) {
        Object.assign(this, updates);
        this.updatedAt = new Date().toISOString();
    }

    toJSON() {
        return {
            id: this.id,
            shape: this.shape,
            coordinates: this.coordinates,
            name: this.name,
            description: this.description,
            tags: this.tags,
            active: this.active,
            createdAt: this.createdAt,
            updatedAt: this.updatedAt,
            metadata: this.metadata
        };
    }
}

module.exports = {
    Point,
    GeofenceShape,
    Geofence
};