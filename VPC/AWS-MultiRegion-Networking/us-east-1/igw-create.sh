#!/bin/bash

# CREATE & ATTACH INTERNET GATEWAY (USA)

aws ec2 create-internet-gateway \
  --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=YourIGWUSA}]'

# Remember to attach manually after copying IGW ID
# aws ec2 attach-internet-gateway --internet-gateway-id <your-igw-id> --vpc-id <your-vpc-id>

echo "IGW Created. Attach it manually using IGW ID via Cli."
