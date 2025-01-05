<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GuestController;
use App\Http\Controllers\LendingController;

Route::get('/', [GuestController::class, 'index']);

Route::controller(LendingController::class)->group(function () {
    Route::get('/ausleihen', 'index')->name('lendings.index');
    Route::get('/ausleihen/erstellen', 'create')->name('lendings.create');
    Route::post('/ausleihen', 'store')->name('lendings.store');
    Route::get('/ausleihen/{id}', 'show')->name('lendings.show');
    Route::get('/ausleihen/{id}/bearbeiten', 'edit')->name('lendings.edit');
    Route::put('/ausleihen/{id}', 'update')->name('lendings.update');
    Route::delete('/ausleihen/{id}', 'destroy')->name('lendings.destroy');
});

