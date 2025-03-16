<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\ProjectController;
use App\Http\Controllers\API\TimesheetController;
use App\Http\Controllers\API\AttributeController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:api')->get('auth/user', function (Request $request) {
    return $request->user();
});

// Public routes
Route::post('auth/register', [AuthController::class, 'register']);
Route::post('auth/login', [AuthController::class, 'login'])->name('login');

// Protected routes
Route::middleware('auth:api')->group(function () {
    Route::post('/auth/logout', [AuthController::class, 'logout']);

    // Projects
    Route::apiResource('projects', ProjectController::class);

    // Timesheets
    Route::apiResource('timesheets', TimesheetController::class);
    Route::post('timesheets/bulk', [TimesheetController::class, 'bulkStore']);

    // Attributes
    Route::apiResource('attributes', AttributeController::class);
});