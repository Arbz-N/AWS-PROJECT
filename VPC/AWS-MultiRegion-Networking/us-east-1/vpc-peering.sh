#!/bin/bash

# CREATE VPC PEERING (USA → EUROPE)


aws ec2 create-vpc-peering-connection \
  --vpc-id <your-USA-vpc-id> \
  --peer-vpc-id <your-EU-vpc-id> \
  --tag-specifications 'ResourceType=vpc-peering-connection,Tags=[{Key=Name,Value=YourPeeringName}]'

echo "VPC Peering Request Sent (USA → Europe)."
