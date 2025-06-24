FROM jenkins/jenkins:lts

USER root

# Install Python 3 and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install behave and selenium Python client libraries
# The --break-system-packages flag is needed for Python 3.11+ to install system-wide packages via pip
RUN pip3 install --break-system-packages \
    selenium \
    behave

WORKDIR /app

USER jenkins