#!/bin/bash

# CREATE & ASSOCIATE PUBLIC ROUTE TABLE (USA)


# 1️⃣ CREATE ROUTE TABLE
aws ec2 create-route-table \
  --vpc-id <your-vpc-id> \                    # Replace with your VPC ID
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=YourPublicRTUSA}]'

echo "Public Route Table Created."

# 2️⃣ ASSOCIATE ROUTE TABLE WITH PUBLIC SUBNET
aws ec2 associate-route-table \
  --route-table-id <your-public-rt-id> \      # Replace with your Public Route Table ID
  --subnet-id <your-public-subnet-id>         # Replace with your Public Subnet ID

echo "Route Table associated with Public Subnet."
