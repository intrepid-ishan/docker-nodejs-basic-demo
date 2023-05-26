# Docker + Node.js

## Docker🐋
- Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. 

- Docker enables the packaging of software into containers that can be executed in any environment.

- Docker's containerization technology focuses on virtualizing the operating system rather than the hardware.

**Docker file**
- The Dockerfile contains instructions for building the Docker image

**Image**
- A Docker container image is a lightweight, self-contained package that encompasses all the necessary components to run an application, including code, runtime, system tools, system libraries, and configurations.
- Immutable in nature, an image serves as a blueprint for launching multiple containers, each running the desired software.

**Container**
- Containers are standardized units of software that encapsulate code and its dependencies, enabling seamless and reliable execution of applications across different computing environments.
- Container images are instantiated as containers during runtime.

Refer: https://docs.docker.com/get-started/overview/


## Commands💻

**Check the status of running containers:**
```
docker ps // running container
docker ps -a // running + stopped container
```

**Stop and remove all the containers:**
```
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
```

**List all the images on your system:**
```
docker images -a
```

**Remove all the images:**
```
docker rmi $(docker images -aq)
```

**Clean up the cache**
```
docker system prune -a
```

**Build the Docker image:**
```
docker build -t your-username/image-name:tag /path/to/dockerfile-directory

docker build -t ishanmakadia/basic-node-app-learn-docker:1.0 .
```

**Push Image**
```
docker login

docker push your-username/image-name:tag
```

**Run code inside a container:**
```
docker run <image>

docker run docker.io/ishanmakadia/basic-node-app-learn-docker:1.0
```

Note: The Docker container is running on port 8080, it will not be directly accessible from the local machine. To make it accessible, you can use the below command to run the Docker container:

**Forward a port from the Docker container to the local machine (Local port: 5000, Container port: 8080):**
```
docker run -p 3002:8080 <image>

docker run -p 3002:8080 docker.io/ishanmakadia/basic-node-app-learn-docker:1.0
```

**Create volume**
```
docker volume create <shared-volume-name>

docker run --mount source=<shared-volume-name>
```


**Docker compose**
```
docker-compose up
docker-compose down
```
