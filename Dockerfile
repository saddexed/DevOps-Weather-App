FROM nginx:alpine
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY src/ /usr/share/nginx/html/
EXPOSE 5000
CMD ["nginx", "-g", "daemon off;"]