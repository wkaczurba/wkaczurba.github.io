# Docker various issues.

1. Error while creating docker overlay network: 
   ```
   docker network create -d overlay --attachable my-attachable-overlay
   ```
   **Error:**
   `Error response from daemon: no VNI provided`

   `Error response from daemon: no VNI provided`.

   **Solution:**
   Make sure the docker swarm mode is enabled:
   
   ```docker swarm init```

   Docs:
    - https://docs.docker.com/network/drivers/overlay/
    - https://docs.docker.com/engine/swarm/key-concepts/
2. 
