class QuantumNetworkService {
    constructor() {
        this.chattanooga = {
            name: 'Chattanooga QNet',
            lat: 35.0456,
            lng: -85.3097,
            type: 'QUANTUM_HUB',
            capabilities: {
                quantumKeyDistribution: true,
                entanglementDistribution: true,
                quantumMemory: true
            },
            connections: [
                {
                    type: 'fiber',
                    capacity: '100 quantum bits/sec',
                    range: '100km'
                },
                {
                    type: 'satellite',
                    capacity: '10 quantum bits/sec',
                    range: 'GEO orbit'
                }
            ]
        };
    }

    getNetworkState() {
        return {
            nodeStatus: 'active',
            entanglementRate: '1000 pairs/second',
            fidelity: 0.98,
            qkdRate: '100 kbps'
        };
    }

    getQuantumLinks() {
        return [
            { 
                source: this.chattanooga,
                target: { lat: 35.0456, lng: -85.2672, name: 'Chattanooga Hub' }, 
                status: '🟢 active',
                capacity: 250
            },
            {
                source: this.chattanooga,
                target: { lat: 35.9606, lng: -83.9207, name: 'Oak Ridge' },
                type: 'fiber',
                status: 'active',
                capacity: 180
            },
            {
                source: this.chattanooga,
                target: { lat: 33.7490, lng: -84.3880, name: 'Atlanta' },
                type: 'fiber',
                status: 'active',
                capacity: 300
            },
            { 
                source: this.chattanooga,
                target: { lat: 38.9072, lng: -77.0369, name: 'Washington Node' }, 
                status: "🟡 Connecting",
                capacity: 120
            },
            { 
                source: this.chattanooga,
                target: { lat: 42.3601, lng: -71.0589, name: 'Boston Labs' }, 
                status: "🟢 Active",
                capacity: 220
            }
        ];
    }
}

