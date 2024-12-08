<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Librarian extends Model
{
    /** @use HasFactory<\Database\Factories\LibrarianFactory> */
    use HasFactory;

    // Beziehung zu der Verleihungstabelle
    public function lendings(): HasMany {
        return $this->hasMany(Lending::class);
    }

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password', // Passwort verstecken
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'password' => 'hashed', // Passwörter verschlüsseln
        ];
    }

}
