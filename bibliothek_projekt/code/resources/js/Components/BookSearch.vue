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

<div>
    <input @input="handleInputChange" v-bind="$attrs"
        type="text" 
        placeholder="Bücher suchen ..."
    >
</div>

</template>