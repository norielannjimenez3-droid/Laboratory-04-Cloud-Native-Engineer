# Mission Reflection

This laboratory gave me a better understanding of Virtual Machines, containers, and Docker. One important difference between a Virtual Machine and a Docker container is their startup time. A Virtual Machine needs to start a complete operating system, so it usually takes more time and uses more computer resources. On the other hand, a Docker container shares the host operating system's kernel, so it can start much faster and requires fewer resources.

Port mapping is needed when running a web server inside a Docker container because the container has its own isolated environment. In the command `-p 8080:80`, port 8080 is the port on the host computer, while port 80 is the port where Nginx is running inside the container. This connection allows the Nginx website to be accessed through `localhost:8080`. Without port mapping, accessing the web server directly from the host would not be possible in the same way.

Using `docker rm` removes a container from the system. If files or data are stored only inside that container, they may also be deleted when the container is removed. For important data that needs to be kept, persistent storage such as Docker volumes should be used.

Containerization can also make communication between developers and IT operations easier. Developers can include the application and its required dependencies inside a container. The operations team can then use the same container when testing or deploying the application. This helps create a more consistent environment and supports better DevOps practices.

My GitHub portfolio is also becoming more organized as I complete different laboratory activities. I am now adding projects related to cloud computing, Docker, containers, technical documentation, screenshots, and reflections. These activities allow me to show the skills and knowledge I am gaining throughout my IT studies.
