<script setup lang="ts">
import Layout from '@/Components/Layout.vue';
import BookSearch from '@/Components/BookSearch.vue';
import BookCard from '@/Components/BookCard.vue';
import debounce from 'lodash/debounce';
import { ref } from 'vue';


const inputString = ref<string>('');

// auf Änderungen im Suchfeld reagieren -> debounce drosselt das Senden von Daten ein wenig
const handleValueChange = debounce((value: string) => {
    
    inputString.value = value;
    console.log('Suche: ', value);

}, 300);


</script>

<template>
    <Layout>
        <div class="bg-red-500/10 w-full flex flex-col">
            <div id="book_search_container" class="mt-4">
                <BookSearch class="rounded-2xl h-12 w-full px-10"
                    @searchChanged="handleValueChange"
                />
            </div>
            
            <div id="book_output_container" class="space-y-4 mt-6">
                <BookCard
                    title="TESTBUCH"
                    dueDate="01.01.2000"
                    :returned="true"
                />
                
            </div>


        </div>
    </Layout>
</template>

