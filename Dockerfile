FROM nginx:alpine

# Remove default nginx config and content
RUN rm -rf /etc/nginx/nginx.conf /usr/share/nginx/html/*

# Copy site files
COPY index.html /usr/share/nginx/html/index.html
COPY prithvee-prof.jpeg /usr/share/nginx/html/prithvee-prof.jpeg

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
