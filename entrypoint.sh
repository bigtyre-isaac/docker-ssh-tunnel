#!/bin/bash

# Copy the SSH key secret to the expected location in the container
echo "Copying SSH key from secrets"
mkdir /root/.ssh
cp /run/secrets/user_ssh_key /root/.ssh/id_rsa

echo "Modifying permissions"
chmod 0400 /root/.ssh/id_rsa

# Start your application with the SSH key
echo "Running application"