<script setup lang="ts">
import type { Book } from '@/Pages/Books.vue';
import { ref, watch, onMounted } from 'vue';

const props = defineProps<{
    id: number;
    borrowerName: string;
    borrowDate: string;
    dueDate: string;
    returned: boolean;
    book: Book | null;
    librarianName: string;
}>();

const emit = defineEmits(['onEdit', 'onDelete']);

const handleEdit = () => {
    emit('onEdit', props.id);
}

const handleDelete = () => {
    emit('onDelete', props.id);
}

const isOverdue = ref<boolean>();

const getTodayDateFormatted = (): string => {
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');

    return `${year}.${month}.${day}`;
}

const checkIfOverdue = (todayDateString:string, dueDateString:string): boolean => {
    const todayDate = new Date(todayDateString);
    const dueDate = new Date(dueDateString);
    
    // Wenn das heutige Datum größer ist wie das Rückgabedatum, ist das Buch überfällig
    if (dueDate < todayDate) {
        console.log("isOverdue:", isOverdue.value, todayDate, dueDate);
        return true;
    } else {
        console.log("isOverdue:", isOverdue.value, todayDate, dueDate);
        return false;
    }
}

onMounted(() => {
    const currentDate: string = getTodayDateFormatted();

    if (checkIfOverdue(currentDate, props.dueDate)) {
        isOverdue.value = true;
    } else {
        isOverdue.value = false;
    }
});

watch(isOverdue, () => {
    console.log("isOverdue:", isOverdue.value);
});




</script>


<template>

<div class="h-36 rounded-xl shadow-xl bg-gradient-to-r from-yellow-100 to-yellow-200 justify-between flex flex-col p-5">
    
    <div class="flex ml-8 justify-between">
        <div class="">
            <div class="flex flex-col">
                <span v-html="book?.title" class="font-semibold text-lg"></span>
                <span class="text-black/60">Ausgeliehen von: {{ borrowerName }}</span>
                <span class="text-black/60">Von Bibliothekar: {{ librarianName }}</span>
            </div>
            
        </div>
        
        <div class="mr-8 flex flex-col">
            <span v-if="!isOverdue">ausgeliehen bis: {{ dueDate }}</span>
            <span v-if="isOverdue && !returned" class="text-red-600">Überfällig - Rückgabedatum am {{ dueDate }}</span>
            <span v-if="returned" class="text-green-600">Zurückgegeben (Verfügbar)</span>
        </div>
    </div>
    

    <div class="mr-8 mb-6 flex space-x-5 font-semibold justify-end">
        <div>
            <button 
                @click="handleEdit" 
                class="text-blue-700 bg-blue-200 p-1 rounded-lg border-blue-200 border-2 shadow-lg">Bearbeiten
            </button>
        </div>

        <div>
            <button 
                @click="handleDelete" 
                class="text-red-950 bg-red-700 p-1 rounded-lg border-red-700 border-2 shadow-lg">Löschen
            </button>
        </div>
    </div>

</div>

</template>