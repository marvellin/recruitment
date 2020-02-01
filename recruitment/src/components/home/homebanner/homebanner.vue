<template>
	<div id="home_banner">
		<el-carousel :interval="4000" type="card" height="160px">
			<el-carousel-item v-for="(item,index) in superurl" :key="index">
				<router-link :to='{path:item.path}'>
					<img :src="item.img" width="372px" height="160"/>
				</router-link>
			</el-carousel-item>
		</el-carousel>
	</div>
</template>

<script>
	export default{
		name:'homebanner',
		data(){
			return{
				superurl:[
					{
						path:'/lightbox',
						alt:'好买基金——来了就给100万',
						img:'../../../static/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg'
					},
					{
						path:'',
						alt:'世界杯放假看球，老板我也要！',
						img:'../../../static/images/c9d8a0756d1442caa328adcf28a38857.jpg'
					},
					{
						path:'',
						alt:'出北京记——第一站厦门',
						img:'../../../static/images/d03110162390422bb97cebc7fd2ab586.jpg'
					}
				]
			}
		}
	}
</script>

<style scoped>
	.el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }
  
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>