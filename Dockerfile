# Use the official Node.js image as the base image
FROM node:16.20.0

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and yarn.lock files to the working directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code to the working directory
COPY . .

RUN yarn build

# Serve the build folder using a simple static server
RUN yarn global add serve

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["serve", "-s", "build", "-l", "3000"]
