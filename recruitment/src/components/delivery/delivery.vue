<template>
	<div>
		<div id="body">
			<headert :navlist="0" :isCompany="false"></headert>
			<div id="container">
				<div class="clearfix" style="min-height: 500px;">
		            <div class="content_l">
		            	<dl class="c_delivery">
		                    <dt>
		                        <h1><em></em>已投递简历状态</h1>
		                        <a class="d_refresh" @click.prevent="refresh" href="javascript:;">刷新</a>
		                    </dt>
		                    <dd>
		                    	<div class="delivery_tabs">
		                    		<ul class="reset">
		                    			<li :class="[currentroute === 'all'?'current':'']">
		                    				<router-link to="/delivery/all">全部</router-link>
		                    			</li>
		                    			<li :class="[currentroute === 'interview'?'current':'']">
		                    				<router-link to="/delivery/interview">邀请面试</router-link>
		                    			</li>
		                    			<li :class="[currentroute === 'improper'?'current':'']">
		                    				<router-link style="border-right: none;" to="/delivery/improper">不合适</router-link>
		                    			</li>
		                    		</ul>
		                    	</div>
		                    	<router-view/>
		                    </dd>
		                </dl>
		            </div>	
		            <div class="content_r">
		            	<div class="mycenterR" id="myInfo">
		            		<h2>我的信息</h2>
		            		<router-link to="">我收藏的职位</router-link>
		            		<br>
		            		<router-link to="" target="_blank">我订阅的职位<span id="noticeNoPage" class="red dn">&nbsp;(0)</span></router-link>
		            		<br>
		            		<router-link target="_blank" to="">我投递的职位</router-link>
		            		<br>
		            		<router-link to="">我的简历</router-link>
		            	</div><!--end #myInfo-->
		            	
		            </div>
       			</div>
       			<div class="clear"></div>
       			<totop></totop>
			</div>
		</div>
		<footert></footert>
	</div>
</template>

<script>
	import headert from '../header/header'
	import footert from '../footer/footer'
	import totop from '../totop/totop'
	export default{
		name:"delivery",
		data(){
			return{
				
			}
		},
		methods:{
			refresh(){
				this.$router.go(0)
			}
		},
		components:{
			footert,
			headert,
			totop
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