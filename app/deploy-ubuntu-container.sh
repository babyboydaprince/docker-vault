# DOCKER PULL CONTAINER OS IMAGTTE
docker pull ubuntu

# RUN CONTAINER
docker run -it --name ubuntu-container ubuntu bash

# START THE CONTAINER
docker exec -it ubuntu-container bash

# EXECUTE CONTAINER AND RETURNED INTERACTIVE BASH SHELL
docker exec -it ubuntu-container bash

# CONNECTS TO THE MAIN EXECURING PROCESS (MAY NOT ALWAYS BE INTERACTIVE)
docker attach ubuntu-container

