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
    return view('home');
});

Route::post(
    '/register', 
    [App\Http\Controllers\RegisterController::class, 'register']
)->name('register');

Route::match(
    ['get', 'post'], 
    '/login', 
    function(){
        return view('login', [App\Http\Controllers\LoginController::class, 'login']);
    }
)->name('login');

Route::post(
    '/resend/email/token', 
    [App\Http\Controllers\RegisterController::class, 'resendPin']
)->name('resendPin');

Route::middleware('auth:sanctum')->group(function () {
    Route::post(
        'email/verify',
        [App\Http\Controllers\RegisterController::class, 'verifyEmail']
    );
    Route::middleware('verify.api')->group(function () {
        Route::post(
            '/logout', 
            [App\Http\Controllers\LoginController::class, 'logout']
        );
    });
});


Route::match(
    ['get', 'post'], 
    '/forgot-password', 
    function(){
        return view('forgot-password', [App\Http\Controllers\ForgotPasswordController::class, 'forgotPassword']);
    }
)->name('forgot-password');

Route::post(
    '/verify/pin', 
    [App\Http\Controllers\ForgotPasswordController::class, 'verifyPin']
);
Route::post(
    '/reset-password', 
    [App\Http\Controllers\ResetPasswordController::class, 'resetPassword']
);