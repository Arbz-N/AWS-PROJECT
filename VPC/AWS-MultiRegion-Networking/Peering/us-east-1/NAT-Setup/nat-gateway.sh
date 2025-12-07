#!/bin/bash

# CREATE NAT GATEWAY (USA)

# Allocate Elastic IP First:
# aws ec2 allocate-address --domain vpc

aws ec2 create-nat-gateway \
  --subnet-id <your-public-subnet-id> \
  --allocation-id <your-eip-allocation-id> \
  --tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=YourNATGatewayUSA}]'

echo "NAT Gateway Created. Replace placeholders."
