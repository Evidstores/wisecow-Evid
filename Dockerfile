FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Install required tools
RUN apt-get update && \
    apt-get install -y cowsay fortune netcat && \
    rm -rf /var/lib/apt/lists/*

# Copy your Wisecow script into the container
COPY wisecow.sh /wisecow.sh
RUN chmod +x /wisecow.sh

# Expose the port
EXPOSE 4499

# Start the app
CMD ["/wisecow.sh"]
