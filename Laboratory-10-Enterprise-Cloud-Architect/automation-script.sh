# Requirement 4: Automation Scripts (Disaster Recovery/Ops)

## Objective
Automate server configuration backups using a Bash script and Cron Job.

## Script
The `scripts/backup.sh` script creates a timestamped compressed archive of the `/etc` directory. This directory contains important Linux configuration files.

## Backup Location
`/var/backups/server-ops/`

## Backup Schedule
The Cron Job runs daily at 2:00 AM.

```cron
0 2 * * * /bin/bash /home/ubuntu/server-ops/backup.sh
```

Replace the example path with the actual location of the script.

## Retention Policy
Backup archives older than seven days are automatically deleted to manage disk usage.

## Verification
- Execute the script manually to test it.
- Check the backup directory for generated `.tar.gz` files.
- Review `/var/log/server-backup.log` for success or failure messages.
- Run `sudo crontab -l` to verify the schedule.

## Security and Recovery
Backup files should have restricted permissions and should be copied to a separate storage location for protection against server failure. To inspect an archive, use `tar -tzf backup-file.tar.gz`. Test restoration on a separate system before restoring production configuration files.

## Limitation
This script backs up `/etc` configuration files only. It does not back up application data, Docker volumes, or databases.

