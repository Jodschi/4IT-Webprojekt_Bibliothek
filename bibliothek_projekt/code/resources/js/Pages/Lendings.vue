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

import type { Book } from './Home.vue';

interface Lending {
    id: number;
    book: Book;
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

// auf Änderungen im Suchfeld reagieren -> debounce drosselt das Senden von Daten 
const handleValueChange = debounce((value: string) => {

    queryString.value = value;
    console.log('Suche: ', value);

    getLendings(queryString.value);

}, 300);


// Modalfenster Logik

const creationModalVisible = ref(false);

const openCreationModal = () => {
    creationModalVisible.value = true;
}

const closeCreationModal = () => {
    creationModalVisible.value = false;
}

const form = useForm({
    book_id: '',
    borrower_name: '',
    borrow_date: new Date().toISOString().split('T')[0],
    due_date: '',
});


const createLending = () => {    
    form.post('/ausleihen', {
        onSuccess: () => {
            closeCreationModal();
        }
    });
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
                            <!-- <label for="book_id">Buch</label> -->
                            <fwb-dropdown placement="bottom" text="Buch auswählen">
                                <template #trigger>
                                    <div
                                        class="cursor-pointer px-4 py-2 bg-yellow-800/70 hover:bg-yellow-900/80 transition-colors text-white rounded-lg">
                                        Buch auswählen
                                    </div>
                                </template>

                                
                                <template #default>
                                    <div class="">
                                        <BookSelection
                                            class="bg-gray-200"
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

                        <button type="submit" :disabled="form.processing" class="self-start bg-yellow-300 rounded-lg py-2 px-4">
                            Erstellen
                        </button>
                    </form>
                </template>

            </fwb-modal>

            <!-- <div id="book_search_container" class="mt-4">
                <LendingSearch
                    class="rounded-2xl h-12 w-full px-10"
                    @searchChanged="handleValueChange"
                    name="book_search"
                    id="book_search"
                    :value="queryString"
                />
            </div> -->
            

            <div id="lending_output_container" class="space-y-4 mt-6">
                <LendingCard v-for="lending in searchedLendings.data"
                    :id="lending.id"
                    :borrowerName="lending.borrower_name"
                    :borrowDate="lending.borrow_date" 
                    :book="getBookById(lending.id)"
                    :dueDate="lending.due_date"
                    :returned="Boolean(lending.returned)"
                    :isAvailable="true"
                />
                
            </div>


        </div>
    </Layout>
</template>

