## Checkpoint 5 - The Container Lifecycle

### 1. List Running Containers

```bash
docker ps
```

This command displays the Docker containers that are currently running.

### 2. Stop the Running Container

```bash
docker stop <container_id>
```

This command stops the active Nginx container using its container ID.

### 3. Verify It Is Stopped

```bash
docker ps -a
```

This command displays all containers and confirms that the Nginx container has been stopped.

### 4. Remove the Container Completely

```bash
docker rm <container_id>
```

This command removes the stopped Nginx container from the Docker environment.

### Screenshot

A screenshot was taken showing the execution of the Docker container lifecycle commands.

**Screenshot file:** `screenshots/container-lifecycle.png`

