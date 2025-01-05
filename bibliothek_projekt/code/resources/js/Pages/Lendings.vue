<script setup lang="ts">
import Layout from '@/Components/Layout.vue';
import BookSearch from '@/Components/BookSearch.vue';
import BookCard from '@/Components/BookCard.vue';
import debounce from 'lodash/debounce';
import { computed, onMounted, ref, watchEffect, reactive } from 'vue';
import { router, usePage, useForm } from '@inertiajs/vue3';
import { FwbModal } from 'flowbite-vue';

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

const date = ref(new Date().toISOString().split('T')[0]);

const form = useForm({
    book_id: '',
    borrower_name: '',
    borrow_date: '',
    due_date: '',
});

const createLending = () => {
    
    console.log("Create Lending");
    form.post('/ausleihen', {
        
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
                            <label for="book_id">Buch</label>
                            <input type="number" name="book_id" id="book_id">
                        </div>

                        <div class="flex flex-col">
                            <label for="borrower_name">Name des Ausleihers</label>
                            <input type="text" name="borrower_name" id="borrower_name">
                        </div>

                        <div class="flex flex-col">
                            <label for="borrow_date">Ausborgedatum</label>
                            <input type="date" name="borrow_date" id="borrow_date" v-model="date">
                        </div>

                        <div class="flex flex-col">
                            <label for="due_date">Ausborgefrist (Deadline)</label>
                            <input type="date" name="due_date" id="due_date">
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
                <BookCard v-for="lending in searchedLendings.data" :key="lending.id"
                    :title="lending.borrower_name"
                    category="Ausleihe"
                    :isAvailable="true"
                    :dueDate="lending.due_date"
                    :returned="lending.returned"
                />
                
            </div>


        </div>
    </Layout>
</template>

