<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\Book;
use App\Models\Librarian;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('lendings', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(Book::class); // Fremdschlüssel für das Buch, das ausgeliehen wird
            $table->foreignIdFor(Librarian::class); // Fremdschlüssel für den Bibliothekar, der das Buch ausleiht

            $table->string('borrower_name'); // Name der Person, die das Buch ausleiht
            $table->date('borrow_date'); // Datum, an dem das Buch ausgeliehen wird
            $table->date('due_date'); // Datum, bis zu welchem das Buch zurückgegeben werden muss
            $table->boolean('returned')->default(false); // Wahrheitswert, um festzuhalten, ob das Buch schon zurückgegeben wurde

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lendings');
    }
};

