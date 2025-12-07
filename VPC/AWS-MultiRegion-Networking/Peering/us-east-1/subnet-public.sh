#!/bin/bash

# CREATE PUBLIC SUBNET (USA)

aws ec2 create-subnet \
  --vpc-id <your-vpc-id> \
  --cidr-block 10.0.0.0/24 \
  --availability-zone us-east-1a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=YourPublicSubnetUSA}]'

echo "Public Subnet Created. Replace <your-vpc-id>."
