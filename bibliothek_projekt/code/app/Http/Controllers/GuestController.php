<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Book;

class GuestController extends Controller
{

    public function index(Request $request) {
        $searchString = $request->input('book_search')
        
        // $searchedBooks = Book::

        return Inertia::render('Home', [
            "searched_books" => $searchedBooks,
        ]);
    }
}
