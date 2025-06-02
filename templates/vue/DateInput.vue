<template>
    <RowTextWithLabel
        left-part="Укажите дату"
        custom-right-part
        vertical
        required
    >
        <template v-slot:right>
            <InputDateDefault
                v-model="date"
                block-future-dates
                fill-mask
                required
                :rules="$rules.r_date"
            />
        </template>
    </RowTextWithLabel>
</template>

<script>
import InputDateDefault from 'components/InputDateDefault';

export default {
    name: 'DateInput',

    components: {
        InputDateDefault,
    },

    data() {
        return {
            date: '',
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


