#!/bin/bash

# CREATE PRIVATE SUBNET (USA)

aws ec2 create-subnet \
  --vpc-id <your-vpc-id> \
  --cidr-block 10.0.1.0/24 \
  --availability-zone us-east-1a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=YourPrivateSubnetUSA}]'

echo "Private Subnet Created. Replace <your-vpc-id>."
