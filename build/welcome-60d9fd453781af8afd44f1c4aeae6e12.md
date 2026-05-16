# Welcome to the Internal Wiki

This is your company's internal wikipedia. A place to document everything and anything related to our work.
    
## Purpose

The purpose of this wiki is to provide a centralized knowledge base for all employees. This includes technical documentation, project information, team structures, and more.

## Contributing

This wiki is a collaborative effort. Everyone is encouraged to contribute by creating new articles, editing existing ones, and keeping the information up-to-date.

# Outline

A comprehensive overview of engineering roles, responsibilities, tech stack, and best practices for building modern, scalable systems.

---

## Table of Contents

1. [Frontend & UI](#frontend--ui)
2. [Cart & Checkout](#cart--checkout)
3. [AFCC (Apply for Circle Card)](#afcc-apply-for-circle-card)
4. [Engineering Roles](#engineering-roles)
    - [Lead Java Developer](#lead-java-developer)
    - [Lead Engineer](#lead-engineer)
    - [Backend Lead Engineer](#lead-engineer---backend) 
    - [Fullstack Lead Engineer](#lead-engineer---fullstack)
5. [Tech Stack](#tech-stack)
6. [CI/CD & DevOps](#cicd--devops)
7. [Metrics & Visualization](#metrics--visualizations)
8. [Cloud & Compute Platforms](#cloud--compute-platforms)
9. [Best Practices & Culture](#best-practices--culture)
10. [References & Useful Links](#references--useful-links)

---

## Frontend & UI

- **Tech Focus:** [React.js](https://react.dev/), [HTML5](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5), [CSS3](https://developer.mozilla.org/en-US/docs/Web/CSS), [JavaScript (ES6+)](https://developer.mozilla.org/en-US/docs/Web/JavaScript), Micro Frontend Architecture.
- **State Management & Build Tools:** [Redux](https://redux.js.org/), [Webpack](https://webpack.js.org/), [Babel](https://babeljs.io/).
- **Getting Started: (IN PROGRESS**)**
    1. Clone the repo: `git clone https://github.com/jlabclouds/outline.git` **
    2. Install dependencies: `npm install` **
    3. Start development server: `npm start` **
    4. Explore micro frontend modules under `/src/microfrontends` **
    5. See [React Docs](https://react.dev/) for component patterns

---

To integrate a scheduling system that aligns with the TimeGo app, you can follow these steps:

### 1. **Backend API for Scheduling**

    - Create a backend API to manage schedules. This API should handle:
      - Adding, updating, and deleting shifts.
      - Fetching shifts for a specific user.
      - Handling time-off requests.
    - Example API endpoints:
      - `GET /api/schedule` - Fetch upcoming shifts.
      - `POST /api/schedule` - Add a new shift.
      - `PUT /api/schedule/:id` - Update a shift.
      - `DELETE /api/schedule/:id` - Delete a shift.

### 2. **Database Design**

    - Use a database to store scheduling data. Example schema:
      - **Shifts Table**:
         - `id`: Unique identifier.
         - `user_id`: ID of the user assigned to the shift.
         - `date`: Date of the shift.
         - `time`: Time of the shift.
         - `role`: Role for the shift.
      - **TimeOffRequests Table**:
         - `id`: Unique identifier.
         - `user_id`: ID of the user requesting time off.
         - `start_date`: Start date of the time off.
         - `end_date`: End date of the time off.
         - `status`: Status of the request (e.g., pending, approved, denied).

### 3. **Frontend Integration**

    - Update the `fetchSchedule` function to interact with the backend API.
    - Add forms for users to request time off or add shifts.
    - Example for requesting time off:
      ```html
      <div class="card">
            <h2>Request Time Off</h2>
            <form id="timeOffForm">
                 <label for="startDate">Start Date:</label>
                 <input type="date" id="startDate" name="startDate" required>
                 <label for="endDate">End Date:</label>
                 <input type="date" id="endDate" name="endDate" required>
                 <button type="submit" class="button">Submit Request</button>
            </form>
      </div>
      <script>
            document.getElementById('timeOffForm').addEventListener('submit', async (event) => {
                 event.preventDefault();
                 const startDate = document.getElementById('startDate').value;
                 const endDate = document.getElementById('endDate').value;
                 try {
                      const response = await fetch('/api/timeoff', {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({ startDate, endDate })
                      });
                      if (!response.ok) throw new Error('Failed to submit request');
                      alert('Time off request submitted successfully!');
                 } catch (error) {
                      console.error(error);
                      alert('Error submitting time off request.');
                 }
            });
      </script>
      ```

### 4. **Real-Time Updates**

    - Use WebSockets or polling to provide real-time updates for schedule changes or notifications.

### 5. **Authentication**

    - Ensure the scheduling system is secure by implementing user authentication and role-based access control.

### 6. **Mobile-Friendly Design**

    - Ensure the UI is responsive and works well on mobile devices, aligning with the MyTimeGo app's design.

By implementing these steps, you can create a robust scheduling system that integrates seamlessly with the MyTimeGo app.


## Cart & Checkout
<img src="scalableairoadmap.jpg" width="200px" height="200px" />

**Scope:** 
  - Online, brick-and-mortar, Shipt, Google Express; **critical impact on guest experience**

**Languages:** 
 - [Kotlin](https://kotlinlang.org/)
 - [Groovy](https://groovy-lang.org/)
 - [JAM](https://lets-jam.org/docs/jam/index.html)

**Frameworks:** 
 - [Micronaut](https://micronaut.io/)
 - [Ratpack](https://ratpack.io/)

**Databases:** 
 - [Postgres](https://www.postgresql.org/)
 - [Cassandra](https://cassandra.apache.org/)

**Events:** 
 - [Kafka](https://kafka.apache.org/)

**Architecture:** Microservices, multi-tenant

- **Deployment Steps:**
    1. **Build Service Module**
    ```bash
    ./gradlew build
    ```
    2. **Run Database Migrations**
    ```bash
    flyway migrate
    ```
    3. Deploy via CI/CD (see [CI/CD & DevOps](#cicd--devops))
    4. Monitor events with [Kafka dashboard](https://grafana.com/grafana/dashboards/18276-kafka-dashboard/)

**Example: [Kotlin](https://kotlinlang.org/docs/home.html) Service Endpoint**
```kotlin
@Get("/cart")
fun getCart(): HttpResponse<Cart> = HttpResponse.ok(cartService.fetchCart())
```

---

## AFCC (Apply for Circle Card)

- **Purpose:** Evaluates viability, maintainability, financials, forecasting, lifecycle management, and total cost of ownership of services.
- **How it works:**  
  1. Submit service details via AFCC portal.
  2. Automated evaluation pipeline checks core criteria.
  3. Output includes lifecycle, cost, and maintainability score.
- **Learn more:** [Service Evaluation Best Practices](https://martinfowler.com/bliki/EvaluationCriteria.html)

---

## Engineering Roles

### Lead Java Developer

- **Experience:** [Java/J2EE](https://www.oracle.com/java/technologies/appmodel.html), [Kotlin](https://kotlinlang.org/docs/home.html), SQL/NoSQL (RDBMS: [SQL Server](https://www.microsoft.com/en-us/sql-server), [OCI DB](https://www.oracle.com/database/))([Postgres](https://www.postgresql.org/), [MongoDB](https://www.mongodb.com/), [Cassandra](https://cassandra.apache.org/_/index.html), [Graph DB](https://graphdb.ontotext.com/)), Python, Ruby, [Chef](https://www.chef.io/), [Drone](https://drone.io/), [Kubernetes containers](https://kubernetes.io/docs/concepts/containers/), Cloud tech.
  
**Lifecycle:** At least one full-cycle implementation of a major project.
 - DB Browser for SQLite
 - SQL Server

### Lead Engineer

- **Responsibilities:**
    - [Envoy](https://www.envoyproxy.io/) & [HAProxy](https://www.haproxy.org/) API Gateway management
    - Sidecar Proxy Dev-in house written in [GO](https://pkg.go.dev/github.com/googlecloudplatform/pgadapter/samples/sidecar-proxy)
    - Server Fleet Management: [Ansible](https://docs.redhat.com/en/documentation/red_hat_ansible_automation_platform/2.6)
    - Control Plane: [Go](https://github.com/envoyproxy/go-control-plane), Kafka, Redis/MongoDB
    - CDN Strategy & Migration: [Akamai](https://www.akamai.com/), [Fastly](https://www.fastly.com/)
    - API Monitoring & Security: Implement solutions/tools
- **Focus:** API gateways and microservice Kubernetes architectures, JVM-based services, high observability.

**Example: API Gateway Config (Envoy)**
```yaml
static_resources:
  listeners:
  - name: listener_0
    address:
      socket_address: { address: 0.0.0.0, port_value: 8080 }
    filter_chains:
    - filters:
      - name: envoy.filters.network.http_connection_manager
```

### Lead Engineer - Backend

- **Responsibilities:**
    - [Featurestore](https://jfrog.com/blog/what-is-a-feature-store-in-ml-and-do-i-need-one/), [Model ops](https://www.modelop.com/ai-governance-software), experimentation, monitoring, explainability, continuous improvement
    - GCP, [MLOps](https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning), scalable APIs, [ML pipelines](https://developers.google.com/machine-learning/managing-ml-projects/pipelines)
    - Deploy and monitor ML models in production

### Lead Engineer - Fullstack

- **Responsibilities:**
    - Lead [scrum teams](https://www.atlassian.com/agile/scrum)
    - [Java](https://www.java.com/), [Kotlin](https://kotlinlang.org/docs/home.html), React, [Spring Boot](https://spring.io/projects/spring-boot)/[Micronaut](https://micronaut.io/)
    - [Run SpringBoot as Micronaut](https://guides.micronaut.io/latest/micronaut-spring-boot-maven-java.html)
    - Build highly scalable distributed systems
    - Deep knowledge of domain and product features

---

## Tech Stack

- **Languages & Frameworks:** [Kotlin](https://kotlinlang.org/docs/home.html), [Java](https://www.oracle.com/java/technologies/appmodel.html), [Groovy](https://groovy-lang.org/), [Spring Boot](https://spring.io/projects/spring-boot), [Micronaut](https://micronaut.io/), [http4k](https://www.http4k.org/), [KTOR](https://ktor.io/), [Gradle](https://gradle.org/), JavaScript, TypeScript, ReactJS, [Junit](https://junit.org/), [Spock](https://github.com/spockframework/spock), [KotlinTest](https://kotlinlang.org/api/core/kotlin-test/)
- **Event Streaming:** [Kafka](https://www.confluent.io/learn/event-streaming/#when-to-use-event-streaming-vs-batch-processing), [GCP](https://cloud.google.com/products/managed-service-for-apache-kafka?hl=en)
- **Databases:** Postgres, Cassandra, MongoDB, RocksDB, InfluxDB, ELK Stack, Exadata
- **ML & Data:** [Vertex AI](https://cloud.google.com/vertex-ai), [BigQueryML](https://www.cloudskillsboost.google/course_templates/626), [Kubeflow](https://cloud.google.com/discover/what-is-kubeflow?hl=en), [Cloud Composer](https://cloud.google.com/composer), [FastAPI](https://fastapi.tiangolo.com/), Flask: [VS](https://learn.microsoft.com/en-us/visualstudio/python/learn-flask-visual-studio-step-01-project-solution?view=vs-2022), [Jinja-VS](), [VSC](https://code.visualstudio.com/docs/python/tutorial-flask), [Flask](https://palletsprojects.com/)

**Example: Spring Boot Application**
```java
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
```

---

## CI/CD & DevOps

- **Code Pipelines:** Docker, Drone, [Vela](https://github.com/go-vela/vela), [JFrog](https://jfrog.com)
- **DevOps Tools:** Jenkins, Git, Kubernetes
- **Steps:**
    1. Push code to repo
    2. Automated build/test via CI pipeline
    3. Container deploy to Kubernetes
    4. Monitoring via dashboards (see below)
 
**Example: Drone CI Pipeline**
```yaml
pipeline:
  build:
    image: gradle:latest
    commands:
      - ./gradlew build
```

---

## Metrics & Visualizations

- **Dashboards:** [Grafana](https://grafana.com/)
- **Log Aggregation:** Logstash, Kibana
- **Steps:**
    1. Set up Grafana dashboard
       - Connect to data sources for metrics.
    2. Aggregate logs with Logstash & Kibana (ELK Stack).
       - [ELK Stack](https://www.elastic.co/what-is/elk-stack)
    4. Monitor system health and alerting
       - Configure alerting rules.

**Example: Grafana Dashboard JSON**
```json
{
  "dashboard": {
    "title": "System Metrics",
    "panels": [{ "type": "graph", "targets": [{ "expr": "cpu_usage" }] }]
  }
}
```

---

## Cloud & Compute Platforms

- **Cloud:** [Google Cloud Platform (GCP)](https://cloud.google.com/)
- **Elastic Compute:** [Kubernetes](https://kubernetes.io/)

**Example: Kubernetes Deployment**
```yaml
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
```

---

## Best Practices & Culture

- **Values:** Diversity, inclusion, collaboration
- **Architecture:** Distributed microservices, Kubernetes, event-based (Kafka), CI/CD pipelines
- **Automation:** Everything-as-code, operational excellence, canary/A/B testing, high observability/logs/metrics
- **Approach:** Proactive issue triage, edge computing, elastic infrastructure, agile ceremonies
- **Learning:** Experiment with new tech, continuous improvement

**Example: Canary Deployment Annotation**
```yaml
metadata:
  annotations:
    deploymentstrategy: canary
```

---

## References & Useful Links

- [React Documentation](https://react.dev/)
- [Kotlin Documentation](https://kotlinlang.org/docs/home.html)
- [Spring Boot Guides](https://spring.io/guides)
- [Micronaut Guides](https://guides.micronaut.io/)
- [Kafka Introduction](https://kafka.apache.org/documentation/)
- [Kubernetes Concepts](https://kubernetes.io/docs/concepts/)
- [Google Cloud Documentation](https://cloud.google.com/docs)
- [Grafana Tutorials](https://grafana.com/tutorials/)
- [CI/CD Best Practices](https://martinfowler.com/bliki/ContinuousDelivery.html)

---

**For more details, see respective module directories and check the project wiki.**
