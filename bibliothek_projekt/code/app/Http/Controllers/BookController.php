<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Book;

class BookController extends Controller
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
            ->orderBy('title', 'asc') // nach Titel aufsteigend sortieren
            ->paginate(10) // jeweils nur 10 Bücher auf einmal laden
            ->withQueryString(); // bei der Paginierung den Suchstring beibehalten


        // gefilterte Bücher an das Frontend weitersenden
        return Inertia::render('Books', [
            "searched_books" => $searchedBooks,
            "search_query" => $searchString,
        ]);
    }

    public function show($id) {
        $book = Book::findOrFail($id);
        return response()->json($book);
    }

    public function store(Request $request) {
        $attributes = $request->validate([
            'isbn' => 'required|numeric',
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'publisher' => 'required|string',
            'price' => 'required|numeric',
            'author' => 'required|string',
            'category' => 'required|string',
        ]);

        $book = Book::create($attributes);
        return response()->json($book, 201);
    }

    public function update(Request $request, $id) {
        $validatedData = $request->validate([
            'title' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|required|string',
            // Add other fields validation as needed
        ]);

        $book = Book::findOrFail($id);
        $book->update($validatedData);
        return response()->json($book);
    }

    public function destroy($id) {
        $book = Book::findOrFail($id);
        $book->delete();
        return response()->json(null, 204);
    }
}
