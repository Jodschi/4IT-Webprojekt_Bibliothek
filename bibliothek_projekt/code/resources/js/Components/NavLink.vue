<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
import { defineProps } from 'vue';

defineProps({
    href: {
        type: String,
        required: true,
    },
    isActive: {
        type: Boolean,
        default: false,
    },
});

</script>

<template>

    <li 
        class="list-none font-semibold text-lg tracking-wide"
        :class="[
            isActive 
                ? 'text-yellow-200/50' 
                : 'text-yellow-100 hover:text-yellow-200 transition-colors' ,
        ]"
    >
        <Link :href="href"><slot></slot></Link>
    </li>

</template>