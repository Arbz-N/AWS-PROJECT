#!/bin/bash

# SECURITY GROUP RULES (EUROPE)

aws ec2 authorize-security-group-ingress \
  --group-id <your-europe-sg-id> \
  --protocol tcp --port 80 --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress \
  --group-id <your-europe-sg-id> \
  --protocol tcp --port 22 --cidr 0.0.0.0/0
