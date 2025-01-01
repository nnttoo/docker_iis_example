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
composer create-project --prefer-dist laravel/laravel nama_aplikasi
```

### Install Laravel

```sh
cd nama_aplikasi && composer install
```

```sh
sudo chown -R www-data:www-data /var/www/html/nama_aplikasi/storage
```