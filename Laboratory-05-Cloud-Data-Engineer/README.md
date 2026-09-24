# MinIO Deployment Documentation

## Technical Deployment Steps

### 1. Deploy MinIO Server

MinIO was deployed using Docker with the following command:

```bash
docker run -d -p 9000:9000 -p 9001:9001 --name minio-server -e "MINIO_ROOT_USER=cloudadmin" -e "MINIO_ROOT_PASSWORD=CloudNova2026!" minio/minio server /data --console-address ":9001"
```

The command creates and starts a Docker container named `minio-server`.

### 2. Verify the MinIO Container

The following command was used to verify that the MinIO container was running:

```bash
docker ps
```

The running container was identified as `minio-server`.

### 3. Web Console Port

The MinIO Web Console was accessed using:

```text
Port: 9001
```

Port `9000` was used for the MinIO API, while port `9001` was used for the Web Console.

### 4. Environment Variables

The `-e` flags in the Docker command were used to configure MinIO environment variables.

The first environment variable was:

```bash
-e "MINIO_ROOT_USER=cloudadmin"
```

This sets the MinIO root administrator username to `cloudadmin`.

The second environment variable was:

```bash
-e "MINIO_ROOT_PASSWORD=CloudNova2026!"
```

This sets the MinIO root administrator password.

These variables provide the administrator credentials used to log in to the MinIO Web Console.

### 5. Create the Storage Bucket

After logging into the MinIO Web Console, a bucket was created with the following name:

```text
client-photos
```

The `client-photos` bucket was used to store a sample image or text file.

### 6. Upload a Sample File

After creating the `client-photos` bucket, a sample file was uploaded using the Upload function in the MinIO Web Console.

### 7. Port Configuration

The Docker deployment mapped the following ports:

| Port | Purpose                 |
| ---- | ----------------------- |
| 9000 | MinIO S3-compatible API |
| 9001 | MinIO Web Console       |

## Deployment Summary

The MinIO object storage server was deployed using Docker. The Web Console was accessed through port `9001`, the `client-photos` bucket was created, and a sample file was uploaded successfully.
# Laboratory 05 - Cloud Data Engineer

## Mission Overview

This laboratory activity focused on deploying and managing an object storage server using MinIO and Docker. MinIO provides S3-compatible object storage for storing and managing unstructured data.

During the activity, a MinIO server was deployed inside a Docker container. The MinIO Web Console was accessed through the configured port, a storage bucket was created, and a sample file was uploaded to the bucket.

## Objectives

* Deploy a MinIO object storage server using Docker.
* Configure MinIO administrator credentials using environment variables.
* Configure Docker port mappings for MinIO.
* Access the MinIO Web Console.
* Create an object storage bucket.
* Upload a sample file to the bucket.
* Verify that the MinIO Docker container is running.
* Document the deployment process using Markdown.

## Tools Used

* KillerCoda Ubuntu Playground
* Docker
* MinIO
* MinIO Web Console
* Linux Terminal
* Web Browser
* Markdown

## Skills Learned

* Deploying applications using Docker.
* Running and managing Docker containers.
* Using Docker port mapping.
* Configuring environment variables.
* Deploying and accessing MinIO object storage.
* Creating and managing storage buckets.
* Uploading files to object storage.
* Verifying Docker container status.
* Writing technical documentation using Markdown.
