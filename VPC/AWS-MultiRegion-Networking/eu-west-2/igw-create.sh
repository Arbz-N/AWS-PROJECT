#!/bin/bash

# CREATE & ATTACH INTERNET GATEWAY (EUROPE - eu-west-2)

aws ec2 create-internet-gateway \
  --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=YourIGWEU}]'

# Attach IGW to VPC (replace placeholders)
# aws ec2 attach-internet-gateway --internet-gateway-id <your-igw-id> --vpc-id <your-eu-vpc-id>

echo "IGW Created (EU). Replace placeholders and attach manually."
