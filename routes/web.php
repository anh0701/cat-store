<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;


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
    return view('home');
});

// Route::redirect('/', 'https://youtu.be/nnsQCD4qH-A');
// Route::view('/', 'home');

Route::prefix('admin')->group(function () {
    Route::get('home', function(){
        return 'phuong thuc get';
    });
    Route::post('home', function () {
        return 'phuong thuc post  ';
    });
});

Route::prefix('products')->group(function () {
    Route::get('welcome', function(){
        return view('welcome');;
    })->name('products.welcome'); 
    // đặt tên show form của admin
    // để trên view dùng hàm route('name mình vừa tạo') => chuyển hướng sang route đó
});

