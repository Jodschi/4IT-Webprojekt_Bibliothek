<script setup lang="ts">
import { ref, watch } from 'vue';
import { onMounted } from 'vue';

const props = defineProps<{
    id: number;
    title: string;
    category: string;
    author: string | null;
    isAvailable: boolean | null | undefined;
    dueDate: string | null | undefined;
    returned: boolean | null | undefined;
}>();

</script>


<template>

<div>
    <div class="ml-8">
        <div class="flex flex-col">
            <span v-html="title" class="font-semibold"></span>
            <div>
                <span class="text-black/60">Kategorie: </span>
                <span v-html="category" class="text-black/60"></span>
            </div>
        </div>

    </div>

</div>

</template>