# Cloud Infrastructure Operational Manual

## 1. Project Overview

This project deploys a multi-tier cloud application using Ubuntu Server, Docker, Docker Compose, Nextcloud, and MariaDB.

The Ubuntu virtual machine hosts Docker containers. Nextcloud provides the web application, while MariaDB stores application data in a persistent database volume. Docker Compose defines the infrastructure in a repeatable configuration file.

### Architecture Components

- **Host machine:** Laptop used by the IT administrator.
- **Hypervisor:** VirtualBox, which runs the Ubuntu Server VM.
- **Operating system:** Ubuntu Server Linux.
- **Firewall:** UFW, which restricts network traffic.
- **Container platform:** Docker Engine and Docker Compose.
- **Web application:** Nextcloud.
- **Database:** MariaDB.
- **Persistent storage:** Docker named volumes for application and database data.

### Network Flow

Host browser → Ubuntu VM → UFW firewall → Nextcloud container → MariaDB container.

MariaDB is accessible internally to the Docker network and should not be exposed directly to the host network.

## 2. System Requirements

Recommended lab configuration:

- 64-bit host computer with hardware virtualization enabled.
- VirtualBox or another compatible hypervisor.
- Ubuntu Server 64-bit VM.
- At least 2 CPU cores, 4 GB RAM, and 20 GB disk space.
- Network connectivity for downloading packages and container images.
- A web browser on the host computer.

Production environments should allocate resources according to expected users, storage, and workload.

## 3. Initial Server Setup

Update Ubuntu:

```bash
sudo apt update
sudo apt upgrade -y
```

Check the server IP address:

```bash
ip -br address
```

Check available disk space and memory:

```bash
df -h
free -h
```

The VM must have a reachable IP address. A bridged network adapter is convenient on a compatible local network. Alternatively, configure NAT with an appropriate port-forwarding rule. Avoid exposing administrative services directly to the public internet.

## 4. Install Docker and Docker Compose

Install the Ubuntu-packaged Docker engine and Compose plugin:

```bash
sudo apt update
sudo apt install -y docker.io docker-compose-v2
sudo systemctl enable --now docker
```

Verify the installation:

```bash
sudo docker --version
sudo docker compose version
sudo systemctl status docker
```

Use `sudo docker` unless Docker permissions have been configured securely for the administrator.

## 5. Application Deployment

Create the project directory:

```bash
mkdir -p ~/cloud-infrastructure-project
cd ~/cloud-infrastructure-project
```

Create the `docker-compose.yml` file in this directory and configure the environment variables using the accompanying `.env.example` as a template.

Create a real `.env` file with unique credentials and restrict its permissions:

```bash
chmod 600 .env
```

Do not commit `.env` to GitHub.

Deploy the stack:

```bash
sudo docker compose config
sudo docker compose pull
sudo docker compose up -d
```

Verify the containers:

```bash
sudo docker compose ps
sudo docker compose logs --tail=100
```

Open the application from the host browser using:

`http://<UBUNTU-VM-IP>:8080`

Replace the placeholder with the actual VM address. HTTP is suitable only for a controlled lab network; production deployments should use HTTPS.

Complete the Nextcloud initial setup page and create the administrator account.

## 6. Firewall and Network Security

Enable the firewall only after confirming the required access rules:

```bash
sudo ufw allow OpenSSH
sudo ufw allow 8080/tcp
sudo ufw enable
sudo ufw status verbose
```

The SSH rule is necessary only when SSH administration is used. Restrict SSH to trusted source addresses in production.

Port 8080 is the example application port. Do not open port 3306 to the host or internet. MariaDB should communicate with Nextcloud through the internal Docker network.

Before deploying to production, configure HTTPS using a trusted certificate and a suitable reverse proxy. Keep Ubuntu, Docker, and container images updated.

## 7. Persistent Storage

Docker named volumes store data independently of the lifecycle of an individual container.

List volumes:

```bash
sudo docker volume ls
```

Inspect a volume:

```bash
sudo docker volume inspect cloud-infrastructure-project_db_data
```

The actual volume name may include the Compose project prefix. Use the name returned by Docker.

A container restart or VM reboot should not delete a named volume. However, persistent volumes alone do not protect against disk failure, accidental deletion, or corruption. Maintain separate backups and periodically test restoration.

## 8. Backup and Recovery

Use the repository's backup script to export the database to a protected backup directory. Database backups should be stored outside the VM or copied to another protected system.

Before a major update:

1. Verify available disk space.
2. Create a database backup.
3. Confirm that the backup file exists and is non-empty.
4. Test restoration in a separate environment whenever possible.
5. Record the backup location and recovery procedure.

A database dump does not include all Nextcloud user files. Back up the Nextcloud data directory and relevant configuration as well, preferably using a coordinated, application-consistent backup procedure.

Never rely on a backup stored only on the same virtual disk as the running application.

## 9. Maintenance Procedures

Check application health:

```bash
sudo docker compose ps
sudo docker stats --no-stream
sudo docker system df
```

Review recent application logs:

```bash
sudo docker compose logs --tail=100 nextcloud
sudo docker compose logs --tail=100 db
```

Restart services when necessary:

```bash
sudo docker compose restart
```

Apply image updates only after creating and verifying backups. Review release notes, pull approved image versions, and redeploy during a maintenance window. Pin tested image versions rather than relying on `latest` for production.

Avoid indiscriminate use of `docker system prune --volumes`, which can remove resources needed for recovery.

## 10. Troubleshooting Guide

### Application is inaccessible

- Confirm the VM is running.
- Verify its IP address with `ip -br address`.
- Check the firewall with `sudo ufw status`.
- Verify the container status with `sudo docker compose ps`.
- Check whether port 8080 is mapped correctly.

### Database connection errors

- Check both containers' logs.
- Verify the database name, username, and password.
- Confirm Nextcloud and MariaDB share the same Docker network.
- Confirm the database has completed initialization.

### Container exits unexpectedly

- Review logs with `sudo docker compose logs --tail=100`.
- Check disk space and available memory.
- Validate the Compose configuration before restarting.

### Database data appears missing

- Confirm the correct named volume is mounted.
- Check the Compose project directory and volume names.
- Do not delete volumes or recreate the database before investigating.
- Restore from a verified backup if recovery is required.

## 11. Operational Responsibilities

The IT administrator should:

- Monitor application availability, storage usage, and container health.
- Apply security patches and approved image updates.
- Protect credentials and restrict administrator access.
- Schedule and verify backups.
- Test recovery periodically.
- Document changes, incidents, and maintenance activities.
- Review firewall rules and remove unnecessary exposed services.

## 12. Deployment Acceptance Checklist

- [ ] Ubuntu Server is running and reachable from the host.
- [ ] Docker Engine and Docker Compose are installed.
- [ ] Nextcloud and MariaDB containers are running.
- [ ] The application opens in the host browser.
- [ ] Database port 3306 is not publicly exposed.
- [ ] Database data is stored in a named volume.
- [ ] Backup and health-check scripts have been tested.
- [ ] Recovery procedures have been documented.
- [ ] Screenshots and configuration files are included in the repository.
- [ ] No secrets are committed to GitHub.

## 13. Handover Notes

Record the VM address, Ubuntu version, deployment directory, approved container versions, backup destination, recovery steps, and authorized administrator contact in the private client handover record. Never include passwords or private keys in the public repository.

