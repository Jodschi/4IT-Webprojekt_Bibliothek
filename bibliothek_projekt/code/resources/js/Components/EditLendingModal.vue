<script setup lang="ts">
</script>

<template>
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
                                <BookSelection class="bg-gray-200" v-for="book in books" :id="book.id"
                                    :category="book.category" :title="book.title" :author="book.author" :dueDate="null"
                                    :isAvailable="null" :returned="null" />

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
</template>