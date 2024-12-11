<script setup lang="ts">
defineProps<{
    title: string;
    dueDate: string;
    returned: boolean;
}>();

</script>

<template>

<div class="h-16 rounded-md bg-gradient-to-r from-yellow-100 to-yellow-200 flex items-center justify-between">
    <div class="ml-8">
        <span v-html="title"></span>
    </div>

    <div class="mr-8">
        <span>ausgeliehen bis: {{dueDate}}</span>
    </div>
</div>

</template>