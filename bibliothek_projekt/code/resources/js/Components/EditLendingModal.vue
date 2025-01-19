<script setup lang="ts">
import type { Lending } from '@/Pages/Lendings.vue';
import type { Book } from '@/Pages/Books.vue';
import type { Librarian } from '@/Types/Librarian';
import type { AuthProp } from '@/Types/Auth';
import { ref, onMounted, watch } from 'vue';
import { router, useForm, usePage } from '@inertiajs/vue3';
import { FwbModal } from 'flowbite-vue';
import { FwbDropdown } from 'flowbite-vue';
import BookSelection from '@/Components/BookSelection.vue';
import LibrarianSelection from './LibrarianSelection.vue';

const props = defineProps<{
    books: Book[];
    lending: Lending;
    librarians: Librarian[];
    editModalVisible: boolean;
    closeEditModal: () => void;
}>();

// pageProps Objekt
const pageProps = ref(usePage().props);

const selectedBook = ref<number>(props.lending.book_id);
const selectedLibrarian = ref<number>(props.lending.librarian_id);

const emit = defineEmits(['onSuccessfulPatch']);

const form = useForm({
    lending_id: props.lending.id,
    book_id: props.lending.book_id,
    borrower_name: props.lending.borrower_name,
    borrow_date: props.lending.borrow_date,
    due_date: props.lending.due_date,
    librarian_id: props.lending.librarian_id,
    returned: props.lending.returned,
});


const getBookById = (id: number): Book => {
    const filteredBook = props.books.find(item => item.id === id) as Book;
    return filteredBook;
}

const getLibrarianById = (id: number): Librarian => {
    const filteredLibrarian = props.librarians.find(item => item.id === id) as Librarian;
    return filteredLibrarian;
}


const handleBookSelection = (id: number) => {
    console.log("Book Selected: ", id);
    selectedBook.value = id;
    form.book_id = id;
};

const handleLibrarianSelection = (id: number) => {
    console.log("Librarian Selected: ", id);
    selectedLibrarian.value = id;
    form.librarian_id = id;
};

const handleEditSubmit = () => {
    form.put(`/ausleihen/${props.lending.id}`, {
        onSuccess: () => {
            emit('onSuccessfulPatch');
        },
        onError: (error) => {
            console.error('Error deleting lending:', error);
        },
        preserveScroll: true,
    });
    
};

const completeLending = () => {
    if (confirm('Hiermit bestätigen Sie, dass das Buch zurückgegeben wurde. Möchten Sie fortfahren?')) {
        router.delete(`/ausleihen/${props.lending.id}`, {
            onSuccess: () => {
                emit('onSuccessfulPatch');
            },
            onError: (error) => {
                console.error('Error completing lending:', error);
            },
            preserveScroll: true,
        });
    }
}

</script>


<template>
    <fwb-modal v-if="editModalVisible" @close="closeEditModal">
        <template #header>
            <div class="flex items-center text-lg">
                Ausleihe bearbeiten
            </div>
        </template>

        <template #body>
            <form @submit.prevent="handleEditSubmit" method="POST" class="flex flex-col space-y-4 pb-6">

                <div class="flex flex-col">
                    <label class="mb-2" for="book_id">Buch auswählen: </label>
                    <fwb-dropdown placement="bottom" text="Buch auswählen" close-inside>
                        <template #trigger>
                            <BookSelection
                                class="bg-yellow-100/50 rounded-lg py-2 px-5 select-none"
                                :id="getBookById(selectedBook).id"
                                :category="getBookById(selectedBook).category"
                                :title="getBookById(selectedBook).title"
                                :author="getBookById(selectedBook).author"
                                :dueDate="null"
                                :isAvailable="null"
                                :returned="null"
                            />
                        </template>


                        <template #default>
                            <div class="bg-gray-100 flex flex-col p-2 space-y-2 rounded-sm overflow-y-auto h-72 w-96">
                                <BookSelection
                                    @on-select="handleBookSelection"
                                    class="bg-gray-200 rounded-lg py-2 w-full"
                                    v-for="book in books"
                                    :id="book.id"
                                    :category="book.category"
                                    :title="book.title"
                                    :author="book.author"
                                    :dueDate="null"
                                    :isAvailable="null"
                                    :returned="null"
                                />
                            </div>
                        </template>

                    </fwb-dropdown>

                </div>

                <div class="flex flex-col">
                    <label for="borrower_name">Name des Ausleihers</label>
                    <input v-model="form.borrower_name" type="text" name="borrower_name" id="borrower_name" required>
                </div>

                <div class="flex flex-col">
                    <label for="borrow_date">Ausborgedatum</label>
                    <input v-model="form.borrow_date" type="date" name="borrow_date" id="borrow_date" required>
                </div>

                <div class="flex flex-col">
                    <label for="due_date">Ausborgefrist (Deadline)</label>
                    <input v-model="form.due_date" type="date" name="due_date" id="due_date" required>
                </div>

                <div class="flex flex-col">
                    <label class="mb-2" for="book_id">Ausgeliehen von Bibliothekar: </label>
                    <fwb-dropdown placement="top" text="Buch auswählen" close-inside>
                        <template #trigger>
                            <LibrarianSelection
                                class="bg-yellow-100/50 rounded-lg py-2 px-5 select-none"
                                :librarian="getLibrarianById(selectedLibrarian)"
                            />
                        </template>

                        <template #default>
                            <div class="bg-gray-100 flex flex-col p-2 space-y-2 rounded-sm overflow-y-auto h-72 w-96">
                                <LibrarianSelection
                                    v-for="librarian in librarians"
                                    @on-select="handleLibrarianSelection"
                                    class="rounded-lg py-2 w-full"
                                    :class="{
                                        'bg-yellow-400/10 pointer-events-none': selectedLibrarian === librarian.id,
                                        'bg-gray-200': selectedLibrarian !== librarian.id
                                    }"
                                    :librarian="librarian"
                                />
                                
                            </div>
                        </template>

                    </fwb-dropdown>
                </div>


                <div class="flex justify-between pt-6">
                    <button type="submit" :disabled="form.processing" class="self-start bg-yellow-300 rounded-lg py-2 px-4">
                        Aktualisieren
                    </button>
                    
                    <button type="submit" @click.prevent="completeLending" :disabled="form.processing" class="bg-lime-300 rounded-lg py-2 px-4">
                        Ausleihe abschließen (Buch zurückgegeben)
                    </button>
                </div>
            </form>
        </template>

    </fwb-modal>


</template>