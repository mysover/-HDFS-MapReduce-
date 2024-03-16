<template>
	<view>
		<!-- 搜索组件 -->
		<!-- 提供吸顶效果，需要在组件外面包裹一个容器，对包裹的容器即可添加吸顶效果 -->
		<!-- 暂时屏蔽掉搜索模块 -->
		<!-- <view class="search-box">
			<my-search @click="gotoSearch()"></my-search>
		</view> -->
		<!--使用usws快捷生成-->
		<!-- 轮播图组件暂时不用它 -->
		<!-- <swiper :indicator-dots="true" :autoplay="true" :interval="3000" :duration="1000" :circular="true">
			<swiper-item v-for="(item,i) in swiperList" :key=i>
				<navigator class="swiper-item" :url="'/subpkg/goods_detail/goods_detail?goods_id=' + item.goods_id">
					<image :src="item.image_src"></image>
				</navigator>
				
			</swiper-item>
		</swiper>
		 -->
		<!-- 分类导航区域 -->
		<!-- 后续 -->
		<!-- <view class="nav-list">
			<view class="nav-item" v-for="(item, i) in navList" :key="i" @click="navClickHandler(item)">
				<image :src="item.image_src" class="nav-img"></image>
			</view>
		</view> -->
		<!-- 楼层区域 -->
		<view class="floor-list">
			<view class="floot-item" v-for="(item, i) in floorList" :key="i">
				<image :src="item.bigKind[0].image_src" class="floor-title"></image>
				<view class="floor-img-box">
					<!-- 左侧大图片盒子 -->
					<navigator class="left-img-box" :url="item.smallKind[0].url">
						<image :src="item.smallKind[0].image_src" :style="{width: item.smallKind[0].image_width + 'rpx'}" mode="widthFix"></image>
					</navigator>
				
					<!-- 右侧小图片盒子-->
					<view class="right-img-box">
						<navigator class="right-img-item" v-for="(item2, i2) in item.smallKind" :key="i2" v-if="i2 !== 0" :url="item2.url">
							<image :src="item2.image_src" :style="{width: item2.image_width + 'rpx'}" mode="widthFix"></image>
						</navigator>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import badgeMix from '@/mixins/tabbar-badge.js'
	
	export default {
		mixins: [badgeMix],
		data() {
			return {
				//轮播图数据列表
				swiperList: [],
				//分类导航数据列表
				navList:[],
				//楼层数据
				floorList:[]
				
			};
		},
		onLoad() {
			this.getSwiperList()
			
			this.getNavList()
			
			this.getFloorList()
			
			uni.hideLoading()
		},
		methods: {
			async getSwiperList() {
				// 这个函数暂时用不上
				// const {data:res} = await uni.$http.get('/api/public/v1/home/swiperdata')
				// //console.log(res)
				// if(res.meta.status !== 200) return uni.$showMsg()
				// // {
				// // 	return uni.showToast({
				// // 		title: '数据请求失败了',
				// // 		duration: 1500,
				// // 		icon: 'none'
				// // 	})
				// // }
				// this.swiperList = res.message
				// uni.$showMsg('数据请求成功!')
			},
			async getNavList(){
				// 这段代码暂时用不上
				// const {data:res} = await uni.$http.get('/wxxcx/food/????')
				// if(res.code !== 0) return uni.$showMsg()
				// this.navList = res.data
			},
			navClickHandler(item){
				
				if(item.name === '分类') {
					uni.switchTab({
						url: '/pages/cate/cate'
					})
				}
			},
			//获取首页楼层数据的方法
			async getFloorList() {
				const {data:res} = await uni.$http.get('/wxxcx/food/kind')
				if(res.code !== 0) return uni.$showMsg
				
				//对数据进行处理
				res.data.forEach(floor => {
					floor.smallKind.forEach(prod =>{
						prod.url = '/wxxcx/food/kind/goods_list/goods_list?' + prod.navigator_url.split('?')[1]
					})
				})
				this.floorList = res.data
			},
			gotoSearch(){
				uni.navigateTo({
					url:'/subpkg/search/search'
				})
			}
			
			
		}
	}
</script>

<style lang="scss">
	swiper{
		height: 330rpx;
		.swiper-item,
		image {
			width: 100%;
			height: 100%; 
		}
	}
	
	.nav-list {
		display: flex;
		justify-content: space-around;
		margin: 15px 0;
		
		.nav-img {
			width: 128rpx;
			height: 140rpx;
		}
	}
	
	.floor-title {
		width: 100%;
		height: 60rpx;
	}
	
	.right-img-box {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-around;
	}
	
	.floor-img-box {
		display: flex;
		padding-left: 10rpx;
	}
	
	.search-box {
		//为搜索框设置一个吸顶效果
		position: sticky;
		//吸顶的位置
		top: 0;
		//z-index用于设置层级，设置为999的高层级用于防止轮播图覆盖
		z-index: 999;
	}
	
	
</style>
