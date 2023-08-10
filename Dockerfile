# Use the official Python base image with version tag
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the 'hello-world.py' file from the host to the container
COPY hello-world.py /app

# Define the command to run when the container starts
CMD [ "python", "hello-world.py" ]

