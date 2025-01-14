<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Auth;
use Inertia\Inertia;

class AuthenticatedSessionController extends Controller
{
    public function create()
    {
        return Inertia::render('Login');
    }

    public function store(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (!auth()->attempt($request->only('email', 'password'))) {
            return back()->withErrors([
                'email' => 'Die angegebenen Anmeldedaten sind ungültig.',
            ]);
        }

        return redirect()->route('books.index');
    }

    public function destroy()
    {
        auth()->logout();

        return redirect()->route('login');
    }
}
