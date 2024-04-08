# Use the Nginx image from Docker Hub
FROM nginx:alpine

# Remove the default Nginx index.html file
RUN rm /usr/share/nginx/html/*

# Copy the static content (HTML, CSS) into the container
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container has provisioned.
CMD ["nginx", "-g", "daemon off;"]
