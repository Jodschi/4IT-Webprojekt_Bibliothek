<script setup lang="ts">
import type { Lending } from '@/Pages/Lendings.vue';
import type { Book } from '@/Pages/Books.vue';
import { ref, onMounted, watch } from 'vue';
import { useForm } from '@inertiajs/vue3';
import { FwbModal } from 'flowbite-vue';
import { FwbDropdown } from 'flowbite-vue';
import BookSelection from '@/Components/BookSelection.vue';

const props = defineProps<{
    books: Book[];
    lending: Lending;
    editModalVisible: boolean;
    closeEditModal: () => void;
}>();

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

const selectedBook = ref<number|undefined>(props.lending.book_id);

const handleBookSelection = (id: number) => {
    console.log("Book Selected: ", id);
    selectedBook.value = id;
    form.book_id = id;
};

const handleEditSubmit = () => {
    form.put(`/ausleihen/${props.lending.id}`, {
        onSuccess: () => {
            emit('onSuccessfulPatch');
        },
        onError: (error) => {
            console.error('Error deleting lending:', error);
        }
    });
    
};

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
                    <!-- <label for="book_id">Buch</label> -->
                    <fwb-dropdown placement="bottom" text="Buch auswählen" close-inside>
                        <template #trigger>
                            <div
                                class="cursor-pointer select-none px-4 py-2 bg-yellow-800/70 hover:bg-yellow-900/80 transition-colors text-white rounded-lg">
                                Buch auswählen
                                
                            </div>
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

                <div v-if="selectedBook !== undefined">
                    <BookSelection
                        class="bg-yellow-100/50 rounded-lg py-2 w-1/2 pointer-events-none"
                        :id="getBookById(selectedBook).id"
                        :category="getBookById(selectedBook).category"
                        :title="getBookById(selectedBook).title"
                        :author="getBookById(selectedBook).author"
                        :dueDate="null"
                        :isAvailable="null"
                        :returned="null"
                    />
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
                    <label for="due_date">Ausgeliehen von Bibliothekar:</label>
                    <input v-model="form.librarian_id" type="text" name="librarian_id" id="librarian_id" required>
                </div>
                

                <button type="submit" :disabled="form.processing" class="self-start bg-yellow-300 rounded-lg py-2 px-4">
                    Aktualisieren
                </button>
            </form>
        </template>

    </fwb-modal>


</template>