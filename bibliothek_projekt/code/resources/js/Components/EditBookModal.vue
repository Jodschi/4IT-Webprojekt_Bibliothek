<script setup lang="ts">
import type { Lending } from '@/Pages/Lendings.vue';
import type { Book } from '@/Pages/Books.vue';
import type { Librarian } from '@/Types/Librarian';
import type { AuthProp } from '@/Types/Auth';
import { ref, onMounted, watch } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import { FwbModal } from 'flowbite-vue';
import { FwbDropdown } from 'flowbite-vue';
import BookSelection from '@/Components/BookSelection.vue';
import LibrarianSelection from './LibrarianSelection.vue';

const props = defineProps<{
    book: Book,
    closeModal: () => void;
}>();

const clickedBook = ref<Book>(props.book);

const emit = defineEmits(['onSuccessfulPatch']);

const form = useForm({
    isbn: clickedBook.value.isbn,
    title: clickedBook.value.title,
    description: clickedBook.value.description,
    publisher: clickedBook.value.publisher,
    price: clickedBook.value.price,
    author: clickedBook.value.author,
    category: clickedBook.value.category,
});

const handleEditSubmit = () => {
    form.put(`/buecher/${clickedBook.value.id}`, {
        onSuccess: () => {
            emit('onSuccessfulPatch');
        },
        onError: (error) => {
            console.error('Error updating book:', error);
        },
        preserveScroll: true,
    });
    
};

</script>


<template>
    <fwb-modal @close="closeModal">
        <template #header>
            <div class="flex items-center text-lg">
                Buch bearbeiten
            </div>
        </template>

        <template #body>
            <form @submit.prevent="handleEditSubmit" method="POST" class="flex flex-col space-y-4 pb-6">

                <div class="flex flex-col">
                    <label for="borrower_name">ISBN</label>
                    <input v-model="form.isbn" type="number" name="isbn" id="isbn" required>
                </div>

                <div class="flex flex-col">
                    <label for="borrow_date">Titel</label>
                    <input v-model="form.title" type="text" name="title" id="title" required>
                </div>
                
                <div class="flex flex-col">
                    <label for="due_date">Beschreibung</label>
                    <input v-model="form.description" type="text" name="description" id="description" required>
                </div>
                
                <div class="flex flex-col">
                    <label for="due_date">Kategorie</label>
                    <input v-model="form.category" type="text" name="category" id="category" required>
                </div>

                <div class="flex flex-col">
                    <label for="due_date">Autor</label>
                    <input v-model="form.author" type="text" name="author" id="author" required>
                </div>
                
                <div class="flex flex-col">
                    <label for="due_date">Verlag</label>
                    <input v-model="form.publisher" type="text" name="publisher" id="publisher" required>
                </div>

                <div class="flex flex-col">
                    <label for="due_date">Preis</label>
                    <input v-model="form.price" type="number" name="price" id="price" step="0.01" required>
                </div>
                

                <button type="submit" :disabled="form.processing" class="self-start bg-yellow-300 rounded-lg py-2 px-4">
                    Aktualisieren
                </button>

            </form>
        </template>

    </fwb-modal>


</template>