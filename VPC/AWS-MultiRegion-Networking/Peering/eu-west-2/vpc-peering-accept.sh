#!/bin/bash

# ACCEPT VPC PEERING CONNECTION (EUROPE - eu-west-2)


# 1. ACCEPT VPC PEERING
aws ec2 accept-vpc-peering-connection \
  --vpc-peering-connection-id <your-peering-connection-id>  

echo "VPC Peering Accepted in Europe (eu-west-2)."

# 2. CREATE ROUTE TO USA VPC THROUGH PEERING
aws ec2 create-route \
  --route-table-id <your-europe-public-rt-id> \          
  --destination-cidr-block 10.0.0.0/16 \                
  --vpc-peering-connection-id <your-peering-connection-id>

echo "Route to USA VPC added through Peering."

# 3. VERIFY VPC PEERING CONNECTION
aws ec2 describe-vpc-peering-connections \
  --vpc-peering-connection-id <your-peering-connection-id>

echo "VPC Peering Details displayed."
