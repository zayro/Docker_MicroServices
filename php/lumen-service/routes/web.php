<?php

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

$router->get('/', function () use ($router) {
    return $router->app->version();
});


Route::get('test', 'GeneralController@show');


$router->group(['prefix' => 'api', 'middleware' => 'jwt.auth'], function () {

    /*
    $router->get('/{db}[/{table}]', function ($db, $table =  null)    {
        // Matches The "/admin/users" URL
        echo $db.'bien'.$table;
    });
    */

    Route::get('/{db}/all/{table}', 'GeneralController@all');
    Route::get('/{db}/field/{table}/', 'GeneralController@field');
    Route::get('/{db}/filter/{table}/{field}/{condition}', 'GeneralController@filter');

    Route::post('/{db}/select', 'GeneralController@select');
    Route::post('/{db}/upload', 'GeneralController@upload');
    Route::post('/{db}/uploadInsert', 'GeneralController@uploadInsert');


    Route::post('/{db}/create/', 'GeneralController@create');

    Route::put('/{db}/edit/', 'GeneralController@edit');

    Route::delete('/{db}/destroy/', 'GeneralController@destroy');

    Route::post('/file/createFolder/', 'file@crear_carpeta');
    Route::post('/file/deleteFolder/', 'file@eliminar_carpeta');
});


$router->group(['prefix' => 'unsafe'], function () {


    Route::get('/{db}/all/{table}', 'GeneralController@all');
    Route::get('/{db}/field/{table}/', 'GeneralController@field');
    Route::get('/{db}/filter/{table}/{field}/{condition}', 'GeneralController@filter');

    Route::post('/{db}/select', 'GeneralController@select');
    Route::post('/{db}/upload', 'GeneralController@upload');
    Route::post('/{db}/uploadInsert', 'GeneralController@uploadInsert');


    Route::post('/{db}/create/', 'GeneralController@create');

    Route::put('/{db}/edit/', 'GeneralController@edit');

    Route::delete('/{db}/destroy/', 'GeneralController@destroy');

    Route::post('/file/createFolder/', 'file@crear_carpeta');
    Route::post('/file/deleteFolder/', 'file@eliminar_carpeta');
});


