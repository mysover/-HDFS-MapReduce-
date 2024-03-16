//导入vue和vuex
import Vue from 'vue'
import Vuex from 'vuex'
//导入购物车模块
import moduleCart from '@/store/cart.js'
//导入用户模块
import moduleUser from '@/store/users.js'
Vue.use(Vuex)

const store = new Vuex.Store({
	
	modules: {
		// 挂载购物车的 vuex 模块
		'm_cart': moduleCart,
		// 挂载用户的 vuex 模块
		'm_user': moduleUser
	},
})

export default store