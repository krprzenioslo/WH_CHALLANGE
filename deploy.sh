#!/bin/bash

if [ ! -z "$1" ]; 
then
export TF_VAR_availability_zones='["eu-central-1a","eu-central-1b","eu-central-1c"]' #AZ of regions where EC2 instance will start up under ASG
export TF_VAR_client_ip_cidr='89.66.136.238/32' #Public IP of client for access the NLB
export TF_VAR_subnets_ids='["subnet-0bd7a02bb7ca26392","subnet-00d96891d61815430","subnet-0ee7e188b4976ab7c"]' #LIST OF Subnets in VPC
export TF_VAR_vpc_id='vpc-0a869e0c7fb08dad2' #ID of default VPC
export TF_VAR_vpc_cidr='172.31.0.0/16'  #CIDR of whole VPC


terraform $1

else

echo "Please add the script parameter for running terraform (plan, apply, destroy)"
fi