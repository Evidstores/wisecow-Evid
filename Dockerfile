# Use Ubuntu as base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    cowsay fortune-mod netcat-openbsd bash

# Copy Wisecow script into container
COPY wisecow.sh /wisecow.sh

# Make the script executable
RUN chmod +x /wisecow.sh

# Expose the port used in the script
EXPOSE 4499

# Run the script
CMD ["/wisecow.sh"]
