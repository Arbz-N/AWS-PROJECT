#!/bin/bash

# ACCEPT VPC PEERING CONNECTION (EUROPE - eu-west-2)


aws ec2 accept-vpc-peering-connection \
  --vpc-peering-connection-id <your-peering-connection-id>

echo "VPC Peering Accepted in Europe (eu-west-2). Replace <your-peering-connection-id>."
