#!/bin/bash

# CREATE Subnet (EUROPE Region - eu-west-2)

aws ec2 create-subnet \
  --vpc-id <your-europe-vpc-id> \
  --cidr-block 10.0.0.0/24 \
  --availability-zone eu-west-2a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=YourPublicSubnetEU}]'
