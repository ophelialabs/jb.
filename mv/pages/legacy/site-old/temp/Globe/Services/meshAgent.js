const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');

class MeshAgent {
    constructor(nodeId, latitude, longitude) {
        this.nodeId = nodeId;
        this.position = { lat: latitude, lng: longitude };
        this.peers = new Map();
        this.client = this.initializeGrpcClient();
    }

    initializeGrpcClient() {
        const packageDef = protoLoader.loadSync('proto/quantum_network.proto');
        const grpcObj = grpc.loadPackageDefinition(packageDef);
        return new grpcObj.quantumnetwork.QuantumNetworkService(
            'localhost:50051',
            grpc.credentials.createInsecure()
        );
    }

    async joinMesh() {
        const nodeInfo = {
            node_id: this.nodeId,
            type: 'QUANTUM_AGENT',
            latitude: this.position.lat,
            longitude: this.position.lng,
            capabilities: ['entanglement', 'state_transfer']
        };

        return new Promise((resolve, reject) => {
            this.client.RegisterNode(nodeInfo, (err, response) => {
                if (err) reject(err);
                else {
                    this.meshId = response.mesh_id;
                    resolve(response);
                }
            });
        });
    }

    async sendQuantumState(targetId, state) {
        return new Promise((resolve, reject) => {
            this.client.SendQuantumState({
                source_id: this.nodeId,
                target_id: targetId,
                fidelity: state.fidelity,
                qubit_count: state.qubitCount
            }, (err, response) => {
                if (err) reject(err);
                else resolve(response);
            });
        });
    }
}
