# Automated-full-stack-gitops
## Project Overview

### Core Components and Workflow Structure

The project is organized into two main pipelines:

1. **Infrastructure Pipeline** (`infra_features` → `infra_main`)
   - Handles all infrastructure provisioning through Terraform
   - Automatically deploys monitoring stack using Ansible
   - Includes cost estimation for infrastructure changes
   - Located in main branch for centralized workflow management and also in each branch for proper triggers

2. **Application Pipeline** (`integration` → `deployment`)
   - Manages application container builds and deployments
   - Handles Docker image versioning and updates
   - Automates deployment to provisioned infrastructure

### Workflow Triggers and Placement

1. Infrastructure Workflows:
   - `terraform-validate.yml`: Triggers on push to `infra_features`
   - `terraform-plan.yml`: Triggers on PR to `infra_main`
   - `terraform-apply.yml`: Triggers on PR merge to `infra_main`
   - `ansible-monitoring.yml`: Triggers after successful terraform apply

2. Application Workflows:
   - `ci-application.yml`: Triggers on push to `integration`
   - `cd-application.yml`: Triggers on PR merge to `deployment`

### Expected Outcomes

1. Infrastructure Pipeline:
   - Automated validation of Terraform configurations
   - Cost estimation in PR comments
   - Provisioned AWS infrastructure
   - Deployed monitoring stack (Prometheus, Grafana, etc.)

2. Application Pipeline:
   - Built and versioned Docker images
   - Updated docker-compose configurations
   - Deployed application stack to infrastructure

The separation of concerns is maintained through:
- Different branches for infrastructure and application code
- Separate workflows for different stages of deployment
- Clear triggers that prevent unintended deployments

This structure ensures that:
1. Infrastructure changes are validated and cost-estimated before deployment
2. Application deployments only occur on properly provisioned infrastructure
3. Monitoring is always in place before application deployment
4. Changes can be tracked and reversed if needed. 

For a deep dive, please read this article [here](https://dev.to/afeezaa/implementing-a-complete-gitops-pipeline-infrastructure-provisioning-and-application-deployment-bpk/edit)
