# Laravel

## Enter Docker Shell
Right-click on the running Docker container and then attach the Shell.

![img](./docimg/attach_shell.png)

## Execute the following commands in the Docker shell

### Switch to the /var/www/html folder

```sh
cd /var/www/html/
```

### Create a Laravel Project  
This step is not necessary if you prefer to leave the existing example Laravel project from Git as it is.

```sh
composer create-project --prefer-dist laravel/laravel project_name
```

### Install Laravel

```sh
cd project_name && composer install
```

```sh
sudo chown -R www-data:www-data /var/www/html/project_name/storage
```