<template>
    <TableOldDefault
        wrap-cells
        :data="data"
        :columns="columns"
        :pagination="{ rowsPerPage: 25 }"
        :rows-per-page-options="[0]"
        no-data-label="Данные не найдены"
    >

        <template v-slot:body-cell-example1="props">
            <div class="flex items-center justify-center no-wrap">
                {{ props.row.example1 }}
            </div>
        </template>

        <template v-slot:body-cell-example2="props">
            {{ $constants.example2[props.row.example2] }}
        </template>

        <template v-slot:body-cell-example3="props">
            <div>
                {{ props.row.example3 }}
            </div>
            <div
                class="text-italic text-grey-7"
                style="font-size: 0.9rem; white-space: nowrap;"
            >
                {{ props.row.example3Description }}
            </div>
        </template>

        <template v-slot:body-cell-projectId="props">
            <RouterLink
                :to="{
                    name: 'projects',
                    query: { projectId: props.row.projectId }
                }"
            >
                № {{ props.row.projectId }}
            </RouterLink>
        </template>

        <template v-slot:body-cell-projectStatus="props">
            <ChipDefault
                :color="$constants.projectStatuses[props.row.projectStatus]"
            />
        </template>

        <template v-slot:body-cell-icon="props">
            <IconDefault
                :name="props.row.isIcon ? 'fas fa-check-circle' : 'fas fa-minus-circle'"
                :color="props.row.isIcon ? 'positive' : 'warning'"
                size="sm"
            />
        </template>

        <template v-slot:body-cell-actions="props">
            <div>
                <ButtonDefault
                    flat
                    label="Открыть"
                    @click="TODO"
                />
            </div>
        </template>
    </TableOldDefault>
</template>

<script>
import TableOldDefault from 'components/TableOldDefault.vue';
import ChipDefault from 'components/ChipDefault.vue';
import IconDefault from 'components/IconDefault.vue';
import ButtonDefault from 'components/ButtonDefault.vue';

export default {
    name: 'Table',

    components: {
        TableOldDefault,
        ChipDefault,
        IconDefault,
        ButtonDefault,
    },

    data() {
        return {
            data: [],
        };
    },

    computed: {
        columns() {
            return [
                {
                    name:   'example1',
                    label:  'Пример 1',
                },
                {
                    name:   'example2',
                    label:  'Пример 2',
                    format: (val) => val || '—',
                },
                {
                    name:   'amount',
                    label:  'Сумма операции',
                    format: (val) => `${ this.addSpacesToNumber(val || 0) } ₽`,
                },
                {
                    name:   'createDate',
                    label:  'Дата добавления',
                    format: (val) => this.$formattingDate(val, true),
                },
            ];
        },
    },

    methods: {
    },
};
</script>

<style>
</style>
