# Use the lightweight Nginx image
FROM nginx:alpine

# Copy your HTML file into the Nginx server folder
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to access the site
EXPOSE 80