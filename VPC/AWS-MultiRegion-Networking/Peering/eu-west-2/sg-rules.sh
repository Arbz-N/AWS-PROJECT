#!/bin/bash

# SECURITY GROUP RULES (EUROPE - eu-west-2)


# 1 ALLOW HTTP (PORT 80) FROM ANYWHERE
aws ec2 authorize-security-group-ingress \
  --group-id <your-europe-sg-id> \   
  --protocol tcp \
  --port 80 \
  --cidr 0.0.0.0/0

# 2. ALLOW SSH (PORT 22) FROM ANYWHERE
aws ec2 authorize-security-group-ingress \
  --group-id <your-europe-sg-id> \
  --protocol tcp \
  --port 22 \
  --cidr 0.0.0.0/0

# 3. ALLOW ICMP FROM USA VPC (AFTER PEERING)
aws ec2 authorize-security-group-ingress \
  --group-id <your-europe-sg-id> \    # Replace with your Europe SG ID
  --protocol icmp \
  --port -1 \
  --cidr 10.0.0.0/16                   # Replace with USA VPC CIDR

echo "Security Group rules applied for Europe."
