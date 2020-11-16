<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    $preparation = App\Preparation::find(1);
    $food = App\Food::find(1);

    dd( $food->factorUnits()->first()->id );

    return view('welcome');
});
