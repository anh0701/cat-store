<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\ProductsController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post(
    '/register', 
    [App\Http\Controllers\RegisterController::class, 'register']
)->name('register');

Route::match(
    ['get', 'post'], 
    '/login', 
    [App\Http\Controllers\LoginController::class, 'login']
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

Route::post(
    '/forgot-password', 
    [App\Http\Controllers\ForgotPasswordController::class, 'forgotPassword']
);
Route::post(
    '/verify/pin', 
    [App\Http\Controllers\ForgotPasswordController::class, 'verifyPin']
);
Route::post(
    '/reset-password', 
    [App\Http\Controllers\ResetPasswordController::class, 'resetPassword']
);

Route::middleware('auth:sanctum')->group(function () {
    // products
    Route::get('/products', [ProductsController::class, 'index']);
    Route::post('/products', [ProductsController::class, 'store']);
    Route::get('/products/{id}', [ProductsController::class, 'show']);
    Route::put('/products/{id}', [ProductsController::class, 'update']);
    Route::delete('/products/{id}', [ProductsController::class, 'destroy']);

    // categories
    Route::get('/categories', [CategoriesController::class, 'index']);
    Route::post('/categories', [CategoriesController::class, 'store']);
    Route::get('/categories/{id}', [CategoriesController::class, 'show']);
    Route::put('/categories/{id}', [CategoriesController::class, 'update']);
    Route::delete('/categories/{id}', [CategoriesController::class, 'destroy']);

});