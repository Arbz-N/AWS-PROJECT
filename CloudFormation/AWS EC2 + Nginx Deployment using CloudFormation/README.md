# AWS EC2 + Nginx Deployment using CloudFormation

This repository contains a simple **AWS CloudFormation template** to deploy an EC2 instance with Nginx installed and a sample web page. It also creates a Security Group and an Elastic IP for the instance.

---

## **Prerequisites**

Before you deploy this CloudFormation stack, make sure you have:

1. **AWS Account**  
   - Access to create EC2 instances, Security Groups, and Elastic IPs.

2. **AWS CLI Installed and Configured**  
   - [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)  
   - Configure it with `aws configure` using your Access Key and Secret Key.

3. **Key Pair**  
   - An existing EC2 Key Pair in your desired AWS region.  
   - You will need this to SSH into your EC2 instance.

4. **VPC & Subnet**  
   - An existing VPC and Subnet where the EC2 instance will be deployed.

5. **IAM Permissions**  
   - Permissions to create EC2, Security Groups, and Elastic IPs.

---

## **Files in this Repository**

- `ec2-nginx.yml` → CloudFormation template to deploy:
  - EC2 instance (t3.micro by default)
  - Security Group allowing HTTP (80) and SSH (22)
  - Elastic IP attached to the EC2 instance
  - Nginx installed via UserData
  - Sample `index.html` webpage

---

## **How to Deploy**

1. **Modify the template** (`ec2-nginx.yml`) to replace placeholders:
   ```yaml
   ImageId: ami-xxxxxxxxxxxxxxx       # Your AMI ID
   SubnetId: subnet-xxxxxxxxxxxx     # Your Subnet ID
   KeyName: your-key-pair-name       # Your EC2 Key Pair name
   Tags:
     - Key: Name
       Value: YourInstanceName       # Instance Name
   VpcId: vpc-xxxxxxxxxxxxxxxxx      # Your VPC ID
   GroupName: YourSecurityGroupName  # Security Group Name

2.Validate the template (optional but recommended):

aws cloudformation validate-template --template-body file://ec2-nginx.yml


3.Create the stack:

aws cloudformation create-stack \
  --stack-name MySimpleStack \
  --template-body file://ec2-nginx.yml \
  --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM


4.Check stack status:

aws cloudformation describe-stacks --stack-name MySimpleStack


5.Access your webpage:

Open the EC2 instance's Elastic IP in a browser.
You should see the sample Nginx webpage.
