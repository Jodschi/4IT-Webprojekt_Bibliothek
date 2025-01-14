<script setup lang="ts">
import type { Book } from '@/Pages/Books.vue';
import { ref, watch, onMounted } from 'vue';

const props = defineProps<{
    id: number;
    borrowerName: string;
    borrowDate: string;
    dueDate: string;
    returned: boolean;
    isAvailable: boolean;
    book: Book | null;
}>();

const emit = defineEmits(['onEdit', 'onDelete']);

const handleEdit = () => {
    emit('onEdit', props.id);
}

const handleDelete = () => {
    emit('onDelete', props.id);
}

const isOverdue = ref<boolean>(true);

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
        // console.log("isOverdue:", isOverdue.value, todayDate, dueDate);
        return true;
    } else {
        // console.log("isOverdue:", isOverdue.value, todayDate, dueDate);
        return false;
    }
}

onMounted(() => {
    const currentDate: string = getTodayDateFormatted();

    if (checkIfOverdue(currentDate, props.dueDate) && !props.returned) {
        isOverdue.value = true;
    } else {
        isOverdue.value = false;
    }
});

watch(isOverdue, () => {
    // console.log("isOverdue:", isOverdue.value);
});




</script>


<template>

<div class="h-32 rounded-md bg-gradient-to-r from-yellow-100 to-yellow-200 justify-between flex flex-col p-5">
    
    <div class="flex ml-8 justify-between">
        <div class="">
            <div class="flex flex-col">
                <span v-html="book?.title" class="font-semibold"></span>
                <div>
                    <span class="text-black/60">Ausgeliehen von: </span>
                    <span v-html="borrowerName" class="text-black/60"></span>
                </div>
            </div>
            
        </div>
        
        <div class="mr-8 ">
            <span v-if="!isOverdue">ausgeliehen bis: {{ dueDate }}</span>
            
            <span v-if="isOverdue" class="text-red-600">Überfällig - Rückgabedatum am {{ dueDate }}</span>
        </div>
    </div>
    

    <div class="ml-8 flex space-x-5 font-semibold">
        <div>
            <button @click="handleEdit" 
                class="text-blue-500">Bearbeiten</button>
        </div>

        <div>
            <button @click="handleDelete" 
                class="text-red-500">Löschen</button>
        </div>
    </div>

</div>

</template>