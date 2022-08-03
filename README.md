# API Service with Lumen PHP Framework

[![Build Status](https://travis-ci.org/laravel/lumen-framework.svg)](https://travis-ci.org/laravel/lumen-framework)
[![Total Downloads](https://img.shields.io/packagist/dt/laravel/framework)](https://packagist.org/packages/laravel/lumen-framework)
[![Latest Stable Version](https://img.shields.io/packagist/v/laravel/framework)](https://packagist.org/packages/laravel/lumen-framework)
[![License](https://img.shields.io/packagist/l/laravel/framework)](https://packagist.org/packages/laravel/lumen-framework)

Laravel Lumen is a stunningly fast PHP micro-framework for building web applications with expressive, elegant syntax. We believe development must be an enjoyable, creative experience to be truly fulfilling. Lumen attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as routing, database abstraction, queueing, and caching.

This project use for microservices based api services with jwt authentication.
its contain of some libraries :
-   [lumen-framework-8.3.1](https://lumen.laravel.com/docs/9.x)
-   [lumen-generator](https://github.com/flipboxstudio/lumen-generator)
-   [tymon/jwt-auth](https://jwt.io)



### Step to Instalation
```
> git clone git@github.com:raflesngln/lumen_api.git
> import DB from docs/db/laravel.sql
> composer update
> php artisan key:generate
> php -S localhost:8000 -t public

```

### Access End Point API
  
```
> [POST](http://localhost:8000/api2/register)
> [POST](http://localhost:8000/api2/login)
> [GET](http://localhost:8000/api2/users)
> [POST](http://localhost:8000/api2/me)
> [POST](http://localhost:8000/api2/logout)
> [POST](http://localhost:8000/api2/refresh)

```


### Lumen JWT Documentation

-   [Lumen jwt Docs](https://jwt-auth.readthedocs.io/en/docs/quick-start) 
-   [Lumen jwt Docs](https://jwt-auth.readthedocs.io/en/develop/quick-start)


### Contributing

Thank you for considering contributing

