<script setup lang="ts">

</script>

<template>

    <div id="page-content" class="font-sans antialiased min-h-[100svh] bg-red-50 flex flex-col">
        <header class="bg-yellow-950 h-28 flex justify-between">
            <div class="bg-black self-center h-4/5 w-[200px] ml-5">
                
            </div>

            <div class="self-center mr-10">
                <button class="text-xl text-white font-semibold">Ausloggen</button>
            </div>
        </header>

        <main class="flex flex-grow p-4 bg-gradient-to-b from-yellow-900/80 to-yellow-800/80">
            <slot></slot>
        </main>

        <footer class="p-4 bg-amber-900/50">
            &copy; SCHULBIBLIOTHEK 2024 &trade;
        </footer>    
    </div>
    

</template>

