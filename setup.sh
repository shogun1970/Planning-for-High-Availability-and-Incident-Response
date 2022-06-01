#! /bin/bash

## git setup ##
git config --global user.name "Glenn E Burns"
git config --global user.email "glenn.burns@gmail.com"
git config --global core.editor "vim"

## 
## helm setup

export VERIFY_CHECKSUM=false
curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash


## terraform

wget https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip
unzip terraform_1.0.7_linux_amd64.zip
mkdir ~/bin
mv terraform ~/bin
export TF_PLUGIN_CACHE_DIR="/tmp"

## kubectl

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc


## ERROR appy
╷
│ Error: Error creating DB Instance: InvalidSubnet: No default subnet detected in VPC. Please contact AWS Support to recreate default Subnets.
│       status code: 400, request id: ab1b15f6-9b5d-4b45-a05b-a4d0c27d9cf1
│ 
│   with module.project_rds_p.aws_db_instance.default,
│   on modules/rds-p/rds.tf line 1, in resource "aws_db_instance" "default":
│    1: resource "aws_db_instance" "default" {
│ 
╵

## ERROR destroy
╷
│ Error: error deleting RDS Cluster Instance (udacity-db-instance-0-s): InvalidDBClusterStateFault: Cannot delete the last instance of the read replica DB cluster. Promote the DB cluster to a standalone DB cluster in order to delete it.
│       status code: 400, request id: 07b2eb5a-914f-449c-89d4-596e99e13d8e
│ 
│ 
╵
[cloudshell-user@ip-10-0-178-95 zone1]$ 
