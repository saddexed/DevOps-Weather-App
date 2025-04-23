FROM nginx:alpine

# Copy the application files to the Nginx HTML directory
COPY src/index.html /usr/share/nginx/html/
COPY src/style.css /usr/share/nginx/html/
COPY src/scripts.js /usr/share/nginx/html/

# Copy the Nginx configuration file
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]