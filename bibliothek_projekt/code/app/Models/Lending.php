<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\Models\Book;

class Lending extends Model
{
    /** @use HasFactory<\Database\Factories\LendingFactory> */
    use HasFactory;

    // Beziehung zur Buch-Tabelle
    public function book(): HasOne {
        return $this->hasOne(Book::class);
    }
}
