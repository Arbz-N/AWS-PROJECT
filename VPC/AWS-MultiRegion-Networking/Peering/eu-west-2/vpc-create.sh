aws ec2 create-vpc \
  --cidr-block 192.0.0.0/16 \
  --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=YourVpcNameEU}]'
