docker build -t local-ec2-simulator .

docker run -d --name ec2-simulator -p 2222:22 -p 8080:80 local-ec2-simulator

docker build -t local-ec2-simulator .

docker run -d --name ec2-simulator -p 2222:22 local-ec2-simulator

ssh root@localhost -p 2222
# Password: password

docker commit ec2-simulator local-ec2-simulator-updated


#Simulate Metadata Service (Optional)
#EC2 instances access instance metadata via http://169.254.169.254. You can simulate this by running a small HTTP server inside the container.
#
#For example:
#
#Use mock-ec2-metadata.
#Install and configure it to mimic metadata endpoints.
