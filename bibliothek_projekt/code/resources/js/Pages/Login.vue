<template>
    <div class="h-full bg-red-50/0 items-center space-x-6 ">
        <main class="flex justify-center items-center min-h-svh bg-gradient-to-b from-yellow-900/80 to-yellow-800/80">
            
            <div class="min-w-1/4 bg-black/20 p-10 rounded-lg text-2xl text-white shadow-2xl">
                <form @submit.prevent="handleLogin" class="flex flex-col space-y-4 justify-center items-center">
                    <h1 class="font-semibold mb-6 text-4xl">Als Bibliothekar anmelden</h1>
                    <div class="flex flex-col space-y-2">
                        <label for="email">Email:</label>
                        <input class="rounded-md" type="email" v-model="form.email" id="email" required />
                    </div>
                    <div class="flex flex-col space-y-2">
                        <label for="password">Password:</label>
                        <input class="rounded-md" type="password" v-model="form.password" id="password" required />
                    </div>
                    <button class="rounded-xl px-5 py-2 bg-black/30 mb-10" type="submit">Login</button>
                </form>
            </div>

        </main>
    </div>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3';
import { ref } from 'vue';


const form = useForm({
    email: '',
    password: '',
});

const handleLogin = () => {
    // Handle login logic here
    console.log('Email:', email.value);
    console.log('Password:', password.value);

    form.post(route('login'));
};



</script>
