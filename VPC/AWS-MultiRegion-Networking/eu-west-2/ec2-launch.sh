#!/bin/bash

# LAUNCH EC2 INSTANCE IN PUBLIC SUBNET (EUROPE)

aws ec2 run-instances \
  --image-id <your-eu-ami-id> \
  --instance-type t3.micro \
  --count 1 \
  --subnet-id <your-europe-public-subnet-id> \
  --key-name <your-keypair-name> \
  --associate-public-ip-address \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=YourEC2EU}]'
