# Production-Ready Full-Stack Application Deployment on AWS
## Overview

This project demonstrates a production-oriented DevOps workflow for deploying a containerized full-stack application to AWS using Infrastructure as Code, CI/CD automation and Docker.
The goal of this project was not just to deploy an application, but to design an automated, repeatable, and maintainable deployment process that reflects real-world DevOps practices.

## The solution includes:

- Infrastructure provisioning with Terraform
- Infrastructure modularization
- Dockerized frontend and backend services
- Automated CI/CD pipeline using GitHub Actions
- AWS EC2 deployment
- Automated image build and deployment workflow
- Environment-based configuration management


## Project Architecture
High-Level Architecture

![alt text](<Architectural Diagram.jpg>)



## Technologies Used
AWS
Terraform
GitHub Actions
Docker
Docker Compose
Node.js for backend
React for Frontend
MongoDB for Database
Docker Hub
Compute	AWS EC2
Version Control	Git & GitHub


## Infrastructure as Code (Terraform)

The infrastructure was provisioned using Terraform with a modular architecture to improve:
Reusability
Maintainability
Scalability
Resource decoupling.

Instead of placing all resources in a single configuration file, infrastructure components were broken into reusable modules. Each resources that were created had their own modules folder which could be decoupled later to be used for other deployments.

## Terraform Modules
### VPC Module
Responsible for:
VPC creation
Internet gateway
Route tables

### Subnet Module
Responsible for:
Subnet configuration

### Security Group Module
Responsible for:
EC2 inbound/outbound rules
Port exposure for:
SSH (22)
HTTP (80)
Application traffic

### EC2 Module
Responsible for:
EC2 provisioning
AMI selection
Instance configuration
Security group attachment


## Design Decisions
### EC2 Instance
For this project i made use of EC2 Instead of ECS/EKS because the application architecture for this implementation consisted of a relatively lightweight three-tier containerized application (frontend, backend, and database) with predictable workload requirements and limited orchestration complexity.
Given the scale and operational requirements of the system, EC2 was selected as the deployment platform because it provided:
- Full control over the host environment
- Simplified container deployment using Docker Compose
- Reduced orchestration overhead
- Easier infrastructure debugging and troubleshooting
- Straightforward CI/CD integration

Since the application did not require advanced orchestration capabilities such as:
- dynamic container scheduling
- service discovery
- horizontal pod autoscaling
- multi-node cluster management
introducing ECS or Kubernetes (EKS) would have added unnecessary architectural complexity for the scope of the workload.
Docker Compose on EC2 was therefore considered the most appropriate tool to use. 

### Githubs Actions for CI/CD
I used GitHub Actions for the CI/CD implementation because of its native integration with GitHub repositories, simplified workflow management, and reduced operational overhead compared to maintaining a self-hosted Jenkins server.

This allowed the pipeline to remain lightweight, easier to maintain, and faster to implement. 
Pipeline Workflow
The pipeline performs the following steps automatically:
-  Checkout Source Code
Pull latest application code from GitHub repository.
-  Build Docker Images
Build frontend image
Build backend image
-  Push Images to Docker Hub
Push newly built images to Docker Hub registry.
- Connect to AWS EC2 via SSH
The pipeline securely connects to the EC2 instance.
-  Deploy Updated Containers

## Assumptions Made
AWS credentials are properly configured
Docker is installed on the EC2 instance
Required ports are open in security groups
GitHub Secrets are configured before pipeline execution


## Deployment Steps
- Clone Repository
git clone <repository-url>
cd <project-directory>
-  Provision Infrastructure
cd terraform

terraform init
terraform plan
terraform apply
-  Configure GitHub Secrets
Required secrets:
DOCKER_USERNAME
DOCKER_PASSWORD
EC2_HOST
EC2_USERNAME
EC2_SSH_KEY
-  Push Code
Pushing to the configured branch automatically triggers deployment.


## Conclusion
This project demonstrates a practical implementation of a production-oriented DevOps workflow using modern tools and automation practices.
The primary focus of the solution was:

automation, infrastructure reproducibility, maintainability, deployment consistency







