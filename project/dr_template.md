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

RDS cluster - Database Cluster - Aurora MSSQL database

S3 buckets - storage buckets - used to store application, databases, etc.

Security Groups - controls network access to AWS resource (acts as a vitrual firewall)

Load Balancer - distributes/routes traffic to the frontend/backend resources

## DR Plan  (per Lesson)

### Pre-Steps:
Ensure the infrastructure is set up and working in the DR site.

### Steps:
1. Create a cloud load balancer and point DNS to the load balancer. This way you can have multiple instances behind 1 IP in a region. During a failover scenario, you would fail over the single DNS entry at your DNS provider to point to the DR site. This is much more intelligent than pointing to a single instance of a web server.
2. Have a replicated database and perform a failover on the database. While a backup is good and necessary, it is time-consuming to restore from backup. In this DR step, you would have already configured replication and would perform the database failover. Ideally, your application would be using a generic CNAME DNS record and would just connect to the DR instance of the database.


## DR Plan 
    As it pertains to the project with additional details
### Pre-Steps:
  - Pre step is generally completed before DR
  - Make sure configuration is the same for both regions
  
Use IaC (terraform) to help automate resource provisioning in AWS

Create a separate directories Zone1 (primary) and Zone2 (secondary) repository for IaC (using terraform )

Insure terraform config files are pointing to 2 different availability zones

Build infrastructure in region 1 and verify application is working as advertised (in Zone1, terraform init and terraform apply)

Ensure both sides/zone are the same (minimize configuraton drift)

Buid infrastructure in Zone2 and verify application is wokring as advertised (in Zone2, terrform init and terrafome apply)  

Deploy Primary Database on Region 1

Deploy Secondary Database on Region 1

Create Backups/Snapshots of database for backup and recovery

Ensure Database full backup and incremental backup are scheduled


## Steps:
Database Failover steps:

Point DNS to Secondary 

Failover database replication instance to another region (manually to become primary or automatically by using health checks)

  - Using AwS Console Select RDS and select appropriate region

  - Click on writer intance-1 select actions, then failover 

  - Also possible to use the command line and invoke API's to initiate failver

