# Azure AKS Terraform CI/CD Demo

This repository showcases how to automate the build, deployment and infrastructure provisioning of a containerised application on Microsoft Azure. The project uses **Terraform** to deploy an Azure Kubernetes Service (AKS) cluster and **Azure DevOps Pipelines** to build the application, run tests and provision infrastructure through code.

## Architecture overview

- **Infrastructure as Code:** Terraform defines an Azure resource group and AKS cluster in the `infra/` directory. Declaring variables and outputs separately simplifies configuration and follows best practices for structuring Terraform projects【963479772441635†L173-L183】.
- **Application:** A lightweight Python Flask API is stored in the `app/` directory. It exposes a single endpoint and is packaged in a Docker image.
- **Continuous Integration:** Azure Pipelines build the Docker image and run tests on every push. Pipeline YAML files allow teams to define build tasks declaratively. A typical pipeline fetches code, installs dependencies, builds the container and publishes build artifacts【318377132830002†L272-L289】.
- **Continuous Delivery:** Deployment stages are added to the pipeline to apply Terraform configurations and deploy the application to AKS. Automating deployment across dev, staging and production environments makes the release process predictable and repeatable【318377132830002†L291-L299】. Azure Pipelines integrates tightly with Azure Repos or GitHub and supports YAML pipelines or the classic editor【318377132830002†L272-L280】.
- **Release pipeline:** The example `.azure-pipelines.yml` file defines stages for building, provisioning infrastructure and deploying the app. You can extend it with approval gates, multi‑environment deployments and rollback steps as described in Azure DevOps best practices【318377132830002†L390-L415】.

## Repository structure

```
azure-aks-terraform-cicd/
├── app/                   # Flask application source code
│   ├── main.py
│   ├── requirements.txt
│   └── Dockerfile
├── infra/                 # Terraform configuration for Azure
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── .azure-pipelines.yml    # Azure DevOps pipeline definition
└── README.md              # Project documentation (this file)
```

## Getting started

1. Install prerequisites: Terraform, Azure CLI, Docker and optionally `kubectl`.
2. Configure an Azure subscription and service principal with permissions to create resource groups and AKS clusters.
3. In the `infra/` directory run `terraform init` and `terraform apply` to provision the AKS cluster.
4. Build and push the application container to Azure Container Registry (ACR) or another registry.
5. Apply Kubernetes manifests or Helm charts (not included) to deploy the app to AKS.
6. Set up an Azure DevOps pipeline referencing `.azure-pipelines.yml`. The pipeline includes stages to build the Docker image, execute Terraform to provision infrastructure and deploy the application. Use variable groups or secret variables to store credentials such as service principal IDs and registry logins.

This project demonstrates Azure DevOps CI/CD practices alongside infrastructure as code. Feel free to customise the pipeline and Terraform configuration to fit real‑world use cases.