FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends bash coreutils && apt-get clean && rm -rf /var/lib/apt/lists/*
CMD ["/bin/bash"]

#docker build -t my-minimal-ubuntu .
#docker run -it my-minimal-ubuntu