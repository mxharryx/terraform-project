# Automate the Deployment and Management of a Scalable Web Application Infrastructure on Azure Using Terraform

## Description
This project focuses on automating the deployment and management of a scalable web application infrastructure on Azure using Terraform. The objective is to streamline the process of setting up and managing cloud resources, ensuring scalability, reliability, and ease of maintenance. It addresses the challenges of manual infrastructure management and provides a systematic approach to deploying a web application in a cloud environment.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html)
- [Visual Studio Code (VSCode)](https://code.visualstudio.com/download)
- An Azure account

## Setup Instructions

### Install Terraform
Follow the [Terraform installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli) if not already installed.

### Set Environment Variables
Ensure your environment is configured correctly by adding Terraform to your PATH.

### Run the Terraform Scripts

#### Initialize Terraform:
```bash
terraform init
```

### Plan the infrastructure
```bash
terraform plan -out main.tfplan
```

### Apply the Infrastructure:
```bash
terraform apply main.tfplan
```
Type 'yes' when prompted

## Deployment Details

### Infrastructure on Azure
The infrastructure includes a resource group, an app service plan, and a scalable web application.

### Integration with GitHub
The project is integrated with GitHub for continuous deployment using Terraform's support for Azure web app source control.

### Steps:
1. Create and configure app service plans and web apps using Terraform.
2. Set up source control integration with GitHub to automate deployments.

## Monitoring and Alerts

### Azure Monitor
Configured to monitor the deployed resources and ensure they operate within performance thresholds.

### Alerts:
1. Set up action groups for email notifications.
2. Created metric-based alerts to trigger notifications when specific thresholds are breached.
3. Configured activity log alerts to monitor the status of the web application.

## Challenges & Solutions

### Challenge
Ensuring the web application scales automatically without downtime.

### Solution
Implemented Terraform configurations that define auto-scaling rules and integrated Azure Monitor to keep track of the application's performance.
