<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\UserController;


use App\Http\Controllers\ListasController;

Route::resource('categoria', CategoriaController::class);
Route::resource('listas', ListasController::class);
Route::resource('user', UserController::class);


Route::post('/user/login', [UserController::class, 'login']);

Route::get('/listar/{id}', [ListasController::class, 'listarPorCategoria']);

Route::post('/listas/subirImagen', [ListasController::class, 'subirImagen']);

