#!/bin/bash

# CREATE PUBLIC ROUTE TABLE (USA)

aws ec2 create-route-table \
  --vpc-id <your-vpc-id> \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=YourPublicRTUSA}]'

echo "Public Route Table Created."
