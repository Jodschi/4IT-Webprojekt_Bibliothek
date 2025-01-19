<template>
    <Layout>
        <div class="bg-red-50/0 flex flex-grow items-center justify-center space-x-6 ">    
            <div class="h-full bg-amber-950/40 p-10 rounded-xl text-2xl text-white shadow-2xl flex justify-center items-center">
                <form @submit.prevent="handleLogin" class="flex flex-col space-y-4 justify-center items-center">
                    <h1 class="font-semibold mb-10 text-5xl">Als Bibliothekar anmelden</h1>
                    <div class="flex flex-col space-y-2 w-2/3">
                        <label for="email">Email:</label>
                        <input class="rounded-md text-black" type="email" v-model="form.email" id="email" required />
                    </div>
                    <div class="flex flex-col space-y-2 w-2/3">
                        <label for="password">Password:</label>
                        <input class="rounded-md text-black" type="password" v-model="form.password" id="password" required />
                    </div>
                    <button class="rounded-xl px-5 py-2 bg-black/30" type="submit">Login</button>
                </form>
            </div>
        </div>
    </Layout>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
import Layout from '@/Components/Layout.vue';


const form = useForm({
    email: '',
    password: '',
});

const handleLogin = () => {
    // Handle login logic here
    console.log('Email:', form.email);
    console.log('Password:', form.password);

    form.post('/login', 
        {
            onFinish: () => {
                console.log('Login finished');
            },
            onSuccess: (response) => {
                console.log('Login success:', response);
            },
            onError: (errors) => {
                console.log('Login error:', errors);
            }
        }
    );
};



</script>
