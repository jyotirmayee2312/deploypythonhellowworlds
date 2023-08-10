# Docker Image Push and Deployment Documentation

## Overview

The **Docker Image Push and Deployment** project introduces an automated CI/CD (Continuous Integration/Continuous Deployment) pipeline for efficiently building, pushing, and deploying Docker images. The pipeline is orchestrated using GitHub Actions, leveraging Docker Buildx for image creation and SSH for deployment to an EC2 instance. This documentation provides a comprehensive guide to understanding, configuring, and utilizing this automation workflow.

## Workflow

The workflow is managed through a GitHub Actions configuration file located at [.github/workflows/main.yml](.github/workflows/main.yml). It encompasses the following sequential steps:

1. **Checkout Code**: Initiates by cloning the repository's codebase to prepare for processing.

2. **Set up Docker Buildx**: Configures Docker Buildx, an advanced Docker CLI plugin used for enhanced image building capabilities.

3. **Log in to Docker Hub**: Executes Docker Hub authentication using provided credentials, allowing secure access to the image registry.

4. **Build and Push Docker Image**: Utilizes Buildx to construct a Docker image, specifying the desired platform, and subsequently pushing it to Docker Hub.

5. **Log out from Docker Hub**: Ensures proper security measures by logging out from the Docker Hub session.

6. **Deploy to EC2**: Engages SSH for connecting to an EC2 instance, subsequently facilitating the following tasks:
   - Terminates and removes any existing container instances, if applicable.
   - Retrieves the Docker image from Docker Hub.
   - Initiates a new container instance on the EC2 server using the pulled Docker image.

## Prerequisites

Before you proceed with the **Docker Image Push and Deployment** project, ensure the following prerequisites are met:

- **Docker Installation**: Docker must be installed and properly configured on your local development machine. Visit the [Docker website](https://www.docker.com/) for installation instructions.

- **Docker Hub Account**: An active Docker Hub account is required for storing and managing Docker images.

- **Operational EC2 Instance**: Ensure you have an operational EC2 instance, accessible via SSH, to serve as the deployment target.

## Getting Started

To effectively utilize the **Docker Image Push and Deployment** workflow, follow these steps:

1. **Fork Repository**: Begin by creating a fork of this repository on your personal GitHub account.

2. **Set up Secrets**: Configure essential secrets in the repository settings:
   - `DOCKER_TOKEN`: Docker Hub access token.
   - `DOCKER_USERNAME`: Docker Hub username.
   - `EC2_HOST`: Public IP or hostname of the target EC2 instance.
   - `SSH_USERNAME`: SSH username for EC2 instance access.
   - `SSH_PRIVATE_KEY`: Private SSH key for secure authentication.

3. **Workflow Customization (Optional)**: Tailor the [.github/workflows/main.yml](.github/workflows/main.yml) configuration to meet specific project requirements.

4. **Trigger Workflow**: Push changes to the `main` branch to activate the workflow. Monitor the GitHub Actions interface to track the workflow's progression.
