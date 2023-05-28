FROM ubuntu:22.04

# Arguments defined in docker-compose.yml
ARG user
ARG uid
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/Araguaina

# Install basic aplications
RUN apt update && apt-get install -y \
    python-is-python3 \
    git \
    curl \
    zip \
    unzip 

# Install Snakemake
RUN apt install -y \
    snakemake

# Create system user
RUN useradd -m -s /bin/bash $user

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/bio-app

USER $user