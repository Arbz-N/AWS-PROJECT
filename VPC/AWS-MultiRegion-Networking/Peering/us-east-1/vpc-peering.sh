#!/bin/bash

# CREATE VPC PEERING (USA → EUROPE)


# 1️⃣ CREATE VPC PEERING CONNECTION
aws ec2 create-vpc-peering-connection \
  --vpc-id <your-usa-vpc-id> \             
  --peer-vpc-id <your-eu-vpc-id> \         
  --tag-specifications 'ResourceType=vpc-peering-connection,Tags=[{Key=Name,Value=YourPeeringName}]'

echo "VPC Peering Request Sent (USA → Europe)."

# 2️⃣ CREATE ROUTE TO EUROPE VPC THROUGH PEERING
aws ec2 create-route \
  --route-table-id <your-public-rt-id> \   
  --destination-cidr-block 192.0.0.0/16 \  # Replace with Europe VPC CIDR if different
  --vpc-peering-connection-id <your-peering-id>  # Replace with Peering Connection ID

echo "Route to Europe VPC added through Peering."

# 3️⃣ SECURITY GROUP ALLOW ICMP FROM EUROPE
aws ec2 authorize-security-group-ingress \
  --group-id <your-sg-id> \                # Replace with your SG ID
  --protocol icmp \
  --port -1 \
  --cidr 192.0.0.0/16                       # Replace with Europe VPC CIDR

echo "SG updated to allow ICMP from Europe."

