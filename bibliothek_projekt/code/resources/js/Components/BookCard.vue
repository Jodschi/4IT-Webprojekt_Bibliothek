<script setup lang="ts">
import { ref, watch } from 'vue';
import { onMounted } from 'vue';

const props = defineProps<{
    title: string;
    category: string;
    isAvailable: boolean;
    dueDate: string;
    returned: boolean;
}>();

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
        console.log("isOverdue:", isOverdue.value, todayDate, dueDate);
        return true;
    } else {
        console.log("isOverdue:", isOverdue.value, todayDate, dueDate);
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
    console.log("isOverdue:", isOverdue.value);
});

</script>


<template>

<div class="h-16 rounded-md bg-gradient-to-r from-yellow-100 to-yellow-200 flex items-center justify-between">
    <div class="ml-8">
        <div class="flex flex-col">
            <span v-html="title" class="font-semibold"></span>
            <span v-html="category" class="text-black/60"></span>
        </div>

    </div>

    <div class="mr-8">
        <span v-if="!isOverdue">ausgeliehen bis: {{ dueDate }}</span>
        
        <span v-if="isOverdue" class="text-red-600">Überfällig - Rückgabedatum am {{ dueDate }}</span>
    </div>
</div>

</template>