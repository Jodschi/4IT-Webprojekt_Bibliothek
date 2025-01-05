<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Lending;
use App\Models\Book;

class LendingController extends Controller
{
    public function index(Request $request) {
        // Suchstring, standardmäßig leerer String
        $searchString = $request->input('lending_search', '');
        
        // Bücher abfragen
        $searchedLendings = Lending::query()
            ->when($searchString, function ($query, $searchString) {
                $query
                    ->where('borrower_name', 'like', '%' . $searchString . '%') // nach Ausborger suchen
                    ->orWhere('borrower_date', 'like', '%' . $searchString . '%'); // alternativ auch nach Datum suchen
            })
            ->orderBy('borrower_name', 'asc') // nach Titel aufsteigen sortieren
            ->paginate(10) // jeweils nur 10 Bücher auf einmal laden
            ->withQueryString(); // bei der Paginierung den Suchstring beibehalten
        
        $lendings = Lending::all();
        $books = Book::all();

        $items = $searchedLendings->items();
        $firstItem = $items[0];
        $attributes = $firstItem->getAttributes();
        // dd($attributes);
        
        
        return Inertia::render('Lendings', [
            "searched_lendings" => $searchedLendings,
            "search_query" => $searchString,
            "books" => $books,
        ]);
    }


    public function store(Request $request) {
        $request->validate([
            'book_id' => ['required', 'numeric'],
            'librarian_id' => ['required', 'numeric'],
            'borrower_name' => ['required', 'string'],
            'borrow_date' => ['required', 'date'],
            'due_date' => ['required', 'date'],
            'returned' => ['nullable', 'boolean'],
        ]);
    }
}
