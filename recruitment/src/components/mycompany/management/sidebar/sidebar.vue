<template>
	<div class="sidebar">
	            	<!--<a class="btn_create" href="create.html">发布新职位</a>-->
	            	<router-link class="btn_create" to="postposition">发布新职位</router-link>
	                <dl class="company_center_aside">
						<dt>我收到的简历</dt>
						<dd :class="[currentroute=='pendingresume'?'current':'']">
							<!--<a href="">待处理简历</a>--> 
							<router-link to="pendingresume">待处理简历</router-link>
						</dd>
						<dd :class="[currentroute=='notifiedresume'?'current':'']">
							<!--<a href="">已通知面试简历</a>-->
							<router-link to="notifiedresume">已通知面试简历</router-link>
						</dd>
						<dd :class="[currentroute=='undeterminedresume'?'current':'']">
							<!--<a href="">已通知面试简历</a>-->
							<router-link to="undeterminedresume">待定简历</router-link>
						</dd>
						<dd :class="[currentroute=='unsuitableresume'?'current':'']">
							<!--<a href="">不合适简历</a>-->
							<router-link to="unsuitableresume">不合适简历</router-link>
						</dd>
						<!--<dd class="btm">
							<a href="">自动过滤简历</a> 
							<router-link to="">自动过滤简历</router-link>
						</dd>-->
					</dl>
					<dl class="company_center_aside">
						<dt>我发布的职位</dt>
						<dd :class="[currentroute=='validposition'?'current':'']">
							<!--<a href="">有效职位</a>-->
							<router-link to="validposition">有效职位</router-link>
						</dd>
						<dd :class="[currentroute=='expiredposition'?'current':'']">
							<!--<a href="">已下线职位</a>-->
							<router-link to="expiredposition">已下线职位</router-link>
						</dd>
					</dl>
					<slot name='slot1'></slot>
					<slot name='slot2'></slot>
    </div>
</template>

<script>
	export default{
		name:'sidebar',
		created(){
//			console.log(this.$route)
		},
		computed:{
			currentroute(){
				return this.$route.name
			}
		}
	}
</script>

<style>
</style>