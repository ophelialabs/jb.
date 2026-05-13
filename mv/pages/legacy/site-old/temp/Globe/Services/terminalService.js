class TerminalService {
    constructor() {
        this.stationType = 'TERMINAL';
        this.capabilities = {
            uplink: true,
            downlink: true,
            quantumEntanglement: false, // Key difference - terminals consume entangled pairs
            ipTrunking: true
        };
    }

    // Terminals receive and use entangled pairs but don't generate them
    useQuantumChannel(entangledPair) {
        return {
            measurementResult: this.performQuantumMeasurement(entangledPair),
            classicalData: this.getClassicalData()
        };
    }

    performQuantumMeasurement(pair) {
        // Simulated measurement of quantum state
        return {
            state: "measured",
            fidelity: pair.fidelity,
            timestamp: new Date()
        };
    }
}
