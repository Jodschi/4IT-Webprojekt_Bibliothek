<script setup lang="ts">
import { ref, watch } from 'vue';
import { onMounted } from 'vue';
import { usePage } from '@inertiajs/vue3';
import type { Book } from '@/Pages/Books.vue';
import type { AuthProp } from '@/Types/Auth';

const props = defineProps<{
    book: Book;
}>();

const user = ref((usePage().props.auth as AuthProp).user);
console.log('User:', user.value);
watch(() => usePage().props.auth as AuthProp, (newAuth: AuthProp) => {
    user.value = newAuth.user; // Update the `user` ref when `auth` changes
    if (user.value) {
        console.log('User:', user.value);
    }
});

const emit = defineEmits(['onEdit', 'onDelete']);

const handleEdit = () => {
    emit('onEdit', props.book);
}

const handleDelete = () => {
    emit('onDelete', props.book.id);
}

const available = ref<boolean>();

const checkIfAvailable = () => {
    if (props.book.lending && !props.book.lending.returned) {
        available.value = false;
    } else {
        available.value = true;
    }
}

onMounted(() => {
    checkIfAvailable();
});



</script>


<template>

<!-- Für Gastbenutzer -->
<div v-if="!user" class="py-4 rounded-md bg-gradient-to-r from-yellow-100 to-yellow-200 flex justify-between">
    <div class="ml-8 flex flex-col space-y-2">
        <span v-html="book.title" class="font-semibold text-lg"></span>
        <div class="flex flex-col">
            <span class="text-black/60">Kategorie: {{ book.category }}</span>
            <span class="text-black/60">Autor: {{ book.author }}</span>
            <details class="text-black/60">
                <summary class="select-none">Zusätzliche Informationen</summary>
                <div class="ml-3 w-3/4">
                    
                    <p class="underline font-semibold">Verlag</p>
                    <p class="mb-2">{{ book.publisher }}</p>
    
                    <p class="underline font-semibold">Preis</p>
                    <p class="mb-2">{{ book.price }}</p>
    
                    <p class="underline font-semibold">Beschreibung</p>
                    <p class="mb-2">{{ book.description }}</p>
                </div>
            </details>
        </div>
    </div>


    <div class="mr-8 flex flex-col justify-between items-end">
        <div class="">
            <span v-if="available" class="text-green-500 font-semibold">Verfügbar</span>
            <span v-if="!available" class="text-red-500 font-semibold">Ausgeliehen</span>
        </div>
    </div>
</div>


<!-- Wenn der Bibliothekar angemeldet ist -->
<div v-if="user" class="py-6 rounded-md bg-gradient-to-r from-yellow-100 to-yellow-200 flex justify-between">
    <div class="ml-8 flex flex-col space-y-4">
        <span v-html="book.title" class="font-semibold text-lg"></span>
        <div class="flex flex-col">
            <span class="text-black/60">Kategorie: {{ book.category }}</span>
            <span class="text-black/60">Autor: {{ book.author }}</span>
            <details class="text-black/60">
                <summary class="select-none">Zusätzliche Informationen</summary>
                <div class="ml-3 w-3/4">
                    
                    <p class="underline font-semibold">Verlag</p>
                    <p class="mb-2">{{ book.publisher }}</p>
    
                    <p class="underline font-semibold">Preis</p>
                    <p class="mb-2">{{ book.price }}</p>
    
                    <p class="underline font-semibold">Beschreibung</p>
                    <p class="mb-2">{{ book.description }}</p>
                </div>
            </details>

        </div>
    </div>


    <div class="mr-8 flex flex-col justify-between items-end">
        <div class="">
            <span v-if="available" class="text-green-500 font-semibold">Verfügbar</span>
            
            <span v-if="!available" class="text-red-500 font-semibold">Ausgeliehen</span>
        </div>

        <div class="flex space-x-5">
            <div>
                <button 
                    @click="handleEdit" 
                    class="text-blue-700 bg-blue-200 p-1 rounded-lg border-blue-200 border-2 shadow-lg">Bearbeiten
                </button>
            </div>

            <div>
                <button 
                    @click="handleDelete" 
                    class="text-red-950 bg-red-700 p-1 rounded-lg border-red-700 border-2 shadow-lg">Löschen
                </button>
            </div>
        </div>

    </div>
</div>

</template>