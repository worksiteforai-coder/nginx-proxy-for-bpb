FROM nginx:alpine

# تنظیمات پروکسی برای هدایت ترافیک به شبکه کلودفلر
RUN echo 'server { \
    listen 8000; \
    location / { \
        proxy_pass https://162.159.94.220; \
        proxy_set_header Host $http_host; \
        proxy_http_version 1.1; \
        proxy_set_header Upgrade $http_upgrade; \
        proxy_set_header Connection "upgrade"; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]