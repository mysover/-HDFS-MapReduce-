<template>
	<view>
		<!-- 在使用组件的时候可以用:做动态属性绑定，以覆盖props中的默认值 -->
		<!-- <my-search @click="gotoSearch()"></my-search> -->
		<!-- 暂时屏蔽搜索组件 -->
		<view class="scroll-view-container">
			<!-- 左侧华东区域 -->
			<scroll-view class="left-scroll-view" scroll-y="true" :style="{height: wh + 'px'}">
				<block v-for="(item, i) in cateList" :key="i">
					<!-- 动态绑定，用三元表达式判定active与否 -->
					<view :class="['left-scroll-view-item',i === active ? 'active' : '']" @click="activeChanged(i)">{{item.canteenName}}</view>
				</block>
				<!-- <view class="left-scroll-view-item">111</view> -->
				
			</scroll-view>
			<!-- 右侧华东区域 -->
			<scroll-view scroll-y="true" :style="{height: wh + 'px'}" style="background-color: #ffffff;" :scroll-top="scrollTop">
				<!-- <view class="cate-lv2" v-for="(item2, i2) in cateLevel2" :key="i2"> -->
					<!-- 二级分类标题 -->
					<!-- 这个暂时用不上，以后更改表单结构再说 -->
					<!-- <view class="cate-lv2-title">/ {{item2.shopName}} /</view> -->
					<!-- 二级分类下的三级分类列表 -->
					<view class="cate-lv3-list">
						<view class="cate-lv3-item" v-for="(item3, i3) in cateLevel2" :key="i3" @click="gotoshopdetail(item3)">
							<!-- 不加.replace('dev','web')会显示不出来，这个我不知道为什么 -->
							<image :src="item3.image.replace('dev','web')"></image>
							<text>{{item3.shopName}}</text>
						</view>
					</view>
					
				<!-- </view> -->
				
			</scroll-view>
		</view>
	</view>
</template>

<script>
	import badgeMix from '@/mixins/tabbar-badge.js'
	
	export default {
		mixins: [badgeMix],
		data() {
			return {
				cateList: [],
				//二级分类列表
				cateLevel2: [],
				active: 0,
				//当前设备可用高度
				wh: 0,
				scrollTop: 0
			};
		},
		onLoad() {
			//调用小程序api，拿到设备信息
			const sysInfo = uni.getSystemInfoSync()
			//console.log(sysInfo)
			//获取设备可用窗体高度
			this.wh = sysInfo.windowHeight - 50 //50是搜索区域的高度，搜索区域会挤占可用高度
			this.getCateList()
			
			uni.hideLoading()
		},
		methods: {
			//获取分类列表数据
			async getCateList(){
				const {data: res} = await uni.$http.get('/wxxcx/food/canteen')
				if(res.code !== 0) return uni.$showMsg()
				this.cateList = res.data
				
				//为二级分类赋值
				//const {data: res2} = await uni.$http.get('/wxxcx/food/shopList')
				//if(res2.code !== 0) return uni.$showMsg()
				this.cateLevel2 = res.data[0].shopVO
			},
			activeChanged(i){
				this.active = i
				
				//重新为二级分类赋值
				this.cateLevel2 = this.cateList[i].shopVO
				//重置滚动条，直接赋固定值会出bug，用三元表达式01之间反复横跳
				this.scrollTop = this.scrollTop === 0 ? 1 : 0
				//也可以简写为this.scrollTop = this.scrollTop ? 0 : 1
			},
			//跳转至店铺详情页面
			gotoshopdetail(item3){
				uni.navigateTo({
					url: '/subpkg/shop_detail/shop_detail?shopId=' + item3.shopId
				})
			},
			//用于跳转至search页面
			gotoSearch(){
				uni.navigateTo({
					url:'/subpkg/search/search'
				})
			}
		}
	}
</script>

<style lang="scss">
.scroll-view-container {
	display: flex;
}
.left-scroll-view {
	width: 120px;
}
.left-scroll-view-item {
	background-color: #f7f7f7;
	line-height: 60px;
	text-align: center;
	font-size: 12px;
	position: relative;
	// 单独设定激活项样式，&用于识别特定class项（actice为自定义名称）
	&.active {
		background-color: #ffffff;
		// 头部伪元素，空字符，背景颜色，调整这一小块区域的大小与位置
		&::before {
			content: ' ';
			display: block;
			width: 3px;
			height: 30px;
			background-color: #c00000;
			//绝对定位
			position: absolute;
			//位置摆正
			top: 50%;
			left: 0;
			transform: translateY(-50%);
		}
	}

}
.cate-lv2-title{
	font-size: 12px;
	font-weight: bold;
	text-align: center;
	padding: 12px 0;
}
.cate-lv3-list{
	display: flex;
	//wrap用于盛放不下自动换行
	flex-wrap: wrap;
	
	.cate-lv3-item{
		//一行放三个
		width: 33.33%;
		display: flex;
		//纵向布局
		flex-direction: column;
		//纵向居中
		justify-content: center;
		//横向居中
		align-items: center;
		//加一个下margin，省的靠得太近
		margin-bottom: 10px;
		image{
			width: 60px;
			height: 60px;
		}
		text{
			font-size: 12px;
		}
	}
}
</style>
