<?php

// for call request from client
use Illuminate\Http\Request;


/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/


// middleware
$router->post("/admin_page", ['middleware' => 'CheckUserLogin', function (Request $request) {
    $AuthToken = $request->header('Authorization');
    return "OKEE ! ,  Anda berhasil login ";
}]);



$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->post('/login', 'AuthController@login' );

// 'middleware' => 'CheckUserLogin'
$router->get('/users', ['uses'=>'UsersController@index','as'=>'list of users']);
$router->post('/users', ['uses'=>'UsersController@store','as'=>'create new users']);
$router->get('/users/{id}', 'UsersController@show');
$router->put('/users/{id}', ['uses'=>'UsersController@update','middleware' => 'CheckUserLogin','as'=>'update_user']);
$router->delete('/users/{id}', 'UsersController@destroy');


$router->group(['prefix' => 'api'], function () use ($router) {
      $router->get('authors',  ['uses' => 'AuthorController@showAllAuthors']);
      $router->get('authors/{id}', ['uses' => 'AuthorController@showOneAuthor']);
      $router->post('authors', ['uses' => 'AuthorController@create']);
      $router->delete('authors/{id}', ['uses' => 'AuthorController@delete']);
      $router->put('authors/{id}', ['uses' => 'AuthorController@update']);
});


// API route group
$router->group(['prefix' => 'api2'], function () use ($router) {
    // Matches "/api/register
   $router->post('register', 'AuthController@register');
     // Matches "/api/login
    $router->post('login', 'AuthController@login');

    // Matches "/api/profile
    $router->get('profile', 'UserController@profile');

    // Matches "/api/users/1
    //get one user by id
    $router->get('users/{id}', 'UserController@singleUser');

    // Matches "/api/users
    $router->get('users', 'UserController@allUsers');
});
