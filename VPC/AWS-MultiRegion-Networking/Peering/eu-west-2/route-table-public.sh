#!/bin/bash

# CREATE PUBLIC ROUTE TABLE (EUROPE - eu-west-2)


aws ec2 create-route-table \
  --vpc-id <your-eu-vpc-id> \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=YourPublicRTEU}]'

# After creating, add route to IGW (replace placeholders)
# aws ec2 create-route --route-table-id <your-rt-id> --destination-cidr-block 0.0.0.0/0 --gateway-id <your-igw-id>

# Associate Route Table with Public Subnet
# aws ec2 associate-route-table --route-table-id <your-rt-id> --subnet-id <your-public-subnet-id>

echo "Public Route Table Created (EU). Add route & associate manually."
