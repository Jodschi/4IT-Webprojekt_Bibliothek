<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Book;
use Illuminate\Support\Facades\Auth;

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
        return redirect()->back();
    }

    public function update(Request $request, $id) {
        try {
            $attributes = $request->validate([
                'isbn' => 'required|numeric',
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'publisher' => 'required|string',
                'price' => 'required|numeric',
                'author' => 'required|string',
                'category' => 'required|string',
            ]);
    
            $book = Book::findOrFail($id);
            $book->update($attributes);
            return redirect()->back();
        } catch (\Throwable $th) {
            dd($th);
        }
    }


    public function destroy($id) {
        try {
            $book = Book::findOrFail($id);
            $book->delete();

            return redirect('/')->with("status", "success");
        } catch (\Throwable $th) {
            dd($th);
        }
    }
}
