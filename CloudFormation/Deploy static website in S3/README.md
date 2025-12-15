# S3 Static Website Hosting using CloudFormation

## Overview

This project demonstrates how to host a static website on AWS S3 using CloudFormation.
Once deployed, your website becomes publicly accessible without manually configuring S3 or policies.






## Prerequisites

- AWS Account with proper permissions for CloudFormation, S3
- AWS CLI installed and configured
- `index.html` (and optionally `error.html`) files ready for deployment

---

## Deployment Steps

### 1. Validate CloudFormation Template

```bash
aws cloudformation validate-template --template-body file://<your-file>.yml

2. Create CloudFormation Stack
aws cloudformation create-stack \
  --stack-name <your-stake-name> \
  --template-body file://<your-file>.yml

Note: Bucket name must be globally unique, otherwise stack creation will fail.

3. Upload Website Files to S3

aws s3 cp index.html s3://<your-bucket-name>/ --acl public-read
You can also upload additional files (CSS, JS, images) in the same way.

4. Access Website

Once files are uploaded, your website will be available at:
http://<your-bucket-name>.s3-website-<region>.amazonaws.com
Replace <region> and <bucket-name> with the bucket region (e.g., us-east-1).

5.Delete resources if deploying for practice or learning purposes to avoid charges:

aws cloudformation delete-stack --stack-name <your-stack-name>