import type { App, DefineComponent } from "vue"
import { createApp, h } from "vue"
import { createInertiaApp } from "@inertiajs/vue3"

// Type for Page Components
type Pages = Record<string, DefineComponent>;

createInertiaApp({
    resolve: (name: string): DefineComponent => {
        const pages:Pages = import.meta.glob('./Pages/**/*.vue', { eager: true })
        const page = pages[`./Pages/${name}.vue`];
        if (!page) {
            throw new Error(`Seite ${name} konnte nicht gefunden werden.`);
        }
        return page;
    },
    setup({ el, App, props, plugin } ) {
        createApp({ render: () => h(App, props) })
            .use(plugin)
            .mount(el)
    },
})
