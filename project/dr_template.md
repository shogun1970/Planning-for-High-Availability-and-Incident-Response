# Infrastructure

## AWS Zones
us-east-2:

    us-east-2a
  
    us-east-2b
  
    us-east-2c

us-west-1:

    us-west-1a
  
    us-west-1c
  
## Servers and Clusters
Web Server (EC2)

Monitoring Kubernetes Cluster (EKS)

Relational Database Server (RDS)


### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| EC2 Instance | Ubuntu Web Server | t3.micro  | 3 nodes | deployed to DR |
| EKS on EC2 | EKS cluster Prometheus and Grafana | t3.medium  | 3 nodes | deployed to DR Primary/Secondary |
| RDS Cluster | Aurora MySQL | db.t2.small | 2 instance | deployed to DR Primary/Secondary |

### Descriptions
Ubuntu Web Server - application web server

EKS cluster - kubernetes cluster running monitoring Prometheus and Grafana

RDS cluster - Database Cluster


## DR Plan
### Pre-Steps:
Create a separate Zone1 (primary) and ZOne2 (secondary) repository for IaC (terraform)

Insure terraform config files are pointing to 2 different availability Zone

Deploy Application on Zone1 and verify application is working as advertised

Deploy Application on Zone2 and verify application is wokring as advertised

Deploy Primary Database on Zone1

Deploy Secondary Database on Zone 2

Replicate database on Zone2

Ensure Database full backup and incremental backup are scheduled


## Steps:
Failover steps:
