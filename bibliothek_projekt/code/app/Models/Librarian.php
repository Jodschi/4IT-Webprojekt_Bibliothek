<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Librarian extends Authenticatable implements \Illuminate\Contracts\Auth\Authenticatable
{
    /** @use HasFactory<\Database\Factories\LibrarianFactory> */
    use HasFactory;

    // Beziehung zu der Verleihungstabelle
    public function lendings(): HasMany {
        return $this->hasMany(Lending::class);
    }

    protected $table = 'librarians'; // Tabellenname festlegen

    protected $fillable = [
        'username', // Name des Bibliothekars
        'email', // E-Mail-Adresse des Bibliothekars
        'firstname', // Vorname des Bibliothekars
        'lastname', // Nachname des Bibliothekars
        'password', // Passwort des Bibliothekars
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password', // Passwort verstecken
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'password' => 'hashed', // Passwörter verschlüsseln
    ];
}
