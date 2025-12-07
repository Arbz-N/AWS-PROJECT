#!/bin/bash

# CREATE VPC (USA Region - us-east-1)

aws ec2 create-vpc \
  --cidr-block 10.0.0.0/16 \
  --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=YourVpcNameUSA}]'

echo "VPC Created (USA). Replace YourVpcNameUSA with your preferred name."
