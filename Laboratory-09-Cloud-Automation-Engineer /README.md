
# Laboratory 09: Cloud Automation Engineer

## Mission Overview

This laboratory focuses on cloud automation using Bash scripting, Linux file permissions, and cron scheduling. The mission demonstrates how repetitive administrative tasks, such as backing up important server files, can be automated to improve efficiency and consistency.

## Objectives

- Create a Bash script to automate server backups.
- Understand how Linux file permissions work.
- Use `chmod +x` to make a Bash script executable.
- Schedule recurring tasks using cron.
- Understand the importance of reliable backups and automated server maintenance.
- Document technical procedures for the client's IT team.

## Commands Executed

### 1. Create or Edit the Backup Script

```bash
nano /root/backup.sh
```

### 2. Make the Script Executable

```bash
chmod +x /root/backup.sh
```

### 3. Execute the Backup Script

```bash
/root/backup.sh
```

### 4. Configure the Cron Schedule

```bash
crontab -e
```

Add the following cron expression:

```cron
0 2 * * * /root/backup.sh
```

### 5. Verify the Cron Schedule

```bash
crontab -l
```

### 6. Check the Backup Directory

```bash
ls -lh /root/backups
```

**Note:** These are the commands associated with the documented workflow. Keep only the commands that match the work actually performed in your terminal.

## Skills Learned

- Writing and understanding Bash scripts.
- Automating repetitive Linux administration tasks.
- Managing file permissions with `chmod`.
- Scheduling tasks with cron.
- Understanding backup scheduling and file management.
- Documenting cloud automation procedures.
- Recognizing the importance of testing, monitoring, and validating automated operations.
