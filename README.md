# Example IIS (Internet Information Services) Setup with Docker (nginx, php)

For the Indonesian version, you can click [here](./README_id.md).

## Note
- `.gitattributes` becomes important if we are developing on Windows as it relates to End Of Line (EOL).  
  [https://blog.programster.org/fixing-docker-volume-windows-line-endings-on-bash-scripts](https://blog.programster.org/fixing-docker-volume-windows-line-endings-on-bash-scripts)

## Clone This Repository

## Create Docker Image

Run the following command to create an image from the DockerFile.nginx you cloned from this repository.

```sh
docker buildx build -t my-nginx-php -f DockerFile.nginx .
```
note: Do not ignore the dot at the end

## Create Container and Run

To run the image and create the container, run the following command:

```bash
docker-compose -f ./run_docker.yml up -d
```

Now, you should be able to access it at http://localhost:8089/. It should be up and running. If you want to change the port, you can modify the `run_docker.yml` file.

## IIS Setup

- Install IIS and the URL Rewrite Module  
    https://iis-umbraco.azurewebsites.net/downloads/microsoft/url-rewrite
- Create an Application in IIS
- Klick Rewrite and add the following configuration, adjust it according to your website settings   
  
  ```txt
    
    Pattern : (.*)
    Rewrite URL : http://localhost:8089/{R:1}
  ```
  ![img](./docimg/rewrite_url.png)

## Understanding Bind Mounts in Docker Volumes

In the `run_docker.yml` file, the following configuration is defined:

```yml
version: '3'
services:
  web:
    image: my-nginx-php
    volumes:
      - ./src:/var/www/html
    ports:
      - "8089:80"
    restart: always
```

In the `volumes` section, the following line is specified:

```sh
./src:/var/www/html
```

This configuration creates a bind mount that connects the `src` folder on the host machine to the `/var/www/html` folder inside the Docker container. As a result, any changes made to the files in the `src` folder on the host are immediately reflected inside the container. This simplifies application development, as you do not need to manually reload files into the container. Nginx running inside the container will automatically serve files from the mounted folder.