<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Book;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Lending extends Model
{
    /** @use HasFactory<\Database\Factories\LendingFactory> */
    use HasFactory;

    // Beziehung zur Buch-Tabelle
    public function book(): BelongsTo {
        return $this->belongsTo(Book::class);
    }

    // Beziehung zur Buch-Tabelle
    public function librarian(): BelongsTo {
        return $this->belongsTo(Librarian::class);
    }

    protected $guarded = [];
}
