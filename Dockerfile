# Base Image
FROM node:20.13.1-alpine3.20

# Set the working directory
WORKDIR /app

# Copy the local files to the container's workspace
COPY index.js .
COPY package.json .

# Expose the port 
EXPOSE 3000

# Command to run your application
CMD ["npm", "start", "index.js"]