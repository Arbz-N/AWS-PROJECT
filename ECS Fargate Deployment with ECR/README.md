#  ECS Fargate Deployment with ECR, Rolling Updates & Health Checks

---

##  Project Overview

This project demonstrates a **production-style container deployment workflow on AWS ECS using Fargate**.  
You will learn how to:

- Build a **Node.js + TypeScript** application using **multi-stage Docker builds**
- Push container images to **Amazon ECR**
- Deploy containers on **Amazon ECS (Fargate)**
- Expose the application using an **Application Load Balancer**
- Perform **rolling deployments**
- Handle **automatic rollback** using **container health checks**
- Clean up AWS resources safely after practice

The project intentionally introduces an application error to show **how ECS protects your service automatically**.

---

##  Prerequisites

Before starting, make sure you have:

- AWS Account
- IAM user/role with permissions for:
  - ECR
  - ECS
  - Fargate
  - ALB
- AWS CLI configured
- Docker installed
- Node.js & npm
- Basic understanding of:
  - Docker
  - AWS ECS & ECR
  - Load Balancers

---

##  Project Folder Structure

    ```text
    .
    ├── Dockerfile
    ├── package.json
    ├── package-lock.json
    ├── tsconfig.json
    └── src
        ├── index.ts
        └── routes
            └── routes.ts


Docker Image (Multi-Stage Build)
    Purpose
    
    Reduce final image size
    Separate build-time and runtime dependencies
    Improve security & performance

Amazon ECR (Elastic Container Registry)

    Steps:
    
    Create an ECR repository
    Build Docker image locally
    Tag image with ECR URI
    Push image to ECR
    
    Why ECR?
    
    Secure private registry
    Tight integration with ECS

ECS Cluster (Fargate)
An ECS Cluster is a logical group where your containers run.
It provides the environment and capacity (Fargate or EC2) to run tasks and services.
we will use fargate for this project
    
    Cluster type: AWS Fargate
    No EC2 instances required
    Fully serverless container runtime
    
    Benefits
    
    No infrastructure management
    Auto scaling
    Pay only for running tasks

Task Definition
A Task Definition is a blueprint for running containers.
It defines:

Which Docker image to run
CPU & memory
Ports
Environment variables
Health checks
Logging

    Key Settings
    
    Launch type: Fargate
    OS / Architecture: Linux / x86_64
    Network mode: awsvpc
    CPU: 1 vCPU
    Memory: 2 GB
    Container Configuration
    Container name: test-container
    Image: Pulled from ECR using SHA digest
    Container port: 8000
    Protocol: TCP / HTTP
    
     Health Check Configuration
    CMD-SHELL
    curl -f http://localhost:8000/health || exit 1
    
    
    Interval: 30 seconds
    ECS marks container UNHEALTHY if /health fails

ECS Service 
An ECS Service is responsible for running and maintaining tasks.

Keeps the desired number of tasks running
Replaces failed tasks automatically
Handles rolling updates
Integrates with load balancers
Supports auto scaling

    Configuration

    Desired tasks: 2
    Deployment strategy: Rolling Update
    Load balancer: Application Load Balancer
    Target group attached
    
    Auto Scaling
    
    Min tasks: 2
    Max tasks: 10
    Metric: CPU Utilization
    Target: 70%


Application Code (routes.ts)

    Initial Version (Healthy)
    router.get("/health", (req, res) => {
      res.status(200).json({ message: "Everything is good here 👀" });
    });


Result

    Health check passes
    ECS tasks remain healthy
    Load balancer routes traffic normally

Version Update – Safe Deployment (v2)

    Change response message:
    
    res.json({ message: "Hello from Docker v2 🎉" });


    Steps:

    Build new image
    Push to ECR
    Update ECS service
    Enable Force new deployment

Result:

    Zero downtime
    Old containers replaced gradually

Failure Simulation – Version v3

    Introduce intentional error in routes.ts:
    
    router.get("/health", (req, res) => {
      throw new Error("Internal Server Error");
    });

What Happens?

    /health endpoint returns 500
    ECS health check fails
    Container marked UNHEALTHY

Automatic Rollback (Key Learning)

    Because:
    
    Rolling update enabled
    Health checks configured
    ECS behavior:
    Stops unhealthy new tasks
    Keeps previous healthy tasks running
    Service continues without downtime
    No manual intervention required

Cleanup (After Practice)

    Step-by-Step Cleanup
    
    1.Update ECS service:
        - Desired tasks = 0
        - Auto scaling min = 0
        - Force new deployment
    2.Wait for tasks to stop
    3.Delete ECS service
    4.Deregister task definition
    5.Delete ECS cluster
    6.Delete ECR images
    7.Delete ECR repository