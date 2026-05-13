const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');

class SupervisorAI {
    constructor() {
        this.dataService = new NasaDataService();
        this.agents = new Map();
        this.meshNetwork = new Map();
        this.server = this.initializeGrpcServer();
    }

    initializeGrpcServer() {
        const server = new grpc.Server();
        const packageDef = protoLoader.loadSync('proto/quantum_network.proto');
        const grpcObj = grpc.loadPackageDefinition(packageDef);

        server.addService(grpcObj.quantumnetwork.QuantumNetworkService.service, {
            RegisterNode: this.handleNodeRegistration.bind(this),
            SendQuantumState: this.handleQuantumState.bind(this),
            EstablishMeshConnection: this.handleMeshConnection.bind(this)
        });

        server.bindAsync(
            'localhost:50051',
            grpc.ServerCredentials.createInsecure(),
            () => {
                server.start();
                console.log('Supervisor gRPC server running on port 50051');
            }
        );

        return server;
    }

    registerAgent(agentType, agent) {
        this.agents.set(agentType, agent);
    }

    async processQuery(query, location) {
        const relevantAgent = this.determineRelevantAgent(query);
        return await relevantAgent.processRequest(query, location, this.dataService);
    }

    determineRelevantAgent(query) {
        // Logic to determine which agent should handle the query
        // Returns appropriate agent from this.agents
        return this.agents.get(this.analyzeQueryType(query));
    }

    analyzeQueryType(query) {
        // Simple keyword analysis to determine query type
        const keywords = {
            climate: ['temperature', 'climate', 'weather'],
            geological: ['terrain', 'elevation', 'geology'],
            atmospheric: ['air', 'atmosphere', 'pollution']
        };
        // Return matching category or default
        return 'climate'; // Simplified for example
    }

    handleNodeRegistration(call, callback) {
        const nodeInfo = call.request;
        this.meshNetwork.set(nodeInfo.node_id, {
            type: nodeInfo.type,
            position: {
                lat: nodeInfo.latitude,
                lng: nodeInfo.longitude
            },
            capabilities: nodeInfo.capabilities
        });

        callback(null, {
            status: 'registered',
            mesh_id: crypto.randomUUID()
        });
    }

    handleQuantumState(call, callback) {
        const state = call.request;
        // Process quantum state transfer
        callback(null, { 
            success: true,
            message: 'State transferred successfully'
        });
    }

    handleMeshConnection(call, callback) {
        const request = call.request;
        // Handle mesh connection request
        callback(null, {
            success: true,
            connected_peers: request.peer_ids
        });
    }
}
