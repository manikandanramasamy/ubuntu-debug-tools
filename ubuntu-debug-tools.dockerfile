# Use the official Ubuntu image as the base for the container
FROM ubuntu:latest

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install networking utilities, TLS tools, and certificates
RUN apt-get update && apt-get install -y \
    iputils-ping \
    curl \
    wget \
    dnsutils \
    net-tools \
    iproute2 \
    traceroute \
    telnet \
    netcat-openbsd \
    nmap \
    iptables \
    tcpdump \
    mtr \
    bridge-utils \
    iputils-tracepath \
    openssl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to the root directory
WORKDIR /root


# Set bash as the entrypoint to keep it interactive
ENTRYPOINT ["/bin/bash"]

# Default command: Start bash in interactive mode
# Default command: Start bash interactively and keep the container alive
CMD ["-c", "echo 'Hello from Docker!' && tail -f /dev/null"]
