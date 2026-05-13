# Platform-Specific Guides

## Java / Spring Framework

### Project Setup
```bash
# Using Spring Initializr CLI
spring boot new --type gradle --language java \
  --name myapp \
  --package-name com.example.myapp
```

### Key Dependencies
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
```

### Docker Configuration
```dockerfile
FROM openjdk:17-jdk-alpine
COPY target/myapp.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
```

### Kubernetes Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: java-service
spec:
  replicas: 3
  selector:
    matchLabels:
      app: java-service
  template:
    metadata:
      labels:
        app: java-service
    spec:
      containers:
      - name: java-service
        image: registry/java-service:1.0
        ports:
        - containerPort: 8080
        env:
        - name: SPRING_PROFILES_ACTIVE
          value: "production"
```

### Best Practices
- Use Spring Boot for rapid development
- Implement Spring Security for authentication
- Use Spring Cloud for microservices
- Monitor with Spring Boot Actuator
- Configure externalized properties

---

## Python / Flask

### Project Structure
```
myapp/
├── app.py
├── config.py
├── requirements.txt
├── tests/
│   ├── __init__.py
│   └── test_app.py
└── Dockerfile
```

### Application Setup
```python
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/api/health', methods=['GET'])
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

### Requirements Management
```txt
Flask==2.3.0
Flask-SQLAlchemy==3.0.0
Flask-CORS==4.0.0
python-dotenv==1.0.0
gunicorn==20.1.0
```

### Docker Configuration
```dockerfile
FROM python:3.11-alpine
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
```

### Best Practices
- Use virtual environments (venv)
- Implement proper error handling
- Use environment variables for configuration
- Implement logging
- Use gunicorn for production
- Containerize with Alpine base image

---

## .NET / Aspire

### Project Setup
```bash
dotnet new aspire
dotnet new aspire.starter
```

### Program Configuration
```csharp
var builder = DistributedApplication.CreateBuilder(args);

var postgres = builder.AddPostgres("postgres")
    .AddDatabase("mydb");

var api = builder.AddProject<Projects.MyApp_Api>("api")
    .WithReference(postgres)
    .WithExternalHttpEndpoints();

builder.AddProject<Projects.MyApp_Web>("web")
    .WithReference(api)
    .WithExternalHttpEndpoints();

builder.Build().Run();
```

### Docker Configuration
```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY bin/Release/net8.0/publish .
ENTRYPOINT ["dotnet", "MyApp.dll"]
```

### Kubernetes Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: dotnet-service
spec:
  replicas: 2
  selector:
    matchLabels:
      app: dotnet-service
  template:
    metadata:
      labels:
        app: dotnet-service
    spec:
      containers:
      - name: dotnet-service
        image: registry/dotnet-service:1.0
        ports:
        - containerPort: 8080
```

### Best Practices
- Use Aspire for distributed applications
- Implement dependency injection
- Use Entity Framework Core for data access
- Configure Minimal APIs for lightweight services
- Use configuration builders

---

## Rust / Cargo

### Project Creation
```bash
cargo new myapp
cd myapp
cargo init --name myapp
```

### Cargo.toml Configuration
```toml
[package]
name = "myapp"
version = "0.1.0"
edition = "2021"

[dependencies]
tokio = { version = "1.0", features = ["full"] }
axum = "0.7"
serde = { version = "1.0", features = ["derive"] }
sqlx = { version = "0.7", features = ["postgres"] }
```

### Basic Web Service
```rust
use axum::{
    routing::get,
    Router, Json,
};

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/health", get(health_check));
    
    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000")
        .await
        .unwrap();
    
    axum::serve(listener, app).await.unwrap();
}

async fn health_check() -> Json<serde_json::Value> {
    Json(serde_json::json!({"status": "healthy"}))
}
```

### Docker Configuration
```dockerfile
FROM rust:latest as builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
COPY --from=builder /app/target/release/myapp /usr/local/bin/
CMD ["myapp"]
```

### Best Practices
- Use Cargo for package management
- Leverage Tokio for async runtime
- Use type system for safety
- Implement proper error handling
- Write tests in Rust
- Use builder pattern for complex types

---

## Container Registry Integration

### Docker Hub
```bash
# Login
docker login

# Build and push
docker build -t username/myapp:1.0 .
docker push username/myapp:1.0

# Pull
docker pull username/myapp:1.0
```

### JFrog Artifactory
```bash
# Configure Docker client
docker login artifactory.company.com

# Push to Artifactory
docker tag myapp:1.0 artifactory.company.com/docker/myapp:1.0
docker push artifactory.company.com/docker/myapp:1.0
```

### Oracle Container Registry (OCR)
```bash
# Authenticate
docker login phx.ocir.io

# Push image
docker tag myapp:1.0 phx.ocir.io/namespace/myapp:1.0
docker push phx.ocir.io/namespace/myapp:1.0
```

---

## ROS 2 Integration

### Setup
```bash
# Install ROS 2
sudo apt install -y ros-humble-desktop

# Source setup script
source /opt/ros/humble/setup.bash

# Create workspace
mkdir -p ~/ros_ws/src
cd ~/ros_ws
colcon build
```

### Basic Node
```python
import rclpy
from rclpy.node import Node

class MyNode(Node):
    def __init__(self):
        super().__init__('my_node')
        self.subscription = self.create_subscription(
            String,
            'topic',
            self.listener_callback,
            10)

    def listener_callback(self, msg):
        self.get_logger().info(f'Received: {msg.data}')

def main(args=None):
    rclpy.init(args=args)
    node = MyNode()
    rclpy.spin(node)
    rclpy.shutdown()
```

### Docker Integration
```dockerfile
FROM osrf/ros:humble-desktop
RUN apt-get update && apt-get install -y ros-humble-geometry-msgs
COPY . /workspace/src/
WORKDIR /workspace
RUN . /opt/ros/humble/setup.sh && colcon build
CMD ["/bin/bash"]
```

---

## Quantum Computing (Q#)

### Setup
```bash
# Install QDK
dotnet new install Microsoft.Quantum.ProjectTemplates

# Create project
dotnet new qsharp-standalone
```

### Sample Q# Program
```csharp
operation HelloQ() : String {
    return "Hello quantum world!";
}

operation BellTest(count : Int, initial : Result) : (Int, Int) {
    mutable numOnes = 0;
    for test in 1..count {
        use q = Qubit();
        SetQubitState(initial, q);
        let result = M(q);
        if result == One {
            set numOnes += 1;
        }
        Reset(q);
    }
    return (count - numOnes, numOnes);
}
```

### Container Setup
```dockerfile
FROM mcr.microsoft.com/quantum/iqsharp:latest
COPY Program.qs .
RUN dotnet publish -c Release -o publish
CMD ["dotnet", "run"]
```

---

**Last Updated**: December 18, 2025
