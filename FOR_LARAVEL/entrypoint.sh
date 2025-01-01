#!/bin/bash
# Start PHP-FPM 7.4
service php8.1-fpm start

# Start Nginx
nginx -g "daemon off;"
