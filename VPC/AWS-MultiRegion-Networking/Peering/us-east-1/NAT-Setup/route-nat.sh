#!/bin/bash

# CREATE ROUTE FOR PRIVATE SUBNET VIA NAT GATEWAY (USA)


aws ec2 create-route \
  --route-table-id <your-public-rt-id> \      # Replace with your Public Route Table ID
  --destination-cidr-block 10.0.1.0/24 \     # Replace with your Private Subnet CIDR
  --nat-gateway-id <your-natgw-id>           # Replace with your NAT Gateway ID

echo "Route for Private Subnet via NAT Gateway created successfully."
