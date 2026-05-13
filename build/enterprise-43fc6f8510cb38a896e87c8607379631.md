::: {.card .border-0 .shadow-sm}
::: {.card-body .p-lg-5 .p-4}
# Outline {#outline .card-title .display-5 .fw-bold .mb-3}

A comprehensive overview of engineering roles, responsibilities, tech
stack, and best practices for building modern, scalable systems.

------------------------------------------------------------------------

## Table of Contents {#table-of-contents .mb-4 .h4}

::: {.list-group .list-group-flush .mb-5}
[1. Frontend & UI](#frontend--ui){.list-group-item
.list-group-item-action} [2. Cart &
Checkout](#cart--checkout){.list-group-item .list-group-item-action} [3.
AFCC (Apply for Circle
Card)](#afcc-apply-for-circle-card){.list-group-item
.list-group-item-action} [4. Engineering
Roles](#engineering-roles){.list-group-item .list-group-item-action}

::: {.list-group-item .border-0 .ps-5}
-   [Lead Java Developer](#lead-java-developer){.text-decoration-none
    .text-secondary}
-   [Lead Engineer](#lead-engineer){.text-decoration-none
    .text-secondary}
-   [Backend Lead
    Engineer](#lead-engineer---backend){.text-decoration-none
    .text-secondary}
-   [Fullstack Lead
    Engineer](#lead-engineer---fullstack){.text-decoration-none
    .text-secondary}
:::

[5. Tech Stack](#tech-stack){.list-group-item .list-group-item-action}
[6. CI/CD & DevOps](#cicd--devops){.list-group-item
.list-group-item-action} [7. Metrics &
Visualizations](#metrics--visualizations){.list-group-item
.list-group-item-action} [8. Cloud & Compute
Platforms](#cloud--compute-platforms){.list-group-item
.list-group-item-action} [9. Best Practices &
Culture](#best-practices--culture){.list-group-item
.list-group-item-action} [10. References & Useful
Links](#references--useful-links){.list-group-item
.list-group-item-action}
:::

------------------------------------------------------------------------

::: {#frontend--ui .section .mb-5}
## Frontend & UI {#frontend-ui .mb-4 .border-bottom .pb-2}
:::

------------------------------------------------------------------------

::: {#cart--checkout .section .mb-5}
## Cart & Checkout {#cart-checkout .mb-4 .border-bottom .pb-2}
:::

------------------------------------------------------------------------

::: {#afcc-apply-for-circle-card .section .mb-5}
## AFCC (Apply for Circle Card) {#afcc-apply-for-circle-card .mb-4 .border-bottom .pb-2}

-   **Purpose:** Evaluates viability, maintainability, financials,
    forecasting, lifecycle management, and total cost of ownership of
    services.
-   **How it works:**
    1.  Submit service details via AFCC portal.
    2.  Automated evaluation pipeline checks core criteria.
    3.  Output includes lifecycle, cost, and maintainability score.
-   **Learn more:** [Service Evaluation Best
    Practices](https://martinfowler.com/bliki/EvaluationCriteria.html)
:::

------------------------------------------------------------------------

::: {#engineering-roles .section .mb-5}
## Engineering Roles {#engineering-roles .mb-4 .border-bottom .pb-2}

::: {#lead-java-developer .mb-4}
### Lead Java Developer {#lead-java-developer .h4 .fw-normal}
:::

::: {#lead-engineer .mb-4}
### Lead Engineer {#lead-engineer .h4 .fw-normal}

-   **Responsibilities:**
    -   [Envoy](https://www.envoyproxy.io/) &
        [HAProxy](https://www.haproxy.org/) API Gateway management
    -   Sidecar Proxy Dev-in house written in
        [GO](https://pkg.go.dev/github.com/googlecloudplatform/pgadapter/samples/sidecar-proxy)
    -   Server Fleet Management:
        [Ansible](https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.6)
    -   Control Plane:
        [Go](https://github.com/envoyproxy/go-control-plane), Kafka,
        Redis/MongoDB
    -   CDN Strategy & Migration: [Akamai](https://www.akamai.com/),
        [Fastly](https://www.fastly.com/)
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
:::

::: {#lead-engineer---backend .mb-4}
### Lead Engineer - Backend {#lead-engineer---backend .h4 .fw-normal}

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
:::

::: {#lead-engineer---fullstack .mb-4}
### Lead Engineer - Fullstack {#lead-engineer---fullstack .h4 .fw-normal}

-   **Responsibilities:**
    -   Lead [scrum teams](https://www.atlassian.com/agile/scrum)
    -   [Java](https://www.java.com/),
        [Kotlin](https://kotlinlang.org/docs/home.html), React, [Spring
        Boot](https://spring.io/projects/spring-boot)/[Micronaut](https://micronaut.io/)
    -   [Run SpringBoot as
        Micronaut](https://guides.micronaut.io/latest/micronaut-spring-boot-maven-java.html)
    -   Build highly scalable distributed systems
    -   Deep knowledge of domain and product features
:::
:::

------------------------------------------------------------------------

::: {#tech-stack .section .mb-5}
## Tech Stack {#tech-stack .mb-4 .border-bottom .pb-2}

-   **Languages & Frameworks:**
    [Kotlin](https://kotlinlang.org/docs/home.html),
    [Java](https://www.oracle.com/java/technologies/appmodel.html),
    [Groovy](https://groovy-lang.org/), [Spring
    Boot](https://spring.io/projects/spring-boot),
    [Micronaut](https://micronaut.io/),
    [http4k](https://www.http4k.org/), [KTOR](https://ktor.io/),
    [Gradle](https://gradle.org/), JavaScript, TypeScript, ReactJS,
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
:::

------------------------------------------------------------------------

::: {#cicd--devops .section .mb-5}
## CI/CD & DevOps {#cicd-devops .mb-4 .border-bottom .pb-2}

-   **Code Pipelines:** Docker, Drone,
    [Vela](https://github.com/go-vela/vela)
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
:::

------------------------------------------------------------------------

::: {#metrics--visualizations .section .mb-5}
## Metrics & Visualizations {#metrics-visualizations .mb-4 .border-bottom .pb-2}

-   **Dashboards:** [Grafana](https://grafana.com/)
-   **Log Aggregation:** Logstash, Kibana
-   **Steps:**
    1.  Set up Grafana dashboard
        -   Connect to data sources for metrics.
    2.  Aggregate logs with Logstash & Kibana ([ELK
        Stack](https://www.elastic.co/what-is/elk-stack)).
    3.  Monitor system health and alerting
        -   Configure alerting rules.

**Example: Grafana Dashboard JSON**

    {
      "dashboard": {
        "title": "System Metrics",
        "panels": [{ "type": "graph", "targets": [{ "expr": "cpu_usage" }] }]
      }
    }
:::

------------------------------------------------------------------------

::: {#cloud--compute-platforms .section .mb-5}
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
:::

------------------------------------------------------------------------

::: {#best-practices--culture .section .mb-5}
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
:::

------------------------------------------------------------------------

::: {#references--useful-links .section .mb-5}
## References & Useful Links {#references-useful-links .mb-4 .border-bottom .pb-2}

::: {.list-group .list-group-flush}
[React Documentation](https://react.dev/){.list-group-item
.list-group-item-action} [Kotlin
Documentation](https://kotlinlang.org/docs/home.html){.list-group-item
.list-group-item-action} [Spring Boot
Guides](https://spring.io/guides){.list-group-item
.list-group-item-action} [Micronaut
Guides](https://guides.micronaut.io/){.list-group-item
.list-group-item-action} [Kafka
Introduction](https://kafka.apache.org/documentation/){.list-group-item
.list-group-item-action} [Kubernetes
Concepts](https://kubernetes.io/docs/concepts/){.list-group-item
.list-group-item-action} [Google Cloud
Documentation](https://cloud.google.com/docs){.list-group-item
.list-group-item-action} [Grafana
Tutorials](https://grafana.com/tutorials/){.list-group-item
.list-group-item-action} [CI/CD Best
Practices](https://martinfowler.com/bliki/ContinuousDelivery.html){.list-group-item
.list-group-item-action}
:::
:::

------------------------------------------------------------------------

For more details, see respective module directories and check the
project wiki.
:::
:::
