<template>
    <DialogDefault
        v-model="isOpenModal"
        title="Добавление комментария"
        confirm-button-text="Добавить"
        persistent
        :width="500"
        @before-hide="handleBeforeHide"
        @apply="handleApply"
    >
        <q-form ref="form" greedy>
            <RowTextWithLabel
                left-part="Комментарий"
                custom-right-part
                vertical
                required
            >
                <template v-slot:right>
                    <q-input
                        v-model="form.input"
                        :maxlength="500"
                        autogrow
                        counter
                        outlined
                        rounded
                        :rules="$rules.r_default"
                    />
                </template>
            </RowTextWithLabel>
        </q-form>
    </DialogDefault>
</template>

<script>
import DialogDefault from 'components/DialogDefault.vue';
import RowTextWithLabel from 'components/RowTextWithLabel.vue';


export default {
    name: 'Template',

    components: {
        DialogDefault,
        RowTextWithLabel,
    },

    data() {
        return () {
            isOpenModal: false,
            form: {
                input: '',
            },
        };
    },

    computed: {
    },

    methods: {
        clearData() {
            this.form.input = '';
        },
        
        handleBeforeHide() {
            this.clearData();
        },

        async validate() {
            return this.$refs.form.validate();
        },

        async handleApply() {
            const isValid = await  this.validate();
            if (!isValid) {
                return;
            }

            // TODO
        },

        async show() {
            this.isOpenModal = true;
        },
    },
};
</script>

<style>
</style>
