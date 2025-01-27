# Use Amazon Linux 2 as the base image
FROM amazonlinux:2

# Update and install necessary packages
RUN yum update -y && \
    yum install -y \
    python3 \
    vim \
    curl \
    unzip \
    aws-cli \
    systemd && \
    yum clean all

# Install OpenSSH server
RUN yum install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    ssh-keygen -A

# Set the working directory
WORKDIR /root

# Expose any ports (optional)
EXPOSE 22 80

# Default command to run a bash shell
CMD ["/bin/bash"]

# Start the SSH server in the container
CMD ["/usr/sbin/sshd", "-D"]
