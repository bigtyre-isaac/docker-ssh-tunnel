This docker container is designed to setup and maintain a persistent SSH tunnel to a single port on a remote host. It then exposes this for other containers to use.

It relies on a private key for authentication, which should be provided as a user secret called user_ssh_key. Configure the ssh user, destination server and destination port via environment variables. See the docker-compose file below for an example.

```
services:
  ssh-tunnel:
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - SSH_SERVER=bigtyre.com.au          # Replace with the actual hostname or IP of host1
      - SSH_USER=zabbix-agent
      - SSH_TUNNEL_PORT=10050
      - SSH_TUNNEL_HOST=127.0.0.1
    ports:
      - "10050:10000"
    secrets:
      - user_ssh_key
secrets:
  user_ssh_key:
    file: key
```