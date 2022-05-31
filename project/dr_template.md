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
| udacity-tf-geburns | storage | s3  | 1 bucket | us-east-2 |
| udacity-tf-geburns-west | storage | s3  | 1 bucket | us-west-1 |
| EC2 Instance | Ubuntu Web Server | t3.micro  | 3 nodes | us-east-2 |
| EKS on EC2 | EKS cluster Prometheus and Grafana | t3.medium  | 3 nodes | us-east-2 |
| RDS Cluster | Aurora MySQL | db.t2.small | primary | us-east-2 |
| RDS Cluster | Aurora MySQL | db.t2.small | secondary | us-west-1 |
| Load Balancer | API Load Balancer  | ALB | global | us-east-2,us-west-1 |
| udacity | Key Pair  | certificate| udacity.pem | us-east-2 |
| udacity | Key Pair  | certificate| udacity.pem | us-west-1 |
| -| Security Group | network | default  | us-east-2 |
| udacity | Security Group  | tf managed | SG-eks-cluster | us-east-2 |
| ec2_sg| Security Group  | tf_managed | ec2_sg | us-east-2 |
| eks-cluster-sg-udacity-cluster-XXXXXXXXX | Secutiry Group | network| udacity.pem | us-east-2 |
| udacity-project-us-east-2a | IP address  | network| public IP | us-east-2 |
| udacity-geburns | ami  | EC2 AMI | Linux image | us-east-2 |
| - | Snapshot  | image snapshot | 8GB| us-east-2 |



### Descriptions
Ubuntu Web Server - application web server s3.micro - virtual machine

App Server - application vm 23.medium - EKS cluster - kubernetes cluster running monitoring Prometheus and Grafana

RDS cluster - Database Cluster

S3 buckets - storage buckets




## DR Plan
### Pre-Steps:
Create a separate Zone1 (primary) and Zone2 (secondary) repository for IaC (terraform)

Insure terraform config files are pointing to 2 different availability zones

Deploy Application on Zone1 and verify application is working as advertised

Deploy Application on Zone2 and verify application is wokring as advertised

Deploy Primary Database on Zone1

Deploy Secondary Database on Zone 2

Replicate database on Zone2

Ensure Database full backup and incremental backup are scheduled


## Steps:
Database Failover steps:

Sync Database (data from backups if needed)

Point dns to Secondary DB
