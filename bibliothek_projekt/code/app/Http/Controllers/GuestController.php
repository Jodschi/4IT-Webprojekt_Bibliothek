<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Book;

class GuestController extends Controller
{

    public function index(Request $request) {
        // Suchstring, standardmäßig leerer String
        $searchString = $request->input('book_search', '');
        
        // Bücher abfragen
        $searchedBooks = Book::query()
            ->when($searchString, function ($query, $searchString) {
                $query
                    ->where('title', 'like', '%' . $searchString . '%') // nach Titel suchen
                    ->orWhere('description', 'like', '%' . $searchString . '%'); // alternativ auch nach Autor suchen
            })
            ->orderBy('title', 'asc') // nach Titel aufsteigen sortieren
            ->paginate(10) // jeweils nur 10 Bücher auf einmal laden
            ->withQueryString(); // bei der Paginierung den Suchstring beibehalten


        // gefilterte Bücher an das Frontend weitersenden
        return Inertia::render('Home', [
            "searched_books" => $searchedBooks,
            "search_query" => $searchString,
        ]);
    }
    
}

