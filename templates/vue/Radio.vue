<template>
    <RowTextWithLabel
        left-part="Укажите дату"
        custom-right-part
        vertical
        required
    >
        <template v-slot:right>
            <q-radio
                v-model="value"
                :val="true"
                label="Example 1"
            />
            <q-radio
                v-model="value"
                :val="false"
                label="Example 2"
            />
        </template>
    </RowTextWithLabel>
</template>

<script>
import RowTextWithLabel from 'components/RowTextWithLabel.vue';

export default {
    name: 'Radio',

    components: {
        RowTextWithLabel,
    },

    data() {
        return {
            value: 1,
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


