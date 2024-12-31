#!/bin/bash
# Start PHP-FPM 7.4
service php7.4-fpm start

# Start Nginx
nginx -g "daemon off;"
