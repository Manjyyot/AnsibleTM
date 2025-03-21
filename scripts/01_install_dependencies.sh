#!/bin/bash

set -e

# Install AWS CLI
install_aws_cli() {
    echo "Installing AWS CLI..."
    wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -O awscliv2.zip
    if [ ! -f "awscliv2.zip" ] || [ $(stat -c %s "awscliv2.zip") -lt 10000 ]; then
        echo "AWS CLI zip file is missing or too small. Exiting."
        exit 1
    fi
    # Ensure unzip is installed before extracting the zip
    sudo apt update
    sudo apt install unzip -y
    unzip awscliv2.zip
    sudo ./aws/install
    # Show AWS CLI version
    aws --version
}

# Install Terraform
install_terraform() {
    echo "Installing Terraform..."
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

    # Add HashiCorp's GPG key
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

    # Add the correct HashiCorp repository based on your Ubuntu version (Jammy for 22.04, Focal for 20.04)
    sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null <<EOF
    deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main
EOF

    # Install Terraform
    sudo apt-get update
    sudo apt-get install terraform
    # Show Terraform version
    terraform -v
}

# Install Ansible
install_ansible() {
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt update
    sudo apt install -y ansible
    # Show Ansible version
    ansible --version
}

# Install Docker
install_docker() {
    echo "Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce
    sudo systemctl start docker
    sudo systemctl enable docker
    # Show Docker version
    docker --version
}

# Install Docker Compose
install_docker_compose() {
    echo "Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    # Show Docker Compose version
    docker-compose --version
}

# Install Java 17
install_java() {
    echo "Installing Java 17..."
    sudo apt update
    sudo apt install -y openjdk-17-jdk

    # Verify Java 17 installation
    if ! java -version &>/dev/null; then
        echo "Java 17 installation failed. Exiting."
        exit 1
    fi

    # Check Java version to confirm it's installed correctly
    java -version
}

# Check and install all necessary dependencies
check_and_install_dependencies() {
    install_package "aws" "install_aws_cli"
    install_package "terraform" "install_terraform"
    install_package "ansible" "install_ansible"
    install_package "docker" "install_docker"
    install_package "docker-compose" "install_docker_compose"
    install_java
}

# Function to check if a package is installed, and install it if not
install_package() {
    local package_name=$1
    local install_cmd=$2
    if ! command -v "$package_name" >/dev/null 2>&1; then
        echo "Installing $package_name..."
        eval "$install_cmd"
    else
        echo "$package_name is already installed."
    fi
}

# Start the setup process
echo "Starting dependency installation..."
check_and_install_dependencies

echo "Setup complete!"
