# Specify the base image
FROM amazonlinux:2

# Install OpenSSH server
RUN yum install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    ssh-keygen -A

# Expose the SSH port
EXPOSE 22

# Start the SSH server in the container
CMD ["/usr/sbin/sshd", "-D"]
