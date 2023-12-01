<a href="https://github.com/bhuvi1508/Docker-velflix-laravel"> <h1 align="center">Velflix</h1></a>
<p align="center"><a href="https://github.com/bhuvi1508/Docker-velflix-laravel/blob/main/LICENSE"><img src="https://poser.pugx.org/cpriego/valet-linux/license.svg" alt="License"></a>
</p>

## About

Velflix is a Laravel [Netflix](https://netflix.com) clone project using TALL stack ([Tailwindcss](https://tailwindcss.com/), [Alpinejs](https://github.com/alpinejs/alpine/), [Laravel](https://laravel.com/), [Livewire](https://laravel-livewire.com/) ).


## Dockerize This Application

<a name="requirements"></a>
## Requirements

Package | Version
--- | ---
[Node](https://nodejs.org/en/) | V14.19.1+
[Npm](https://nodejs.org/en/)  | V6.14.16+ 
[Composer](https://getcomposer.org/)  | V2.2.6+
[Php](https://www.php.net/)  | V8.0.17+
[Mysql](https://www.mysql.com/)  |V 8.0.27+

<a name="installation"></a>

## Installation


1. Clone the repository

    ```sh
    git clone https://github.com/bhuvi1508/Docker-velflix-laravel.git
    ```

2. Go into the project root directory
    
    ```sh
    cd velflix
    ```

3. Build the app

    ```sh
    docker build -t velflix-app .
    ```

4. Run the app
   
   ```sh
   docker run -d -p 9000:9000 velflix-app
    ```

5. Visit `http://youripaddress:9000` in your favorite browser.     


## Nginx

Install nginx reverse proxy to make this application available    

