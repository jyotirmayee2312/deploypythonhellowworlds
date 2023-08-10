# Python Docker Image Push Workflow

This repository contains a GitHub Actions workflow that automates the process of building a Python program into a Docker image and pushing it to Docker Hub using GitHub Secrets for authentication.

## Project Overview

The primary goal of this project is to streamline the process of building a Docker image from a Python program and Dockerfile and pushing it to Docker Hub. The workflow is triggered on pushes to the main branch of the repository. The key steps of the workflow include:

1. **Checks Out the Repository Code**: This initial step ensures that the code from your repository is available for the workflow.

2. **Sets up Docker Buildx for Multi-Platform Builds**: Docker Buildx is employed to enable building Docker images for multiple platforms, enhancing the versatility of your Docker images.

3. **Logs In to Docker Hub**: Utilizing the Docker Hub username and access token provided as GitHub Secrets, the workflow securely logs in to Docker Hub in preparation for pushing the image.

4. **Builds and Pushes the Docker Image**: The core of the workflow involves building the Docker image. This step utilizes the Dockerfile and Python program present in the repository to construct the image. Additionally, it accommodates multi-platform builds, allowing the image to be compatible with various architectures. The image is then pushed to Docker Hub using the credentials supplied via GitHub Secrets.

5. **Logs Out from Docker Hub**: Following the successful push of the Docker image, the workflow logs out from Docker Hub to terminate the authenticated session.

## Prerequisites

Before proceeding with setting up the workflow, ensure that you have the following prerequisites:

1. **Docker Hub Account**: If you don't already have a Docker Hub account, you can sign up at [https://hub.docker.com/](https://hub.docker.com/).

2. **GitHub Account**: You will need a GitHub account to create and manage repositories.

## Workflow Setup

To implement this workflow in your repository, follow these steps:

### Copying the Workflow File

1. Copy the contents of the [`docker_image_push.yml`](.github/workflows/docker_image_push.yml) file from this repository to your repository's `.github/workflows` directory.

### Creating GitHub Secrets

1. In your GitHub repository, navigate to "Settings" > "Secrets."

2. Click on "New repository secret."

3. Add the following secrets:
   - `DOCKER_USERNAME`: Your Docker Hub username.
   - `DOCKER_TOKEN`: Your Docker Hub access token. Generate a token with appropriate permissions from your Docker Hub account settings.

### Modifying the Workflow File

1. Open the copied `docker_image_push.yml` workflow file in your repository.

2. Customize any placeholders or variables (e.g., repository name) to align with your project's structure and Docker image settings.

### Adding Your Python Code and Dockerfile

1. Create a Python file (e.g., `app.py`) with your Python code. For instance:

   ```python
   print("Hello, Docker!")
   ```

2. Craft a Dockerfile that outlines the steps required to build your Docker image. For example:

   ```Dockerfile
   # Use an official Python runtime as a parent image
   FROM python:3.8-slim

   # Set the working directory to /app
   WORKDIR /app

   # Copy the current directory contents into the container at /app
   COPY . /app

   # Install any required packages specified in requirements.txt
   RUN pip install --no-cache-dir -r requirements.txt

   # Run app.py when the container launches
   CMD ["python", "app.py"]
   ```

## Workflow Execution

1. Once you push changes to the main branch of your repository, the GitHub Actions workflow will be automatically triggered.

2. Monitor the progress of the workflow by checking the "Actions" tab in your repository.

## Verifying the Docker Image

1. Visit your Docker Hub repository to confirm that the Docker image has been successfully pushed.

## Example Python Program and Dockerfile

Here's a basic example of a Python program and Dockerfile you could use:

### Python Program (app.py):

```python
print("Hello, Docker!")
```

### Dockerfile:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any required packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run app.py when the container launches
CMD ["python", "app.py"]
```
