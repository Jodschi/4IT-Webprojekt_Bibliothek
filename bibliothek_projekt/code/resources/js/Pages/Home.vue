<script setup lang="ts">
import Layout from '@/Components/Layout.vue';
import BookSearch from '@/Components/BookSearch.vue';
import BookCard from '@/Components/BookCard.vue';
import debounce from 'lodash/debounce';
import { computed, onMounted, ref, watchEffect } from 'vue';
import { router } from '@inertiajs/vue3';
import { usePage } from '@inertiajs/vue3';

interface Book {
    id: number;
    title: string;
    author: string;
    isbn: number;
    category: string;
    description: string;
    price: number;
    publisher: string;
    created_at: string;
    updated_at: string;
}

interface SearchedBooks {
    data: Book[];
}

// pageProps Objekt
const pageProps = ref(usePage().props);

const queryString = ref<string>('');
const searchedBooks = ref<SearchedBooks>(usePage().props.searched_books as SearchedBooks || { data: [] });

// jedes Mal, wenn sich die pageProps ändern, den queryString und die gesuchten Bücher aktualisieren
watchEffect(() => {
    // Suchstring
    queryString.value = pageProps.value.search_query as string || '';
    // Array von Buch-Objekten
    searchedBooks.value = usePage().props.searched_books as SearchedBooks || { data: [] };
});

const getBooks = (queryString: string) => {
    try {
        router.get('/', { book_search: queryString }, {
            preserveScroll: true,
            preserveState: true,
            only: ['search_query', 'searched_books', 'pageProps'],
            
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
    getBooks(queryString.value);
})

// auf Änderungen im Suchfeld reagieren -> debounce drosselt das Senden von Daten 
const handleValueChange = debounce((value: string) => {
    
    queryString.value = value;
    console.log('Suche: ', value);

    getBooks(queryString.value);

}, 300);


</script>

<template>
    <Layout>
        <div class="bg-red-500/10 w-full flex flex-col">

            <div id="book_search_container" class="mt-4">
                <BookSearch
                    class="rounded-2xl h-12 w-full px-10"
                    @searchChanged="handleValueChange"
                    name="book_search"
                    id="book_search"
                    :value="queryString"
                />
            </div>
            
            <div id="book_output_container" class="space-y-4 mt-6">
                <BookCard v-for="book in searchedBooks.data" :key="book.id"
                    :title="book.title"
                    :category="book.category"
                    :isAvailable="true"
                    dueDate=""
                    :returned="true"
                />
                
            </div>

        </div>
    </Layout>
</template>

