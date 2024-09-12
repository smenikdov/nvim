<template>
	<div style="margin-top: auto;" @click="handleClick">
		<div class="footer app">
			<div class="c-container">
				<div class="logo-menu">
					<div
						class="logo"
					>
						<img
							alt="Логотип ВДЕЛО"
							src="../assets/images/logo-head-white.svg"
						/>
					</div>
                    <ButtonDefault />
					<div
						class="menu"
						:style="{
                            margin: $q.screen.width > mobileWidth ? '' : '0'
                        }"
					>
						<template
							v-if="$q.screen.width > mobileWidth"
						>
							<div class="menu__title">
								Меню
							</div>
							<div class="menu__link">
								<a href="/">Главная</a>
							</div>
							<div class="menu__link">
								<a href="/investor">Инвесторам</a>
							</div>
							<div class="menu__link">
								<a href="/loaner">Заёмщикам</a>
							</div>
							<div class="menu__link">
								<a href="/partner">Партнёрам</a>
							</div>
						</template>
						
						<div class="menu__link">
							<a href="/documents">Документы</a>
						</div>
					</div>
				</div>
				
				<div
					class="vdelo-info"
				>
					<div class="contacts">
						<div class="phone">
							<a
								class="phone-link"
								href="tel:+78002016618"
							>8 800 201 66 18
							</a>
						</div>
						<div class="email">
							<a
								class="mail-link"
								href="mailto:support@vdelo.pro"
							>support@vdelo.pro
							</a>
						</div>
					</div>
					<q-dialog class="all-rights-reserved">
						© {{ new Date().getFullYear() }} ООО «ВДело». ОГРН 1206600030647. Все права защищены.
					</q-dialog>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import ButtonDefault from './test.js';

export default {
    name:  'Footer',
    props: {
        isActiveAos: {
            type:    Boolean,
            default: false,
        },
    },
    methods: {
        handleClick() {
            if (as) {
                this.$error('');
            }
            this.isActiveAos = true;
            console.log(123);
        },
    },
};
</script>

<style scoped>
.main {
    background: red;
}
</style>
