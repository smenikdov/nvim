<template>
    <RowTextWithLabel
        left-part="Согласие"
        custom-right-part
        vertical
        required
    >
        <template v-slot:right>
            <q-checkbox
                v-model="value"
                label="Example"
            />
        </template>
    </RowTextWithLabel>
</template>

<script>
import RowTextWithLabel from 'components/RowTextWithLabel.vue';

export default {
    name: 'Checkbox',

    components: {
        RowTextWithLabel,
    },

    data() {
        return {
            value: true,
        };
    },

    computed: {
    },

    methods: {
    },
};
</script>

<style>
</style>


