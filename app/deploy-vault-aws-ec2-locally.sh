# STEP 1 - EC2-SIMULATOR-BUILD CONTAINER
docker build -t local-ec2-simulator .

# STEP 2 - RUN CONTAINER
docker run -d --name ec2-simulator -p 2222:22 -p 8080:80 local-ec2-simulator

# STEP 3 - SSH INTO CONTAINER
docker build -t local-ec2-simulator .

# STEP 4 - RUN CONTAINER
docker run -d --name ec2-simulator -p 2222:22 local-ec2-simulator

# STEP 5 - SSH INTO CONTAINER
ssh root@localhost -p 2222
# Password: password

# STEP 6 - RUN CONTAINER
docker commit ec2-simulator local-ec2-simulator-updated

# Create directories
sudo mkdir -p /opt/vault/data
sudo mkdir -p /etc/vault.d
sudo mkdir -p /var/lib/vault
sudo mkdir -p /usr/local/bin

mkdir -p /opt/vault/data && mkdir -p /etc/vault.d && mkdir -p /var/lib/vault && mkdir -p /usr/local/bin

# Set ownership
sudo chown -R vault:vault /opt/vault
sudo chown -R vault:vault /etc/vault.d
sudo chown -R vault:vault /var/lib/vault

chown -R vault:vault /opt/vault && chown -R vault:vault /etc/vault.d && chown -R vault:vault /var/lib/vault

tee /etc/vault.d/vault.hcl <<EOF
storage "file" {
  path = "/opt/vault/data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1  # Only for dev/test
}

api_addr = "http://127.0.0.1:8200"
cluster_addr = "http://127.0.0.1:8201"

ui = true
disable_mlock = true  # Only for dev/test
EOF


sudo -u vault /usr/local/bin/vault server -config=/etc/vault.d/vault.hcl &

#Simulate Metadata Service (Optional)
#EC2 instances access instance metadata via http://169.254.169.254. You can simulate this by running a small HTTP server inside the container.
#
#For example:
#
#Use mock-ec2-metadata.
#Install and configure it to mimic metadata endpoints.
