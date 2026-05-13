# Architecture Patterns & Designs

## Individual Backend Setup

### Linear Development Pipeline
Each application follows a standardized path:

```
1. Application Development
   ├── Choose Language/Framework
   ├── Develop Features
   └── Write Tests

2. Build Phase
   ├── Compile/Transpile
   ├── Run Tests
   ├── Code Quality Checks
   └── Generate Artifacts

3. Containerization
   ├── Create Dockerfile
   ├── Build Docker Image
   ├── Run Container Tests
   └── Optimize Image Size

4. Registry Push
   ├── Tag Image
   ├── Authenticate
   ├── Push to Registry
   └── Manage Versions

5. Kubernetes Deployment
   ├── Create Deployment Manifest
   ├── Deploy to K8s Cluster
   ├── Configure Services
   └── Setup Ingress

6. Enterprise Integration
   ├── Connect to Services
   ├── Configure Logging
   ├── Setup Monitoring
   └── Enable Scaling
```

## Multi-Service Architecture

### Service Communication Patterns

#### Synchronous (REST/gRPC)
```
Service A → HTTP/gRPC → Service B
Service B → Database
Service B → HTTP/gRPC → Service A
```

#### Asynchronous (Message Queue)
```
Service A → Message Broker → Service B
Service A → Message Broker → Service C
Message Broker → Persistence → Replay
```

#### Service Mesh (Istio)
```
        Ingress Gateway
              ↓
        Virtual Service
              ↓
        Destination Rule
              ↓
    Service Mesh Sidecar
              ↓
      Load Balancing
              ↓
         Service Pod
```

## Database Architecture

### Patterns by Technology

#### Java/Spring
- JPA/Hibernate ORM
- Spring Data repositories
- Database migrations (Flyway, Liquibase)
- Connection pooling (HikariCP)

#### Python/Flask
- SQLAlchemy ORM
- Alembic migrations
- Connection pooling
- Async drivers (asyncpg, aiomysql)

#### .NET/Aspire
- Entity Framework Core
- Dapper for micro-ORMs
- Connection pooling
- Multiple databases support

#### Rust
- SQLx for type-safe SQL
- Tokio async runtime
- Connection pooling (r2d2, deadpool)
- Migration support

## Microservices Patterns

### API Gateway Pattern
```
Client → API Gateway → Service Mesh → Services
         ├─ Authentication
         ├─ Rate Limiting
         ├─ Request Routing
         ├─ Response Aggregation
         └─ Load Balancing
```

### Circuit Breaker Pattern
```
Healthy State
    ↓
Request Fails (Threshold)
    ↓
Open State (Reject Requests)
    ↓
Half-Open (Test Request)
    ↓
Success → Healthy / Failure → Open
```

### Saga Pattern (Distributed Transactions)
```
Service A (Start)
    ↓
Service B (Process)
    ↓
Service C (Commit)
    ↓
All Services Succeed or Compensating Transactions Rollback
```

## Resilience Patterns

### Retry Logic
```
Request → Retry Policy
         ├─ Exponential Backoff
         ├─ Jitter
         ├─ Max Retries
         └─ Timeout
```

### Bulkhead Pattern
```
Thread Pool A ─ Service A
Thread Pool B ─ Service B
Thread Pool C ─ Service C
(Isolation prevents cascading failures)
```

### Timeout Pattern
```
Request → Set Timeout
         ├─ Connection Timeout
         ├─ Read Timeout
         └─ Overall Timeout
```

## Caching Strategies

### Cache-Aside Pattern
```
1. Request comes in
2. Check cache
3. Hit → Return
4. Miss → Query DB
5. Update cache
6. Return to client
```

### Write-Through Pattern
```
Client → Write to Cache → Write to DB
           ↓
        Return Success
```

### Cache Invalidation
```
Data Updated
    ↓
    ├─ TTL Expiration
    ├─ Event-Based Invalidation
    ├─ LRU Eviction
    └─ Explicit Invalidation
```

## Security Patterns

### Authentication Flow
```
User → Login → Generate Token (JWT) → Store Token
         ↓
    Send Token in Headers
         ↓
    Validate Token (Public Key)
         ↓
    Access Granted/Denied
```

### Authorization (RBAC)
```
User → Has Role(s)
         ├─ Admin
         ├─ Manager
         └─ User
         ↓
    Check Role Permissions
         ↓
    Grant Access or Deny
```

### Secret Management
```
Application
    ↓
Request Secret (e.g., DB Password)
    ↓
Secret Manager (Vault)
    ├─ Authenticate
    ├─ Authorize
    ├─ Audit
    └─ Return Secret
```

## Deployment Patterns

### Blue-Green Deployment
```
Users → Load Balancer
         ├─ Blue (v1.0) ← Current
         └─ Green (v2.0) ← Ready to test

Test Green...

Load Balancer Switches to Green
Blue available for rollback
```

### Canary Deployment
```
Users → Load Balancer
         ├─ 95% → Stable Version
         └─ 5% → New Version

Monitor new version...

Gradually increase traffic to new version
         ├─ 10% → New Version
         ├─ 25% → New Version
         ├─ 50% → New Version
         └─ 100% → New Version (Rollback if issues)
```

### Rolling Deployment
```
Pod 1 ─ v1.0
Pod 2 ─ v1.0
Pod 3 ─ v1.0
         ↓
Pod 1 ─ v1.1 (restart)
Pod 2 ─ v1.0
Pod 3 ─ v1.0
         ↓
Pod 1 ─ v1.1
Pod 2 ─ v1.1 (restart)
Pod 3 ─ v1.0
         ↓
Pod 1 ─ v1.1
Pod 2 ─ v1.1
Pod 3 ─ v1.1 (restart)
```

## Observability Patterns

### Metrics Collection
```
Application → Metrics Exporter → Prometheus
              (Counters, Gauges, Histograms, Summaries)
                                    ↓
                              Grafana Dashboard
                              Alerting Rules
```

### Logging Strategy
```
Application → Log Aggregator (Fluentd/Filebeat)
              ↓
         Log Storage (Elasticsearch)
              ↓
         Log Analysis (Kibana)
              ↓
         Alerting
```

### Distributed Tracing
```
Request → Service A → Span
              ↓
         Service B → Span
              ↓
         Service C → Span
              ↓
         Trace Collector (Jaeger)
              ↓
         Analysis & Visualization
```

## Infrastructure as Code (IaC)

### Configuration Management Layers

#### Terraform (Infrastructure)
```
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_eks_cluster" "main" {
  name = "my-cluster"
}
```

#### Helm (Kubernetes)
```
helm repo add stable ...
helm install my-release stable/nginx-ingress
```

#### GitOps (ArgoCD)
```
Git Repo (YAML) → ArgoCD → Kubernetes Cluster
                 (Continuous Sync)
```

## Cost Optimization Patterns

### Resource Requests and Limits
```
Container
├─ CPU Request: 100m (guaranteed)
├─ CPU Limit: 500m (max)
├─ Memory Request: 128Mi (guaranteed)
└─ Memory Limit: 512Mi (max)
```

### Auto-Scaling
```
Horizontal Pod Autoscaler
├─ Monitor CPU/Memory
├─ Target: 80% utilization
└─ Scale: 2-10 replicas

Vertical Pod Autoscaler
├─ Recommend sizes
└─ Adjust requests/limits
```

### Spot Instances / Preemptible VMs
```
Cost-Optimized Node Pools
├─ Spot Instances (80% cheaper)
├─ Preemptible VMs (70% cheaper)
└─ Reserved Instances (30-50% discount)
```

---

**Last Updated**: December 18, 2025
