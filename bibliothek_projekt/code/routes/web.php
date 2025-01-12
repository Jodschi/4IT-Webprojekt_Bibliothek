<?php

use App\Http\Controllers\BookController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LendingController;
use App\Http\Controllers\AuthenticatedSessionController;
use App\Http\Controllers\RegisteredUserController;


Route::middleware(['guest'])->group(function () {
    Route::get('/', [BookController::class, 'index'])->name('books.index');
    Route::get('/login', [AuthenticatedSessionController::class, 'create'])->name('login');
    Route::post('/login', [AuthenticatedSessionController::class, 'store']);
    Route::get('/register', [RegisteredUserController::class, 'create'])->name('register');
    Route::post('/register', [RegisteredUserController::class, 'store']);
});

Route::middleware(['guest'])->group(function () {

    Route::controller(BookController::class)->group(function () {
        Route::get('/buecher/erstellen', 'create')->name('books.create');
        Route::post('/buecher', 'store')->name('books.store');
        Route::get('/buecher/{id}', 'show')->name('books.show');
        Route::get('/buecher/{id}/bearbeiten', 'edit')->name('books.edit');
        Route::put('/buecher/{id}', 'update')->name('books.update');
        Route::delete('/buecher/{id}', 'destroy')->name('books.destroy');
    });

    Route::controller(LendingController::class)->group(function () {
        Route::get('/ausleihen', 'index')->name('lendings.index');
        Route::post('/ausleihen', 'store')->name('lendings.store');
        Route::get('/ausleihen/{id}', 'show')->name('lendings.show');
        Route::put('/ausleihen/{id}', 'update')->name('lendings.update');
        Route::delete('/ausleihen/{id}', 'destroy')->name('lendings.destroy');
    });

});    




