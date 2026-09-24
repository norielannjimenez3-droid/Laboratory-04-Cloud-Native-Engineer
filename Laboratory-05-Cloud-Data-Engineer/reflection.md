# Mission Reflection

This laboratory activity helped me understand how object storage works and why it is useful for managing large amounts of data. One important lesson I learned is that object storage is better suited for storing millions of photos than traditional block storage. Object storage is designed to handle large amounts of unstructured data, such as images, videos, and documents. It also allows data to be organized using buckets and object names, making it easier to manage and access many files.

Docker also made deploying the MinIO storage server much easier. Instead of manually installing and configuring all the required software, I was able to use a Docker command to download and run MinIO inside a container. The port mappings and environment variables allowed me to configure the server and administrator credentials directly when starting the container. This made the deployment process faster, more consistent, and easier to reproduce.

A bucket in cloud storage is a container used to organize and store objects or files. In this activity, I created a bucket named `client-photos` and uploaded a sample file into it. This helped me understand how object storage organizes data.

Large enterprise companies can protect their object storage data from physical server failures by using redundancy and backups. They can store multiple copies of data across different physical servers, storage devices, or even different data centers. They may also use replication, erasure coding, regular backups, and monitoring systems to reduce the risk of permanent data loss.

My confidence in navigating the Linux command line is also growing. At first, Docker commands and Linux commands were unfamiliar, and I encountered errors while trying to deploy MinIO. However, troubleshooting those errors taught me how to check containers, inspect Docker images, view logs, and understand command syntax. I am becoming more comfortable using the terminal and feel more confident when following technical deployment procedures.

