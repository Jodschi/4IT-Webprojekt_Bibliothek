<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Librarian;
use App\Models\Book;
use App\Models\Lending;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Mit factories Testdaten generien
        Librarian::factory()->count(4)->create();
        Book::factory()->count(20)->create();
        
        // Testausleihe
        Lending::factory()->create([
            'book_id' => 1,
            'librarian_id' => 1,
            'borrower_name' => fake()->name(),
            'borrow_date' => '2024-12-06',
            'due_date' => '2024-12-20',
            'returned' => false,
        ]);

        Lending::factory()->create([
            'book_id' => 2,
            'librarian_id' => 2,
            'borrower_name' => fake()->name(),
            'borrow_date' => '2024-12-02',
            'due_date' => '2024-12-25',
            'returned' => false,
        ]);
    }
}


