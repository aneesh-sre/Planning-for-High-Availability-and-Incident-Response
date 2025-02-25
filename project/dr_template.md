# Infrastructure

## AWS Zones
Identify your zones here

## Servers and Clusters

### Table 1.1 Summary


| **Asset**                  | **Purpose**                                      | **Size**         | **Qty**         | **DR**                      |
|----------------------------|------------------------------------------------|----------------|----------------|-----------------------------|
| EC2          | Virtual machines for application workloads     | t3.small       | 3 per app       | Multi-AZ Deployment         |
| EKS Nodes             | Kubernetes cluster worker nodes                | t3.small       | 2 per cluster   | Multi-AZ Deployment         |
| **VPC**                   | Virtual network with subnets in multiple AZs    | /16 CIDR Block  | 1 per region    | Multi-AZ Subnets            |
| ALB (Load Balancer)   | Distribute traffic across EC2/EKS nodes        | N/A             | 1 per region    | Multi-AZ Routing            |
| Prometheus  | Collects metrics from EC2/EKS                | t3.small       | 1 per cluster   | Multi-AZ Deployment         |
| Grafana  | Visualize monitoring data              | t3.small       | 1 per cluster   | Multi-AZ Deployment         |
| RDS SQL Instances      | Primary and secondary SQL database instances   | db.t3.medium    | 2 per cluster   | Multi-AZ (Zone1 → Zone2)    |
| Security Groups        | Control inbound/outbound traffic               | N/A             | Multiple        | Restrict unauthorized access |
| Key Pair (SSH Access)  | Secure EC2 instance authentication             |     | 1 per region    | Secure SSH Access           |
| Route 53              | DNS failover routing for HA                     | N/A             | 1 per region    | Global DNS Failover         |
| IAM Roles & Policies   | Secure access control for AWS resources        | N/A             | Multiple        | HA Security & Access        |


### Descriptions
More detailed descriptions of each asset identified above.

1. EC2 : Virtual machines running application workloads across multiple AZs, using t3.small.
2. EKS Nodes: Kubernetes worker nodes for containerized applications, with 2 nodes per cluster, t3.small.
3. ALB: Application Load Balancer distributes incoming traffic to EC2/EKS nodes, ensuring HA across AZs.
4. Prometheus & Grafana: Prometheus collects metrics, while Grafana visualizes them, both for multi-AZ deployment.
5. RDS SQL Instances: Primary and secondary SQL database instances using Multi-AZ replication for fault tolerance.
7. VPC: Provides a secure network with subnets in multiple AZs, offering high availability.
8. Security Groups: Configured firewall rules to control traffic to AWS resources, ensuring secure access.
9. Key Pair: Secure authentication for SSH access to EC2 instances, using RSA 2048-bit encryption.
10. Route 53: Manages DNS routing, with global failover for ensuring traffic reaches healthy instances.
11. IAM Roles & Policies: Manage AWS resource access securely, enforcing least privilege and high availability.



## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.


1. Create a new VPC with subnets in multiple AZs .
2. Launch 3 EC2 instances per app w
3. Set up an EKS cluster with 2 worker nodes 
4. Deploy an ALB and register EC2/EKS instances for traffic distribution 
5. Set up RDS instances with Multi-AZ replication and 5-day backup retention.
6. Deploy Prometheus for metrics collection and Grafana for dashboards in the new region.
7. Configure Route 53 DNS for failover routing 
8. Set up IAM roles and security groups for secure access control to AWS resources.




## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region


1. Update Route 53 to route traffic to ALB in the new region..
2. Verify ALB  in the secondary region is healthy and routing traffic to EC2 and EKS.
3. Confirm EC2 instances and EKS nodes are running and scale the cluster if needed.
4. Ensure secondary RDS instance is replicated and promote it to primary.
5. Update application configuration to point to the new RDS instance endpoint.
6. Verify Prometheus and Grafana are collecting and displaying metrics from the new region.
7. Ensure security groups and IAM roles are set for traffic and access in the secondary region.
8. Test application connectivity and database access in the new region.


