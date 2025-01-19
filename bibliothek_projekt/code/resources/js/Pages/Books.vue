<script setup lang="ts">
import Layout from '@/Components/Layout.vue';
import BookSearch from '@/Components/BookSearch.vue';
import BookCard from '@/Components/BookCard.vue';
import EditBookModal from '@/Components/EditBookModal.vue';
import CreateBookModal from '@/Components/CreateBookModal.vue';
import debounce from 'lodash/debounce';
import { computed, onMounted, ref, watch, watchEffect } from 'vue';
import { router } from '@inertiajs/vue3';
import { usePage } from '@inertiajs/vue3';
import type { AuthProp } from '@/Types/Auth';

export interface Book {
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

const user = ref((usePage().props.auth as AuthProp).user);
console.log('User:', user.value);
watch(() => usePage().props.auth as AuthProp, (newAuth: AuthProp) => {
    user.value = newAuth.user; // Update the `user` ref when `auth` changes
    if (user.value) {
        console.log('User:', user.value);
    }
});

// States für die Büchersuche
const queryString = ref<string>('');
const searchedBooks = ref<SearchedBooks>(usePage().props.searched_books as SearchedBooks || { data: [] });

// States für die Modals
const creationModalVisible = ref<boolean>(false);
const editModalVisible = ref<boolean>(false);
const clickedBook = ref<Book|null>(null);


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


const openEditModal = (book: Book) => {
    clickedBook.value = book;
    editModalVisible.value = true;
}

const openCreationModal = () => {
    creationModalVisible.value = true;
}

const closeCreationModal = (): void => {
    creationModalVisible.value = false;
}

const closeEditModal = (): void => {
    editModalVisible.value = false;
    clickedBook.value = null;
}

const handleBookDeletion = (id: number) => {
    if (confirm('Sind Sie sicher, dass Sie dieses Buch entfernen möchten?')) {
        router.delete(`/buecher/${id}`, {
            onSuccess: () => {
                // Aktualisieren Sie die Liste der Ausleihen nach dem Löschen
                getBooks(queryString.value);
            },
            onError: (error) => {
                console.error('Error deleting book:', error);
            },
            preserveScroll: true,
        });
    }
}

const onSuccessfulCreate = () => {
    closeCreationModal();
}

const onSuccessfulPatch = () => {
    closeEditModal();
    clickedBook.value = null;
}

</script>

<template>
    <Layout>
        <div class="w-full flex flex-col">

            <div v-if="user" class="bg-red-500/0 w-full my-5">
                <button @click="openCreationModal"
                    class="text-white shadow-xl hover:shadow-2xl font-semibold tracking-wide text-lg bg-yellow-400 hover:bg-yellow-500 transition-all rounded-xl p-3">
                    
                    <span class="drop-shadow-lg">+ Neues Buch hinzufügen</span>
                </button>
            </div>

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
                    :book="book"
                    :availabe="true"
                    :due-date="undefined"
                    :returned="true"
                    @on-edit="openEditModal"
                    @on-delete="handleBookDeletion"
                />
            </div>

            <CreateBookModal v-if="creationModalVisible"
                :close-modal="closeCreationModal"
                @on-successful-create="onSuccessfulCreate"
            />


            <EditBookModal v-if="editModalVisible && clickedBook"
                :book="clickedBook"
                :close-modal="closeEditModal"
                @on-successful-patch="onSuccessfulPatch"
            />

        </div>
    </Layout>
</template>

