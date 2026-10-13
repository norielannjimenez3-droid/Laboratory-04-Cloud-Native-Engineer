# Security Audit Report
## Checkpoint 2 – Research: Security Best Practices

### 1. The Principle of Least Privilege (PoLP)

The Principle of Least Privilege means giving users and applications only the permissions they need to perform their specific tasks. In cloud environments, this is important because it reduces the risk of unauthorized access, accidental changes, and data theft if an account is compromised. For example, a user who only needs to view files should not automatically receive permission to delete them.

### 2. Attack Surface

An attack surface refers to all the possible points where an attacker could attempt to access or compromise a virtual machine. These may include open network ports, running services, outdated software, weak passwords, and exposed applications. Reducing the attack surface by disabling unnecessary services, closing unused ports, and applying security updates makes the virtual machine more difficult to attack.

### 3. Default Deny Policy

A Default Deny Policy means blocking all incoming network traffic unless a specific firewall rule explicitly allows it. This approach is safer than trying to block individual hackers because attackers can use different IP addresses, tools, and methods to access a server. By allowing only trusted and necessary connections, administrators reduce unauthorized access and improve the overall security of the cloud environment.

