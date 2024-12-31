# Contoh Settup IIS (Internet Information Services) dengan Docker (nginx, php)

Untuk bahasa indonesia anda bisa klik di ![sini](./README_id.md) 

## Cloning Repositori ini 

## Buat Docker image 

Jalankan perintah berikut ini untuk membuat images dari DockerFile.nginx yang anda clone dari repo ini.

```sh
docker buildx build -t my-nginx-php -f DockerFile.nginx .

```
note : Jangan abaikan tanda titik di ujung

## Buat Container dan jalankan

Untuk menjalankan Image dan membuat container anda bisa menjalankan perintah berikut ini

```bash
docker-compose -f ./run_docker.yml up -d

```

Sekarang anda sudah bisa mengakses http://localhost:8089/ , dan seharusnya sudah tayang, jika anda ingin mengubah port anda bisa mengedit file run_docker.yml
 
## Settup IIS 

- Install IIS dan Module  URL Rewrite    
    https://iis-umbraco.azurewebsites.net/downloads/microsoft/url-rewrite 
- Buat Aplikasi Pada IIS
- Klick URL Rewrite dan masukan konfigurasi seperti ini, sesuaikan dengan settingan website anda   
  
  ```txt
    
    Pattern : (.*)
    Rewrite URL : http://localhost:8089/{R:1}
  ```
  ![img](./docimg/rewrite_url.png)
