FROM alpine:latest

# Install SSH client
RUN apk --no-cache add openssh-client

# Expose the port to be used as the tunnel endpoint
EXPOSE 10000

# Set environment variables for SSH configuration
ENV SSH_TUNNEL_HOST=127.0.0.1
ENV SSH_TUNNEL_PORT=10050
ENV SSH_USER=ssh-user
ENV SSH_SERVER=ssh-server

# Copy the entrypoint script
COPY entrypoint.sh /usr/bin/entrypoint.sh

# Ensure the script is executable
RUN chmod 777 /usr/bin/entrypoint.sh

# Start the SSH tunnel
CMD ["sh", "-c", "sh /usr/bin/entrypoint.sh; ssh -o StrictHostKeyChecking=no -v -N -L 0.0.0.0:10000:$SSH_TUNNEL_HOST:$SSH_TUNNEL_PORT -i /root/.ssh/id_rsa $SSH_USER@$SSH_SERVER"]