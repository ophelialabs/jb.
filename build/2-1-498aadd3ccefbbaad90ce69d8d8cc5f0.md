---
title: 2-1
---

## Lead Engineer 

### Responsibilities:
-   [Envoy](https://www.envoyproxy.io/) & [HAProxy](https://www.haproxy.org/) API Gateway management
-   Sidecar Proxy Dev-in house written in [GO](https://pkg.go.dev/github.com/googlecloudplatform/pgadapter/samples/sidecar-proxy)
-   Server Fleet Management: [Ansible](https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.6)
        
### Control Plane:
In modern distributed database architectures, the control plane is the administrative layer that manages the lifecycle, configuration, and health of the database instances, while the data plane handles the actual storage and retrieval of user data. 
- [Go](https://github.com/envoyproxy/go-control-plane)
- [Kafka](https://kafka.apache.org/42/getting-started/zk2kraft/),
        
#### Redis Control Plane: 
For Redis, the control plane is typically implemented through specialized management services or Kubernetes operators: 
- [Redis Data Integration (RDI)](https://redis.io/docs/latest/integrate/redis-data-integration/architecture/): Features a control plane consisting of an API server for observation, an operator process to manage data plane pods, and a metrics exporter.
- [Redis Connect](): Explicitly segregates Job Management (control plane) from Job Execution (data plane). The control plane handles job orchestration, metrics reporting, and cluster management through a REST API and CLI.
- Kubernetes Operators: Solutions like the [Kuaishou solution]() with KubeBlocks use a centralized control plane for cross-cluster orchestration, resource distribution, and status aggregation across multiple member clusters.
- [Redis Operator]() (CloudNativePG style): Uses a Controller Manager in the control plane to reconcile cluster resources while the Instance Manager handles local processes.

#### MongoDB Control Plane
MongoDB management, especially in cloud-native or Kubernetes environments, relies on a centralized management layer: 
- [MongoDB Atlas](https://www.mongodb.com/products/platform/atlas-database): Provides a full [cloud-based developer data platform](https://www.mongodb.com/resources/compare/advantages-of-mongodb) where the control plane manages security features, cluster scaling, and automated backups.
- Atlas Security: The control plane manages inbound IP access lists and network security configurations to ensure only authorized traffic reaches the data clusters.
- MongoDB Kubernetes Operator: Separates management logic from the database pods, allowing the control plane to manage replica sets and coordinate sharded cluster configurations across multiple Kubernetes clusters.

#### Joint Implementations
In hybrid architectures, third-party platforms often use both databases to support their own control and data planes: 
- API Management (e.g., Tyk): The [Tyk Gateway](https://tyk.io/docs/5.0/planning-for-production/redis/) utilizes Redis for real-time data plane operations (like rate limiting) and MongoDB or PostgreSQL for the control plane to store persistent API definitions and analytics.
- Development Frameworks (e.g., LangSmith): The [LangSmith data plane](https://docs.langchain.com/langsmith/data-plane) can use a custom Redis instance for its own internal control/data operations and MongoDB as an alternative backend for checkpoint storage.

    -   CDN Strategy & Migration: [Akamai](https://www.akamai.com/), [Fastly](https://www.fastly.com/)
    -   API Monitoring & Security: Implement solutions/tools
-   **Focus:** API gateways and microservice Kubernetes architectures,
    JVM-based services, high observability.

**Example: API Gateway Config (Envoy)**

    static_resources:
      listeners:
      - name: listener_0
        address:
          socket_address: { address: 0.0.0.0, port_value: 8080 }
        filter_chains:
        - filters:
          - name: envoy.filters.network.http_connection_manager

## Lead Engineer - Backend 

-   **Responsibilities:**
    -   [Featurestore](https://jfrog.com/blog/what-is-a-feature-store-in-ml-and-do-i-need-one/),
        [Model ops](https://www.modelop.com/ai-governance-software),
        experimentation, monitoring, explainability, continuous
        improvement
    -   GCP,
        [MLOps](https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning),
        scalable APIs, [ML
        pipelines](https://developers.google.com/machine-learning/managing-ml-projects/pipelines)
    -   Deploy and monitor ML models in production

## Lead Engineer - Fullstack 

-   **Responsibilities:**
    -   Lead [scrum teams](https://www.atlassian.com/agile/scrum)
    -   [Java](https://www.java.com/),
        [Kotlin](https://kotlinlang.org/docs/home.html), React, [Spring
        Boot](https://spring.io/projects/spring-boot)/[Micronaut](https://micronaut.io/)
    -   [Run SpringBoot as
        Micronaut](https://guides.micronaut.io/latest/micronaut-spring-boot-maven-java.html)
    -   Build highly scalable distributed systems
    -   Deep knowledge of domain and product features

## Tech Stack 

-   **Languages & Frameworks:**
    [Kotlin](https://kotlinlang.org/docs/home.html),
    [Java](https://www.oracle.com/java/technologies/appmodel.html),
    [Groovy](https://groovy-lang.org/),
    [Spring Boot](https://spring.io/projects/spring-boot),
    [Micronaut](https://micronaut.io/),
    [http4k](https://www.http4k.org/),
    [KTOR](https://ktor.io/),
    [Gradle](https://gradle.org/),
    JavaScript, TypeScript, ReactJS,
    [Junit](https://junit.org/),
    [Spock](https://github.com/spockframework/spock),
    [KotlinTest](https://kotlinlang.org/api/core/kotlin-test/)
-   **Event Streaming:**
    [Kafka](https://www.confluent.io/learn/event-streaming/#when-to-use-event-streaming-vs-batch-processing),
    [GCP](https://cloud.google.com/products/managed-service-for-apache-kafka?hl=en)
-   **Databases:** Postgres, Cassandra, MongoDB, RocksDB, InfluxDB, ELK
    Stack, Exadata
-   **ML & Data:** [Vertex AI](https://cloud.google.com/vertex-ai),
    [BigQueryML](https://www.cloudskillsboost.google/course_templates/626),
    [Kubeflow](https://cloud.google.com/discover/what-is-kubeflow?hl=en),
    [Cloud Composer](https://cloud.google.com/composer),
    [FastAPI](https://fastapi.tiangolo.com/), Flask:
    [VS](https://learn.microsoft.com/en-us/visualstudio/python/learn-flask-visual-studio-step-01-project-solution?view=vs-2022),
    Jinja-VS,
    [VSC](https://code.visualstudio.com/docs/python/tutorial-flask),
    [Flask](https://palletsprojects.com/)

**Example: Spring Boot Application**

    @SpringBootApplication
    public class Application {
        public static void main(String[] args) {
            SpringApplication.run(Application.class, args);
        }
    }

## CI/CD & DevOps 

-   **Code Pipelines:** Docker, Drone, [Vela](https://github.com/go-vela/vela)
-   **DevOps Tools:** Jenkins, Git, Kubernetes
-   **Steps:**
    1.  Push code to repo
    2.  Automated build/test via CI pipeline
    3.  Container deploy to Kubernetes
    4.  Monitoring via dashboards (see below)

**Example: Drone CI Pipeline**

    pipeline:
      build:
        image: gradle:latest
        commands:
          - ./gradlew build

## Metrics & Visualizations 

-   **Dashboards:** [Grafana](https://grafana.com/)
-   **Log Aggregation:** Logstash, Kibana
-   **Steps:**
    1.  Set up Grafana dashboard
        -   Connect to data sources for metrics.
    2.  Aggregate logs with Logstash & Kibana ([ELK Stack](https://www.elastic.co/what-is/elk-stack)).
    3.  Monitor system health and alerting
        -   Configure alerting rules.

**Example: Grafana Dashboard JSON**

    {
      "dashboard": {
        "title": "System Metrics",
        "panels": [{ "type": "graph", "targets": [{ "expr": "cpu_usage" }] }]
      }
    }

## Cloud & Compute Platforms {#cloud-compute-platforms .mb-4 .border-bottom .pb-2}

-   **Cloud:** [Google Cloud Platform (GCP)](https://cloud.google.com/)
-   **Elastic Compute:** [Kubernetes](https://kubernetes.io/)

**Example: Kubernetes Deployment**

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: my-app
    spec:
      replicas: 3
      template:
        spec:
          containers:
          - name: app
            image: my-app:latest

## Best Practices & Culture {#best-practices-culture .mb-4 .border-bottom .pb-2}

-   **Values:** Diversity, inclusion, collaboration
-   **Architecture:** Distributed microservices, Kubernetes, event-based
    (Kafka), CI/CD pipelines
-   **Automation:** Everything-as-code, operational excellence,
    canary/A/B testing, high observability/logs/metrics
-   **Approach:** Proactive issue triage, edge computing, elastic
    infrastructure, agile ceremonies
-   **Learning:** Experiment with new tech, continuous improvement

**Example: Canary Deployment Annotation**

    metadata:
      annotations:
        deploymentstrategy: canary

## References & Useful Links {#references-useful-links .mb-4 .border-bottom .pb-2}

[React Documentation](https://react.dev/), 
[Kotlin Documentation](https://kotlinlang.org/docs/home.html), 
[Spring Boot Guides](https://spring.io/guides), 
[Micronaut Guides](https://guides.micronaut.io/), 
[Kafka Introduction](https://kafka.apache.org/documentation/), 
[Kubernetes Concepts](https://kubernetes.io/docs/concepts/), 
[Google Cloud Documentation](https://cloud.google.com/docs), 
[Grafana Tutorials](https://grafana.com/tutorials/), 
[CI/CD Best Practices](https://martinfowler.com/bliki/ContinuousDelivery.html)
