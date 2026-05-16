# Professional Cloud Architect Certification Exam Guide

A Google Cloud Certified Professional Cloud Architect enables organizations to leverage Google Cloud technologies. Through an understanding of cloud architecture and Google technology, this individual designs, develops, and manages robust, secure, scalable, highly available, and dynamic solutions to drive business objectives.

The Cloud Architect should be proficient in all aspects of enterprise cloud strategy, solution design, and architectural best practices. The Cloud Architect should also be experienced in software development methodologies and approaches including multi-tiered distributed applications which span multicloud or hybrid environments.

---

## Case Studies

During the exam for the Cloud Architect Certification, some of the questions may refer you to a case study that describes a fictitious business and solution concept. These case studies are intended to provide additional context to help you choose your answers. Review the case studies that may be used in the exam:

- EHR Healthcare
- Helicopter Racing League
- Mountkirk Games
- TerramEarth

---

## Section 1: Designing and Planning a Cloud Solution Architecture (~24% of the exam)

### 1.1 Designing a Solution Infrastructure that Meets Business Requirements

Considerations include:
- Business use cases and product strategy
- Cost optimization
- Supporting the application design
- Integration with external systems
- Movement of data
- Design decision trade-offs
- Build, buy, modify, or deprecate
- Success measurements (e.g., key performance indicators [KPI], return on investment [ROI], metrics)
- Compliance and observability

### 1.2 Designing a Solution Infrastructure that Meets Technical Requirements

Considerations include:
- High availability and failover design
- Elasticity of cloud resources with respect to quotas and limits
- Scalability to meet growth requirements
- Performance and latency

### 1.3 Designing Network, Storage, and Compute Resources

Considerations include:
- Integration with on-premises/multicloud environments
- Cloud-native networking (VPC, peering, firewalls, container networking)
- Choosing data processing technologies
- Choosing appropriate storage types (e.g., object, file, databases)
- Choosing compute resources (e.g., spot, custom machine type, specialized workload)
- Mapping compute needs to platform products

### 1.4 Creating a Migration Plan (i.e., Documents and Architectural Diagrams)

Considerations include:
- Integrating solutions with existing systems
- Migrating systems and data to support the solution
- Software license mapping
- Network planning
- Testing and proofs of concept
- Dependency management planning

### 1.5 Envisioning Future Solution Improvements

Considerations include:
- Cloud and technology improvements
- Evolution of business needs
- Evangelism and advocacy

---

## Section 2: Managing and Provisioning a Solution Infrastructure (~15% of the exam)

### 2.1 Configuring Network Topologies

Considerations include:
- Extending to on-premises environments (hybrid networking)
- Extending to a multicloud environment that may include Google Cloud to Google Cloud communication
- Security protection (e.g., intrusion protection, access control, firewalls)

### 2.2 Configuring Individual Storage Systems

Considerations include:
- Data storage allocation
- Data processing/compute provisioning
- Security and access management
- Network configuration for data transfer and latency
- Data retention and data life cycle management
- Data growth planning

### 2.3 Configuring Compute Systems

Considerations include:
- Compute resource provisioning
- Compute volatility configuration (spot vs. standard)
- Network configuration for compute resources (Google Compute Engine, Google Kubernetes Engine, serverless networking)
- Infrastructure orchestration, resource configuration, and patch management
- Container orchestration

---

## Section 3: Designing for Security and Compliance (~18% of the exam)

### 3.1 Designing for Security

Considerations include:
- Identity and access management (IAM)
- Resource hierarchy (organizations, folders, projects)
- Data security (key management, encryption, secret management)
- Separation of duties (SoD)
- Security controls (e.g., auditing, VPC Service Controls, context aware access, organization policy)
- Managing customer-managed encryption keys with Cloud Key Management Service
- Remote access

### 3.2 Designing for Compliance

Considerations include:
- Legislation (e.g., health record privacy, children’s privacy, data privacy, and ownership)
- Commercial (e.g., sensitive data such as credit card information handling, personally identifiable information [PII])
- Industry certifications (e.g., SOC 2)
- Audits (including logs)

---

## Section 4: Analyzing and Optimizing Technical and Business Processes (~18% of the exam)

### 4.1 Analyzing and Defining Technical Processes

Considerations include:
- Software development life cycle (SDLC)
- Continuous integration / continuous deployment
- Troubleshooting / root cause analysis best practices
- Testing and validation of software and infrastructure
- Service catalog and provisioning
- Business continuity and disaster recovery

### 4.2 Analyzing and Defining Business Processes

Considerations include:
- Stakeholder management (e.g., influencing and facilitation)
- Change management
- Team assessment / skills readiness
- Decision-making processes
- Customer success management
- Cost optimization / resource optimization (CapEx / OpEx)

### 4.3 Developing Procedures to Ensure Reliability of Solutions in Production

Examples: chaos engineering, penetration testing

---

## Section 5: Managing Implementation (~11% of the exam)

### 5.1 Advising Development/Operation Teams to Ensure Successful Deployment of the Solution

Considerations include:
- Application development
- API management best practices
- Testing frameworks (load/unit/integration)
- Data and system migration and management tooling

### 5.2 Interacting with Google Cloud Programmatically

Considerations include:
- Cloud Shell
- Google Cloud SDK (gcloud, gsutil and bq)
- Cloud Emulators (e.g., Bigtable, Spanner, Pub/Sub, Firestore)

---

## Section 6: Ensuring Solution and Operations Reliability (~14% of the exam)

- Monitoring/logging/profiling/alerting solution
- Deployment and release management
- Assisting with the support of deployed solutions
- Evaluating quality control measures
- 

## Example Exam Questions

### Section 1: Designing and Planning a Cloud Solution Architecture

1. **Business Requirements:**  
    What key factors should be considered when designing a cloud solution to meet specific business objectives and KPIs?

2. **Technical Requirements:**  
    How would you ensure high availability and scalability when architecting a solution for a rapidly growing online service?

3. **Migration Planning:**  
    What steps are involved in creating a migration plan for moving an on-premises application to Google Cloud?

### Section 2: Managing and Provisioning a Solution Infrastructure

1. **Network Topologies:**  
    Which Google Cloud networking features enable secure hybrid connectivity between on-premises and cloud environments?

2. **Storage Systems:**  
    How do you choose the appropriate storage type for a workload with unpredictable data growth and strict latency requirements?

3. **Compute Systems:**  
    What considerations should be made when provisioning compute resources for a containerized application on Google Kubernetes Engine?

### Section 3: Designing for Security and Compliance

1. **Security Design:**  
    How can you implement identity and access management (IAM) to enforce least privilege across multiple projects?

2. **Data Security:**  
    What Google Cloud services can be used to encrypt sensitive data at rest and in transit?

3. **Compliance:**  
    How would you design a solution to meet regulatory requirements for storing healthcare data in Google Cloud?

### Section 4: Analyzing and Optimizing Technical and Business Processes

1. **Technical Processes:**  
    What best practices should be followed for troubleshooting and root cause analysis in a cloud environment?

2. **Business Processes:**  
    How can cost optimization be achieved when managing cloud resources for a large enterprise?

3. **Reliability Procedures:**  
    What procedures can be implemented to ensure business continuity and disaster recovery for mission-critical applications?

### Section 5: Managing Implementation

1. **Deployment Advising:**  
    What strategies can development teams use to ensure successful deployment and rollback of cloud applications?

2. **Programmatic Interaction:**  
    Which Google Cloud SDK tools are essential for automating infrastructure provisioning and management?

3. **Testing Frameworks:**  
    How would you integrate load and integration testing into the deployment pipeline for a cloud-native application?

### Section 6: Ensuring Solution and Operations Reliability

1. **Monitoring and Logging:**  
    What Google Cloud services can be used to monitor, log, and alert on application performance issues?

2. **Release Management:**  
    How can deployment and release management be automated to minimize downtime and risk?

3. **Quality Control:**  
    What measures should be taken to evaluate and maintain the reliability of deployed cloud solutions?

