<template>
	<div>
		<router-link :title="company.name" target="_blank" to="">
		    <img :alt="company.name" :src="company.img">
		</router-link>
		<div class="co_item">
		    <h2 :title="position.name">
			    <router-link target="_blank" to="">
			        <em>{{position.name}}</em> 
			        <!--<span>（4k以上）</span>-->
			    </router-link>
			</h2>
			<span class="co_time">发布时间：{{time}}</span>
			<div class="co_cate">{{company.name}} / {{position.city}} / {{position.experience}} / {{position.degree}}</div>
			<span class="co_youhuo c7">{{position.advantage}}</span>
		    <router-link class="collection_link" target="_blank" to="">投个简历</router-link>
		    <i></i>
		    <a class="collectionCancel collection_link collected" href="javascript:;">
		    	取消收藏
		        <span>已取消收藏</span>
		    </a>
		</div>
	</div>
</template>

<script>
	export default{
		name:"positionbox",
		props:{
			position:{
				type:Object
			},
			company:{
				type:Object
			},
			time:{}
		}
	}
</script>

<style>
</style>