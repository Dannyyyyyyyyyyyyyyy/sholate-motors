# Use Amazon Linux 2 as base
FROM public.ecr.aws/amazonlinux/amazonlinux:2

# Install dependencies
RUN yum update -y && \
    yum install -y python3 nodejs git zip unzip docker && \
    pip3 install awscli

# Set default working directory
WORKDIR /app

# Add your build tools if needed
# COPY . .

CMD ["bash"]
