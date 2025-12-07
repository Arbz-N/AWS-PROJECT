#!/bin/bash

# SECURITY GROUP RULES (USA)

aws ec2 authorize-security-group-ingress \
  --group-id <your-sg-id> \
  --protocol tcp --port 80 --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress \
  --group-id <your-sg-id> \
  --protocol tcp --port 22 --cidr 0.0.0.0/0

echo "SG rules applied (USA)."
