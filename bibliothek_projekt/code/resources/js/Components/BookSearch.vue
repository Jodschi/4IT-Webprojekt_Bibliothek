<script setup lang="ts">


const emit = defineEmits<{
    (event: 'searchChanged', value: string): void;
}>();

const handleInputChange = (event: Event) => {
    const target = event.target as HTMLInputElement; 
    emit('searchChanged', target.value);
};

</script>

<template>

<input @input="handleInputChange" v-bind="$attrs"
    type="text" 
    placeholder="Bücher suchen ..."
>

</template>