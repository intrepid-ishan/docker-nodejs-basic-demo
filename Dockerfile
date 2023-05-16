# This Dockerfile is designed to build a Docker image for a Node.js application. Each instruction in this file represents a separate step or layer. Docker leverages layer caching to optimize the build process by reusing existing layers if there are no changes. To take advantage of this caching mechanism, the installation of dependencies is placed before other instructions, allowing Docker to cache them effectively.

# layer 1: It specifies the base image as node, which is the official Node.js image available on Docker Hub
FROM node:12

# layer 2: It sets the working directory inside the Docker container to /app. This is the directory where the application code will be copied and executed
# Set the working directory for any subsequent ADD, COPY, CMD, ENTRYPOINT, or RUN instructions that follow it in the Dockerfile.
WORKDIR /app

# layer 3: It copies the package.json and package-lock.json files from the host machine (where the Docker build is being executed) in current working directory (i.e app)
COPY package*.json ./

# layer 4: It runs the command npm install inside the container, which installs the dependencies based on the package.json file
# installing dependencies before copying other code, because it will help in caching and prevent from installing again and again
RUN npm install

# layer 5: copy local file to current working directory(app)
COPY . .

# layer 6: It sets the environment variable PORT to 8080, which specifies the port on which the application will listen.
ENV PORT=8080

# layer 7: It exposes port 8080 on the container, allowing external connections to reach the application.
EXPOSE 8080

# layer 8: It defines the command that will be executed when the container is started. In this case, it runs npm start, which typically starts the Node.js application.
# Exec Form (Array of strings): It helps to avoid issues related to shell interpretation or escaping of special characters.
CMD [ "npm", "start" ]
