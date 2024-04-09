---

# Python Web Application Deployment Guide

Welcome to the comprehensive deployment guide for setting up and running your Python-based web application.

## Prerequisites

Before starting, ensure you have administrative or root access to perform installations.

## Step 1: Install Git

### Windows

- Download the installer from [Git's official site](https://git-scm.com/download/win).
- Run the installer and follow the prompts. Make sure to select the option to add Git to your system PATH.

### macOS

  ```bash
  brew install git
  ```

### Linux (Ubuntu/Debian)

- Open a terminal and update your package lists:
  ```bash
  sudo apt update
  ```
- Install Git with apt-get:
  ```bash
  sudo apt-get install git
  ```
- Verify the installation:
  ```bash
  git --version
  ```

## Step 2: Install Python

### Windows

- Download the latest Python installer from the [official Python website](https://www.python.org/downloads/windows/).
- Run the installer. **Ensure you check the box "Add Python X.X to PATH"** at the bottom of the installer window.

### macOS

- The latest versions of macOS come with Python 2.7 pre-installed. However, we recommend using Python 3.
- You can install Python 3 via Homebrew (a package manager for macOS):
  ```bash
  brew install python
  ```

### Linux (Ubuntu/Debian)

- Update your package list:
  ```bash
  sudo apt update
  ```
- Install Python 3 and pip (Python's package installer):
  ```bash
  sudo apt install python3 python3-pip
  ```

## Step 3: Clone the Repository

Clone the application repository to your local machine:

```bash
git clone https://github.com/HILL-TOPCONSULTANCY/WelcomeApp.git
cd WelcomeApp
```

## Steps 4 to 6: Create a Virtual Environment, Install Dependencies, and Run the Application

Refer to the previous instructions for creating a virtual environment, installing dependencies, and running the application.

## Step 7: Access the Application in a Browser

Open your web browser and go to `http://localhost:5000` to view your application.

---

This guide provides a starting point. Depending on your specific application requirements, additional configuration or dependencies may be necessary.
---

# Application Deployment Guide

This guide outlines the steps required to clone, build, and deploy the web application to an Amazon EC2 instance using Docker.

## Prerequisites

- Git installed on your local machine.
- An Amazon AWS account.
- An EC2 instance running Ubuntu Server.
- Docker installed on your local machine.
- A Docker Hub account or access to another Docker registry.

## Step 1: Clone the Repository

Clone the application repository to your local machine using Git:

```bash
git clone https://github.com/HILL-TOPCONSULTANCY/WelcomeApp.git
cd WelcomeApp
```

## Step 2: Set Up Your EC2 Instance

1. Launch an Amazon EC2 instance using the Ubuntu Server AMI.
2. Configure the instance's security group to allow inbound traffic on port 80 (HTTP) and 22 (SSH).
3. Connect to your instance via SSH:

```bash
ssh -i your-key.pem ubuntu@your-ec2-public-ip-address
```

## Step 3: Install Docker on EC2

Update the package list and install Docker on your EC2 instance:

```bash
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
```

Optionally, add your user to the Docker group:

```bash
sudo usermod -aG docker ${USER}
```

Log out and log back in for the group change to take effect.

## Step 4: Build the Docker Image

Navigate to the project directory and build the Docker image:

```bash
docker build -t your-application-name:latest .
```

## Step 5: Tag and Push the Docker Image

Tag your Docker image for your Docker Hub repository (replace `your-dockerhub-username` with your actual Docker Hub username):

```bash
docker tag WelcomeApp:latest hilltop/WelcomeAppe:latest
```

Push the image to Docker Hub:

```bash
docker push hilltop/WelcomeAppe:latest
```

## Step 6: Pull and Run the Docker Image on EC2

On your EC2 instance, pull the Docker image from Docker Hub:

```bash
docker pull hilltop/WelcomeApp:latest
```

Run the Docker container:

```bash
docker run -d -p 80:80 hilltop/WelcomeApp:latest
```

## Step 7: Access the Application

Your application should now be accessible through your EC2 instance's public IP address:

```
http://your-ec2-public-ip-address
```

---

Replace placeholder `your-dockerhub-username` with actual values specific to your project and Docker Hub account. This guide assumes you are using Docker Hub as your container registry, but you can adjust the instructions for any other registry you might be using.
