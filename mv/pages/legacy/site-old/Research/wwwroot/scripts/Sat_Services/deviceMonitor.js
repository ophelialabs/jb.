class DeviceMonitor {
    constructor() {
        this.devices = new Map();
        this.listeners = [];
    }

    addDevice(device) {
        const id = device.id || crypto.randomUUID();
        this.devices.set(id, {
            ...device,
            timestamp: new Date(),
            status: 'active'
        });
        this.notifyListeners('add', device);
    }

    removeDevice(deviceId) {
        if (this.devices.has(deviceId)) {
            const device = this.devices.get(deviceId);
            this.devices.delete(deviceId);
            this.notifyListeners('remove', device);
        }
    }

    onDeviceChange(callback) {
        this.listeners.push(callback);
    }

    notifyListeners(action, device) {
        this.listeners.forEach(callback => callback(action, device));
    }
}
