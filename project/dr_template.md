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
Web Server

Kubernetes Cluster

Database Server


### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| EC2 Instance | Ubuntu Web Server | AWS size eg. t3.micro  | 3 nodes | deployed to DR |
| EC2 Instance | EKS cluster | AWS size eg. t3.medium  | 3 nodes | deployed to DR |
| Load Balancer | Grafana Load Balancer | Network VPC  | 2 instance | deployed to DR |

### Descriptions
Ubuntu Web Server - application web server

EKS cluster - kubernetes cluster running monitoring Prometheus and Grafana

Load Balancer - serving the kubernetes cluster for Grafana UI


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
