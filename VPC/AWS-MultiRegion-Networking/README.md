AWS Multi-Region Network Infrastructure (USA + Europe)
VPC • Subnets • IGW • EC2 • Routing • NAT • Peering (Via AWS CLI)

This project demonstrates how to deploy a complete AWS multi-region network using the AWS CLI only.
Two regions are deployed:

🇺🇸 USA (us-east-1)
🇪🇺 Europe (eu-west-2)

Architecture includes:

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Table
- NAT Gateway
- EC2 Instances
- Security Groups
- VPC Peering (US ↔ EU

Prerequisites

Ensure the following before deployment:

1. Install AWS CLI
  aws --version

2. Configure AWS Credentials
  aws configure

3. Required IAM Permissions

  CreateVpc
  CreateSubnet
  RunInstances
  CreateInternetGateway
  CreateNatGateway
  CreateRouteTable
  CreateRoutes
  CreateVpcPeeringConnection
  AuthorizeSecurityGroupIngress
  (AdministratorAccess recommended for practice.)

4. Select Region

  USA (default):
  aws configure set region us-east-1

  Europe: (London)
  aws configure set region eu-west-2
