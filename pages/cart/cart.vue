<template>
	<view>
		<!-- 购物车商品列表的标题区域 -->
		<view class="cart-title">
			<!-- 左侧的图标 -->
			<!-- <uni-icons type="shop" size="18"></uni-icons>
			<text class="cart-title-text">购物车</text> -->
			<!-- 描述文本 -->
			<!-- 商品列表区域 -->
			<!-- <uni-swipe-action>是最外层包裹性质的一个容器 -->
			<uni-swipe-action>
				<block v-for="(goods, i) in cart" :key="i">
					<!-- uni-swipe-action-item可以为子节点提供滑动操作的效果，需要通过options属性来指定操作按钮的配置信息 -->
					<uni-swipe-action-item :right-options="options" @click="swipeActionClickHandler(goods)">
						<my-goods :goods="goods" :showRadio="true" :show-num="true" @radio-change="radioChangeHandler" @num-change="numChangeHander"></my-goods>
					</uni-swipe-action-item>
					
				</block>
			</uni-swipe-action>
			<!-- 结算区域 -->
			<my-settle></my-settle>
		</view>
	</view>
</template>

<script>
	import badgeMix from '@/mixins/tabbar-badge.js'
	import {mapState, mapMutations} from 'vuex'
	export default {
		//直接使用mixins方法
		mixins: [badgeMix],
		computed: {
			//把模块mcart中的cart数组映射到当前页面使用
			...mapState('m_cart',['cart'])
		},
		data() {
			return {
				options:[{
					text: '删除',//文本内容
					style: {
						backgroundColor: '#C00000'//按钮背景颜色
					}
				}]
			};
		},
		methods: {
			...mapMutations('m_cart', ['updateGoodsState', 'updateGoodsCount', 'removeGoodsById']),
			
			//商品的勾选状态发生变化
			radioChangeHandler(e) {
				this.updateGoodsState(e)
			},
			//商品的数量发生变化
			numChangeHander(e) {
				this.updateGoodsCount(e)
			},
			//点击了滑动操作按钮
			swipeActionClickHandler(goods) {
				this.removeGoodsById(goods.goods_id)
				//用于删除后更新角标（为啥这么写我也不太清楚）
				this.setBadge()
			}
		}
		
		
	}
</script>

<style lang="scss">
.cart-title {
	height:40px;
	display: flex;
	flex-direction: column;
	align-items: center;
	font-size: 14px;
	padding-left: 1px solid #efefef;
	
	.cart-title-text {
		margin-left: 10px;
		
	}
	
}
.cart-container {
  padding-bottom: 50px;
}

</style>