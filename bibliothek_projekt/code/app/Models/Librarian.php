<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Librarian extends Model
{

    public function lendings(): HasMany {
        return $this->hasMany(Lending::class);
    }

    /** @use HasFactory<\Database\Factories\LibrarianFactory> */
    use HasFactory;
}
