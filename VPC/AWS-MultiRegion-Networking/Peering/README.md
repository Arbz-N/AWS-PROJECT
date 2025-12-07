PC/AWS-MultiRegion-Networking/Peering
Introduction

  This project demonstrates how to build a multi-region AWS network setup using EC2, VPCs, subnets, Internet Gateways (IGWs), NAT Gateways, Route Tables, Security Groups, and VPC Peering between USA (us-east-1) and Europe (eu-west-2) regions.

Key features and benefits:

  Multi-Region Networking: Connect VPCs across different AWS regions (USA → Europe) securely.
  High Availability: Use public and private subnets with NAT gateways to provide secure outbound internet access for private resources.
  VPC Peering: Enable private communication between regions without traversing the public internet.
  Scalable Infrastructure: Fully automated deployment using AWS CLI scripts.
  Hands-on Learning: Learn AWS networking concepts like route tables, IGWs, subnets, security groups, and peering.

Prerequisites

  Before deploying this project, make sure you have:
  AWS CLI installed and configured with your AWS account.
  IAM user with permissions to create VPC, Subnet, EC2, IGW, Route Tables, NAT, and Security Groups.
  Key Pairs created in both regions for EC2 SSH access.
  Basic knowledge of AWS networking concepts (VPC, Subnet, Route Table, IGW, NAT, Security Groups).
  Patience and attention – Do not just execute scripts blindly; read and understand each file first.
  Project Deployment Steps
  Follow the steps region-wise, starting from USA:
.
1- USA Region (us-east-1)

  Create VPC
  vpc-create.sh → Creates the main VPC for the USA region.
  
  Create Public Subnet
  subnet-public.sh → Sets up a public subnet and enables auto-assign public IP.
  
  Create Private Subnet
  subnet-private.sh → Creates a private subnet for resources that need NAT access.
  
  Create Internet Gateway
  igw-create.sh → Creates and attaches IGW to VPC.
  
  Create Route Table
  route-table-public.sh → Creates a public route table and associates it with the public subnet.
  
  Launch EC2 Instances
  ec2-launch.sh → Launch EC2 in the public subnet with the key pair.
  
  Setup Security Group Rules
  sg-rules.sh → Add HTTP, SSH, and ICMP rules (for peering communication).
  
  NAT Gateway Setup
  nat-gateway.sh → Creates NAT Gateway in public subnet.
  route-nat.sh → Creates route from private subnet to NAT Gateway.
  
  VPC Peering to Europe
  vpc-peering.sh → Creates VPC peering connection from USA to Europe VPC.

2- Europe Region (eu-west-2)

  Create VPC
  vpc-create.sh → Creates main VPC for Europe.
  
  Create Public Subnet
  subnet-public.sh → Sets up public subnet and enables auto-assign public IP.
  
  Create Internet Gateway
  igw-create.sh → Creates and attaches IGW to Europe VPC.
  
  Create Route Table
  route-table-public.sh → Creates public route table and associates it with the public subnet.
  
  Launch EC2 Instances
  ec2-launch.sh → Launch EC2 in public subnet.
  
  Setup Security Group Rules
  sg-rules.sh → Add HTTP, SSH, and ICMP rules.
  
  Accept VPC Peering from USA
  vpc-peering-accept.sh → Accepts peering connection from USA.

Testing the Setup

  Ping EC2 Instances Across Regions
  From EC2 in USA, try pinging EC2 in Europe (or vice versa) using private IP addresses.
  Ensure security group rules allow ICMP traffic.

Verify Internet Access

  Launch a private subnet EC2 instance in USA.
  Try accessing the internet via NAT gateway.
  Check Routes
  Verify route tables have correct routes for VPC peering and NAT gateway.
  Important Notes
  Do not blindly execute scripts. Read each file (*.sh) carefully before running.
  Replace all placeholders like <your-vpc-id>, <your-subnet-id>, <your-keypair-name> with your own values.
  The project is modular; you can deploy parts step by step or region by region.
  Scripts are designed to be idempotent, but verify resources to avoid duplication.

💡 Learning Tip: If you are deploying this project for practice or learning only, don’t forget to delete all the resources afterwards to avoid unnecessary AWS charges.
