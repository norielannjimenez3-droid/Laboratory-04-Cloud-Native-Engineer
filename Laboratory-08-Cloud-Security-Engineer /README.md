# Laboratory 08 – Cloud Security Engineer

## Mission Overview

This mission focuses on improving server security by configuring a host-based firewall and managing network ports. It demonstrates how firewall rules help protect a server from unauthorized access and reduce potential security risks in a cloud environment.

## Objectives

- Understand the importance of host-based firewalls in server security.
- Configure firewall rules to control incoming and outgoing network traffic.
- Identify and manage open network ports.
- Allow only the necessary services to communicate with the server.
- Understand the security risks of exposing database ports to the public internet.
- Apply basic cloud security practices to reduce a server's attack surface.

## Commands Executed

The following are common Linux UFW commands used to manage a host-based firewall. Include only the commands you actually executed during the mission.

```bash
# Check firewall status
sudo ufw status

# Enable the firewall
sudo ufw enable

# Allow SSH connections
sudo ufw allow 22/tcp

# Allow HTTP traffic
sudo ufw allow 80/tcp

# Allow HTTPS traffic
sudo ufw allow 443/tcp

# Deny incoming MySQL connections
sudo ufw deny 3306/tcp

# Display firewall rules
sudo ufw status numbered

# Delete a firewall rule by its number
sudo ufw delete <rule-number>
```

## Skills Learned

- Understanding host-based firewall protection.
- Configuring firewall rules using the Linux command line.
- Managing open and restricted network ports.
- Reducing a server's attack surface.
- Protecting database services from unauthorized network access.
- Applying the principle of least privilege to cloud security.
- Recognizing the importance of defense in depth in enterprise environments.

