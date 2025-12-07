#!/bin/bash

# CREATE PUBLIC SUBNET (USA)

aws ec2 create-subnet \
  --vpc-id <your-vpc-id> \
  --cidr-block 10.0.0.0/24 \
  --availability-zone us-east-1a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=YourPublicSubnetUSA}]'

# ENABLE AUTO-ASSIGN PUBLIC IP ON SUBNET (USA)

aws ec2 modify-subnet-attribute \
  --subnet-id <your-subnet-id> \     # Replace with your Subnet ID
  --map-public-ip-on-launch

