<template>
	<view>
		<!-- 用户未登录时，显示登录组件 -->
		<my-login v-if="!hasUserInfo"></my-login>
		
		<!-- 用户登录后，显示用户信息组件 -->
		<my-userinfo v-else></my-userinfo>
	</view>
</template>

<script>
	import badgeMix from '@/mixins/tabbar-badge.js'
	import { mapState} from 'vuex'
	export default {
		mixins: [badgeMix],
		computed:{
			...mapState('m_user', ['token']),
		},
		data() {
			return {
				
			};
		}
	}
</script>

<style lang="scss">

</style>
