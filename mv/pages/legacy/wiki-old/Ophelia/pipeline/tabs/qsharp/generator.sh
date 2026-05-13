#!/bin/bash

# Q# Project Generator Script
# Generates Q# project structures for Medical Research, Robotics (IoT), Scientific Research, or Full Advanced

set -e

echo "Q# Project Generator"
echo "======================="
echo "Select the type of Q# project to create:"
echo "1) Medical Research"
echo "2) Robotics (IoT)"
echo "3) Scientific Research"
echo "4) Full Advanced (ML, LLM, AI, Teleportation, etc.)"
echo
read -p "Enter your choice [1-4]: " choice

read -p "Enter your project name: " project_name

if [[ -z "$project_name" ]]; then
  echo "Project name cannot be empty. Exiting."
  exit 1
fi

mkdir -p "$project_name"
cd "$project_name"

# Common structure
mkdir -p src/Quantum src/Classical tests/Quantum tests/Classical lib config docs tools

generate_medical() {
  mkdir -p src/Specializations/Medical/Imaging
  mkdir -p src/Specializations/Medical/Diagnostics
  echo '// Placeholder for Medical Imaging Q# code' > src/Specializations/Medical/Imaging/Imaging.qs
  echo '// Placeholder for Medical Diagnostics Q# code' > src/Specializations/Medical/Diagnostics/Diagnostics.qs
}

generate_robotics() {
  mkdir -p src/Specializations/Robotics/Control
  mkdir -p src/Specializations/Robotics/Sensing
  echo '// Placeholder for Robotics Control Q# code' > src/Specializations/Robotics/Control/Control.qs
  echo '// Placeholder for Robotics Sensing Q# code' > src/Specializations/Robotics/Sensing/Sensing.qs
}

generate_scientific() {
  mkdir -p src/Quantum/Algorithms/QFT
  mkdir -p src/Quantum/Algorithms/Grover
  mkdir -p src/Quantum/Algorithms/Shor
  echo '// Placeholder for QFT algorithm' > src/Quantum/Algorithms/QFT/QuantumFourierTransform.qs
  echo '// Placeholder for Grover algorithm' > src/Quantum/Algorithms/Grover/SearchAlgorithm.qs
  echo '// Placeholder for Shor algorithm' > src/Quantum/Algorithms/Shor/FactorizationAlgorithm.qs
}

generate_full_advanced() {
  # ML
  mkdir -p src/ML/QuantumNeuralNetworks src/ML/QuantumKernels src/ML/Classifiers src/ML/Training
  echo '// QNN' > src/ML/QuantumNeuralNetworks/QNN.qs
  echo '// Quantum Layers' > src/ML/QuantumNeuralNetworks/QuantumLayers.qs
  echo '// SVM Kernel' > src/ML/QuantumKernels/SVMKernel.qs
  echo '// Quantum Perceptron' > src/ML/Classifiers/QuantumPerceptron.qs
  echo '// QKNeighbors' > src/ML/Classifiers/QKNeighbors.qs
  echo '// Parameter Optimization' > src/ML/Training/ParameterOptimization.qs
  echo '// Gradient Descent' > src/ML/Training/GradientDescent.qs
  # LLM
  mkdir -p src/LLM/QuantumTransformers src/LLM/Inference
  echo '// QAttention' > src/LLM/QuantumTransformers/QAttention.qs
  echo '// QEmbeddings' > src/LLM/QuantumTransformers/QEmbeddings.qs
  echo '// Quantum Inference' > src/LLM/Inference/QuantumInference.qs
  # AI
  mkdir -p src/AI/QuantumRL src/AI/Generative
  echo '// QValue Network' > src/AI/QuantumRL/QValueNetwork.qs
  echo '// QGAN' > src/AI/Generative/QGAN.qs
  echo '// Quantum Autoencoder' > src/AI/Generative/QuantumAutoencoder.qs
  # Teleportation & Entanglement
  mkdir -p src/Circuits/Templates src/Circuits/Custom
  echo '// Basic Gates' > src/Circuits/Templates/BasicGates.qs
  echo '// Standard Operations' > src/Circuits/Templates/StandardOperations.qs
  echo '// Teleportation' > src/Circuits/Custom/Teleportation.qs
  echo '// Entanglement Protocols' > src/Circuits/Custom/EntanglementProtocols.qs
  # Optimization
  mkdir -p src/Quantum/Optimization/QAOA src/Quantum/Optimization/VQE
  echo '// MaxCut Solver' > src/Quantum/Optimization/QAOA/MaxCutSolver.qs
  echo '// Molecular Simulation' > src/Quantum/Optimization/VQE/MolecularSimulation.qs
  # Utils
  mkdir -p src/Quantum/Utils/Gates src/Quantum/Utils/Measurements
  echo '// Custom Gates' > src/Quantum/Utils/Gates/CustomGates.qs
  echo '// Custom Measurements' > src/Quantum/Utils/Measurements/CustomMeasurements.qs
  # Tests
  mkdir -p Tests/Unit Tests/Integration
  echo '// Teleportation Tests' > Tests/Unit/TeleportationTests.qs
  echo '// Algorithm Tests' > Tests/Unit/AlgorithmTests.qs
  echo '// System Tests' > Tests/Integration/SystemTests.qs
  # Lib
  mkdir -p Lib
  echo '// StandardLib' > Lib/StandardLib.qs
  echo '// QuantumLibrary' > Lib/QuantumLibrary.qs
  # Examples
  mkdir -p Examples
  echo '// Teleportation Demo' > Examples/TeleportationDemo.qs
  echo '// Grover Demo' > Examples/GroverDemo.qs
  # Config
  mkdir -p Config
  echo '{ \"qubits\": 4 }' > Config/qubitConfig.json
  # Docs
  mkdir -p Docs/Tutorials
  echo '# API' > Docs/API.md
  echo '# Teleportation Tutorial' > Docs/Tutorials/Teleportation.md
  # Project files
  echo '<Project Sdk=\"Microsoft.Quantum.Sdk/0.28.302812\">\n  <PropertyGroup>\n    <OutputType>Exe</OutputType>\n    <TargetFramework>net6.0</TargetFramework>\n  </PropertyGroup>\n</Project>' > QuantumProject.csproj
  echo '// Program.qs' > Program.qs
  echo '// Operations.qs' > Operations.qs
}

case $choice in
  1)
    generate_medical
    ;;
  2)
    generate_robotics
    ;;
  3)
    generate_scientific
    ;;
  4)
    generate_full_advanced
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

echo
echo "Q# project '$project_name' created successfully!"
