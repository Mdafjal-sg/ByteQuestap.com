<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

// API Routes
Route::apiResource('products', ProductController::class);