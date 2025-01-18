<script setup lang="ts">
import Layout from '@/Components/Layout.vue';
import BookSearch from '@/Components/BookSearch.vue';
import BookSelection from '@/Components/BookSelection.vue';
import debounce from 'lodash/debounce';
import { computed, onMounted, ref, watchEffect, reactive } from 'vue';
import { router, usePage, useForm } from '@inertiajs/vue3';
import { FwbModal } from 'flowbite-vue';
import { FwbDropdown } from 'flowbite-vue';
import LendingCard from '@/Components/LendingCard.vue';
import EditLendingModal from '@/Components/EditLendingModal.vue';
import LibrarianSelection from '@/Components/LibrarianSelection.vue';

import type { Book } from './Books.vue';
import type { Librarian }  from '@/Types/Librarian';
import type { AuthProp } from '@/Types/Auth';

export interface Lending {
    id: number;
    book_id: number;
    librarian_id: number;
    borrower_name: string;
    borrow_date: string;
    due_date: string;
    returned: boolean;
    created_at: string;
    updated_at: string;
}

interface SearchedLendings {
    data: Lending[];
}

// pageProps Objekt
const pageProps = ref(usePage().props);

const queryString = ref<string>('');
const searchedLendings = ref<SearchedLendings>(usePage().props.searched_books as SearchedLendings || { data: [] });
const books = ref<Book[]>(usePage().props.books as Book[] || []);
const librarians = ref<Librarian[]>(usePage().props.librarians as Librarian[] || []);

const user = ref((usePage().props.auth as AuthProp).user);
const activeLibrarian = user.value as Librarian;

// jedes Mal, wenn sich die pageProps ändern, den queryString und die gesuchten Bücher aktualisieren
watchEffect(() => {
    // Suchstring
    queryString.value = pageProps.value.search_query as string || '';
    // Array von Buch-Objekten
    searchedLendings.value = usePage().props.searched_lendings as SearchedLendings || { data: [] };
});

const getLendings = (queryString: string) => {
    try {
        router.get('/ausleihen', { lending_search: queryString }, {
            preserveScroll: true,
            preserveState: true,
            only: ['search_query', 'searched_lendings', 'pageProps'],
            
            // beim bekommen der Antwort die PageProps aktualisieren
            onFinish: () => {
                console.log(usePage().props);
                pageProps.value = usePage().props;
            },
        });

        

    } catch (error) {
        console.error('Error fetching books:', error);
    }
}

onMounted(() => {
    getLendings(queryString.value);
})

const getBookById = (id: number): Book => {
    const filteredBook = books.value.find(item => item.id === id) as Book;
    
    return filteredBook;
}

const getLendingById = (id: number): Lending => {
    const filteredLending = searchedLendings.value.data.find(item => item.id === id) as Lending;
    return filteredLending;
}

const getLibrarianById = (id: number): Librarian => {
    const filteredLibrarian = librarians.value.find(item => item.id === id) as Librarian;
    return filteredLibrarian;
}

// auf Änderungen im Suchfeld reagieren -> debounce drosselt das Senden von Daten 
const handleValueChange = debounce((value: string) => {

    queryString.value = value;
    console.log('Suche: ', value);

    getLendings(queryString.value);

}, 300);


// Modalfenster Logik

const creationModalVisible = ref(false);
const editModalVisible = ref(false);

const openCreationModal = () => {
    creationModalVisible.value = true;
}

const closeCreationModal = () => {
    creationModalVisible.value = false;
}

const clickedLending = ref<number|null>(null);

const openEditModal = (id: number) => {
    editModalVisible.value = true;
    clickedLending.value = id;
}

const closeEditModal = () => {
    editModalVisible.value = false;
    clickedLending.value = null;
}

const selectedBook = ref<number>(books.value[0].id); // Standardmäßig das erste Buch auswählen
const selectedLibrarian = ref<number>(activeLibrarian.id); // Standardmäßig den angemeldeten Bibliothekar auswählen

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

const handleLendingDeletion = (id: number) => {
    if (confirm('Sind Sie sicher, dass Sie diese Ausleihe löschen möchten?')) {
        router.delete(`/ausleihen/${id}`, {
            onSuccess: () => {
                // Aktualisieren Sie die Liste der Ausleihen nach dem Löschen
                getLendings(queryString.value);
            },
            onError: (error) => {
                console.error('Error deleting lending:', error);
            }
        });
    }
};


const form = useForm({
    book_id: -1,
    borrower_name: '',
    borrow_date: new Date().toISOString().split('T')[0],
    due_date: '',
    librarian_id: activeLibrarian.id,
});


const createLending = () => {    
    form.post('/ausleihen', {
        onSuccess: () => {
            closeCreationModal();
        },
        onError: (error) => {
            console.error('Error creating lending:', error);
        }
    });
}

const onSuccessfulPatch = () => {
    closeEditModal();
    // getLendings(queryString.value);
    console.log('onSuccessfulPatch');
}



</script>

<template>
    <Layout>
        <div class="w-full flex flex-col">

            
            <div class="bg-red-500/0 w-full mt-10">
                <button @click="openCreationModal"
                    class="text-white shadow-xl hover:shadow-2xl font-semibold tracking-wide text-lg bg-yellow-400 hover:bg-yellow-500 transition-all rounded-xl p-3">
                    
                    <span class="drop-shadow-lg">+ Neue Buchausleihe eintragen</span>
                </button>
            </div>

            <fwb-modal v-if="creationModalVisible" @close="closeCreationModal">
                <template #header>
                    <div class="flex items-center text-lg">
                        Neue Ausleihe
                    </div>
                </template>
                
                <template #body>
                    <form @submit.prevent="createLending" method="POST" class="flex flex-col space-y-4 pb-6">

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
                                            class="rounded-lg py-2 w-full"
                                            :class="{
                                                'bg-yellow-400/10 pointer-events-none': selectedBook === book.id,
                                                'bg-gray-200': selectedBook !== book.id
                                            }"

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
                            <fwb-dropdown placement="bottom" text="Buch auswählen" close-inside>
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
                                                'bg-yellow-400/10 pointer-events-none': selectedBook === librarian.id,
                                                'bg-gray-200': selectedBook !== librarian.id
                                            }"
                                            :librarian="librarian"
                                        />
                                        
                                    </div>
                                </template>

                            </fwb-dropdown>
                        </div>

                        <button type="submit" :disabled="form.processing" class="self-start bg-yellow-300 rounded-lg py-2 px-4">
                            Erstellen
                        </button>
                    </form>
                </template>

            </fwb-modal>
            
            <EditLendingModal v-if="editModalVisible && clickedLending" @close="closeEditModal"
                :books="books"
                :librarians="librarians"
                :lending="getLendingById(clickedLending)"
                :edit-modal-visible="editModalVisible"
                :close-edit-modal="closeEditModal"
                v-on:on-successful-patch="onSuccessfulPatch"
            />

            <div id="lending_output_container" class="space-y-4 mt-6">
                <LendingCard v-for="lending in searchedLendings.data"
                    :id="lending.id"
                    :borrowerName="lending.borrower_name"
                    :borrowDate="lending.borrow_date" 
                    :book="getBookById(lending.book_id)"
                    :dueDate="lending.due_date"
                    :returned="Boolean(lending.returned)"
                    :isAvailable="true"
                    @on-edit="openEditModal"
                    @on-delete="handleLendingDeletion"
                />
                
            </div>

            

        </div>
    </Layout>
</template>

