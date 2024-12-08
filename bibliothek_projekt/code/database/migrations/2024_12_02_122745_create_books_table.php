<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('books', function (Blueprint $table) {
            $table->id();

            $table->integer('isbn'); // ISBN
            $table->string('title'); // Titel
            $table->string('description')->nullable(); // Beschreibung
            $table->string('publisher'); // Verlag
            $table->float('price'); // Preis
            $table->string('author'); // Autor
            $table->string('category'); // Kategorie

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('books');
    }

};
