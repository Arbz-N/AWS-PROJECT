#!/bin/bash

# ENABLE AUTO-ASSIGN PUBLIC IP ON SUBNET (USA)

aws ec2 modify-subnet-attribute \
  --subnet-id <your-subnet-id> \     # Replace with your Subnet ID
  --map-public-ip-on-launch

echo "Auto-assign Public IP enabled for Subnet: <your-subnet-id>"
