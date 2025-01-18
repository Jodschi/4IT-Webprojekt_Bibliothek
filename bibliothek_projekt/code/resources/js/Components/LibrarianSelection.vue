<script setup lang="ts">
import { ref, watch, onMounted, defineEmits } from 'vue';
import type { Librarian } from '@/Types/Librarian';

const props = defineProps<{
    librarian: Librarian;
}>();

const emit = defineEmits(['on-select']);

const handleClick = () => {
    emit('on-select', props.librarian.id);
}


</script>


<template>

<button @click.prevent="handleClick">
    <div class="mx-5">
        <div class="flex flex-col" >
            <span v-html="librarian.username" class="font-semibold"></span>
            <div>
                <span class="text-black/60">Email: </span>
                <span v-html="librarian.email" class="text-black/60"></span>
            </div>
        </div>

    </div>

</button>

</template>