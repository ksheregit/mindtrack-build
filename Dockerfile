# Small official nginx image (nginx is a web server, alpine is a tiny Linux)
FROM nginx:alpine

# Use our nginx settings so the app is served on port 3000
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the pre-built Vite/React files (the dist folder) into nginx's web root
COPY dist/ /usr/share/nginx/html/

# Document that the container listens on port 3000
# (the port is actually published with -p / the Kubernetes service)
EXPOSE 3000

# Start nginx in the foreground so the container keeps running
CMD ["nginx", "-g", "daemon off;"]