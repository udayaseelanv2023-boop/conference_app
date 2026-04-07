# Use Nginx to serve the website
FROM nginx:alpine

# Copy your local HTML file into the container
COPY index.html /usr/share/nginx/html/index.html

# Open port 80
EXPOSE 80