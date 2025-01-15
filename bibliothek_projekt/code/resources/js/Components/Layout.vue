<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
import NavLink from './NavLink.vue';

</script>

<template>

    <div id="page-content" class="font-sans antialiased min-h-[100svh] bg-red-50 flex flex-col">
        <header class="bg-yellow-950 h-28 flex justify-between">
            <div class="h-full bg-red-50/0 flex items-center space-x-6">
                <div class="bg-black self-center h-4/5 w-[200px] mx-5 text-white">LOGO</div>

                <NavLink href="/"
                    :isActive="$page.url === '/' || $page.url.startsWith('/?book_search')"
                >
                    Alle Bücher
                </NavLink>

                <NavLink href="/ausleihen"
                    :isActive="$page.url === '/ausleihen' || $page.url.startsWith('/ausleihen?lending_search')"
                >
                    Ausleihen verwalten
                </NavLink>

            </div>

            <div class="self-center mr-10">
                <form action="/logout" method="post">
                    <button type="submit" class="text-xl text-white font-semibold">Ausloggen</button>
                </form>
            </div>
        </header>

        <main class="flex flex-grow py-10 px-64 bg-gradient-to-b from-yellow-900/80 to-yellow-800/80">
            <slot></slot>
        </main>

        <footer class="p-4 bg-amber-900/50">
            &copy; SCHULBIBLIOTHEK 2024 &trade;
        </footer>    
    </div>
    

</template>

