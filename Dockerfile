FROM --platform=linux/arm64 nginx:latest
EXPOSE 80
EXPOSE 443
COPY nginx.conf /etc/nginx/nginx.conf