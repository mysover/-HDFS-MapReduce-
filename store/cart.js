//购物车的store模块

 export default {
	 namespaced: true,
	 
	 state: () => ({
		 // 购物车的数组，用来存储购物车中每个商品的信息对象
		     // 每个商品的信息对象，都包含如下 6 个属性：
		     // { goods_id, goods_name, goods_price, goods_count, goods_small_logo, goods_state }
		//改为从本地文件中读取
			 cart: JSON.parse(uni.getStorageSync('cart') || '[]')
		 //cart: []
	 }),
	 
	 mutations: {
		 addToCart(state, goods) {
			 //根据提交的商品id，先判断是否存在该商品
			 //如果不存在，findResult则为undefined，若存在则为对象
			 const findResult = state.cart.find(x => x.foodId === goods.foodId)
			 
			 if(!findResult) {
				 //当购物车中没有该商品时，push该商品
				 state.cart.push(goods)
				 //存在该商品时，数量+1
			 } else {
				 findResult.foods_count++
			 }
			 //通过commit方法，调用m_cart命名空间下的saveToStorage方法
			 this.commit('m_cart/saveToStorage')
		 },
		 //本地化持久村粗购物车内容
		 saveToStorage(state) {
			 uni.setStorageSync('cart', JSON.stringify(state.cart))
		 },
		 //更新购物车中商品的选中状态
		 updateGoodsState(state, goods) {
			 //根据goods_id查询购物车中对应的商品信息对象
			 const findResult = state.cart.find(x => x.foodId === goods.foodId)
			 
			 //有对应的商品信息
			 if(findResult) {
				 //更新对应的商品勾选状态
				 findResult.foods_state = goods.foods_state
				 //持久化存储至本地
				 this.commit('m_cart/saveToStorage')
			 }
		 },
		 //更新购物车中商品的数量
		 updateGoodsCount(state, goods) {
		 	 //根据goods_id查询购物车中对应的商品信息对象
		 	 const findResult = state.cart.find(x => x.foodId === goods.foodId)
		 			 
		 	 if(findResult) {
		 		 //更新对应商品的数量
		 		 findResult.foods_state = goods.foods_state
		 		 //持久化本地存储
		 		 this.commit('m_cart/saveToStorage')
		 	 }
		 },
		 //根据id从购物车中删除对应的商品信息
		 removeGoodsById(state, foodId) {
			 //调用数组的filter方法进行过滤
			 state.cart = state.cart.filter(x => x.foodId !== foodId)
			 //本地化持久存储
			 this.commit('m_cart/saveToStorage')
		 },
		 // 更新所有商品的勾选状态
		 updateAllGoodsState(state, newState) {
		   // 循环更新购物车中每件商品的勾选状态
		   state.cart.forEach(x => x.foods_state = newState)
		   // 持久化存储到本地
		   this.commit('m_cart/saveToStorage')
		 }
		 
		 
	 },
	 
	 getters: {
		 //统计购物车中商品的总数量
		 //使用普通函数的形式定义的 watch 侦听器，在页面首次加载后不会被调用。因此导致了商品详情页在首次加载完毕之后，不会将商品的总数量显示到商品导航区域
		 total(state) {
			 let c = 0
			 //循环商品的数量，累加到变量c中
			 state.cart.forEach(goods => c+= goods.foods_count)
			 return c
		 },
		 // 勾选的商品的总数量
		 checkedCount(state) {
		   // 先使用 filter 方法，从购物车中过滤器已勾选的商品
		   // 再使用 reduce 方法，将已勾选的商品总数量进行累加
		   // reduce() 的返回值就是已勾选的商品的总数量
		   return state.cart.filter(x => x.foods_state).reduce((total, item) => total += item.foods_count, 0)
		 },
		 // 已勾选的商品的总价
		 checkedGoodsAmount(state) {
		   // 先使用 filter 方法，从购物车中过滤器已勾选的商品
		   // 再使用 reduce 方法，将已勾选的商品数量 * 单价之后，进行累加
		   // reduce() 的返回值就是已勾选的商品的总价
		   // 最后调用 toFixed(2) 方法，保留两位小数
		   return state.cart.filter(x => x.foods_state)
		                    .reduce((total, item) => total += item.foods_count * item.foodSmallPrice, 0)
		                    .toFixed(2)
		 }
		 
	 },
 }