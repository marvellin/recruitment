<template>
	<div>
		<div id="body">
			<headert :isCompany="false" :navlist="1"></headert>
			<div id="container">
				<div class="clearfix">
		            <div class="content_l" style="min-height: 835px;">
		            	<dl class="c_collections">
		                    <dt>
		                        <h1><em></em>我收藏的职位</h1>
		                    </dt>
		                    <dd>
		                    	<form id="collectionsForm">
		                            <ul class="reset my_collections">
		                            	<li v-for="(item,index) in position2companylist" :key="index">
		                            		<positionbox :position="item.position" :time="item.time" :company="item.company"></positionbox>
		                            	</li>
		                               	
		                            </ul>
		                        </form>
		                    </dd>
		                </dl>
		            </div>	
		            <div class="content_r">
		            	<div class="mycenterR" style="margin-top: 0;" id="myInfo">
		            		<h2>我的信息</h2>
		            		<!--<a href="collections.html">我收藏的职位</a>-->
		            		<router-link to="/collection">我收藏的职位</router-link>
		            		<br>
		            		<!--<a target="_blank" href="subscribe.html">我订阅的职位</a>-->
		            		<router-link to="">我订阅的职位</router-link>
		            	</div><!--end #myInfo-->
		            	<!--<div class="greybg qrcode mt20">
		                	<img width="242" height="242" alt="拉勾微信公众号二维码" src="../../../static/images/qr_delivery.png">
		                    <span class="c7">扫描拉勾二维码，微信轻松搜工作</span>
		                </div>-->
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
	import positionbox from './positionbox/positionbox'
	export default{
		name:"collection",
		components:{
			headert,
			footert,
			totop,
			positionbox
		},
		data(){
			return{
				position2companylist:null
			}
		},
		created(){
			this.$axios.get('/static/data/position2company.json').then(res => {
				this.position2companylist = res.data.position2companylist
				console.log(this.position2companylist)
			})
		}
	}
</script>

<style>
</style>