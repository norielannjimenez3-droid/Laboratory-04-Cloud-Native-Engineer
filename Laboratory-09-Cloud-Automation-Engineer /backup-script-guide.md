# Backup Script Guide

## 1. Overview

This document explains the Bash backup script, file permissions, and automated scheduling configured for the cloud automation mission. The purpose of this task is to automate backup operations, reduce manual work, and help ensure important files are backed up regularly.

## 2. Backup Script (`backup.sh`)

The following is an example of a Bash script that creates a compressed backup of a source directory and stores it in a designated backup directory.

```bash
#!/bin/bash

# Define the source directory and backup destination
SOURCE_DIR="/var/www/html"
BACKUP_DIR="/root/backups"

# Create the backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Generate a timestamp for the backup filename
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create a compressed archive of the source directory
tar -czf "$BACKUP_DIR/backup-$TIMESTAMP.tar.gz" "$SOURCE_DIR"

# Check whether the backup completed successfully
if [ $? -eq 0 ]; then
    echo "Backup completed successfully: $BACKUP_DIR/backup-$TIMESTAMP.tar.gz"
else
    echo "Backup failed!"
    exit 1
fi
```

**Important:** This is a sample script. If a different `backup.sh` was used during the lab, replace this example with the exact code executed in the terminal.

## 3. Explanation of `chmod +x`

The command used to make the script executable is:

```bash
chmod +x /root/backup.sh
```

The `chmod` command changes file permissions. The `+x` option adds execute permission, allowing the script to be run as an executable file.

Without execute permission, the script may not run directly using `./backup.sh`. After applying the permission, it can be executed with:

```bash
/root/backup.sh
```

The command does not run the script by itself; it only changes its permissions.

## 4. Cron Job Scheduling

The cron expression used to schedule the backup is:

```cron
0 2 * * * /root/backup.sh
```

This schedules the backup script to run every day at 2:00 AM, according to the server's local time and timezone.

### Explanation of the Five Time Fields

| Field | Value | Meaning |
|---|---|---|
| Minute | `0` | Run at minute zero. |
| Hour | `2` | Run at 2 AM. |
| Day of Month | `*` | Run every day of the month. |
| Month | `*` | Run every month. |
| Day of Week | `*` | Run every day of the week. |

The final part, `/root/backup.sh`, specifies the full path of the script that cron executes.

## 5. Benefits of Automation

Automated backups help ensure that important files are copied regularly without requiring an administrator to run the command manually each day. Scheduling reduces repetitive work and helps establish a consistent backup routine.

However, administrators should verify backup completion, monitor available disk space, protect backup files, and periodically test restoration. Automation should be tested carefully before being deployed across production servers.

## 6. Conclusion

Bash scripting and cron scheduling provide a simple way to automate recurring server maintenance. Proper permissions, accurate scheduling, logging, and backup verification help make the process more reliable and easier for an IT team to maintain.
