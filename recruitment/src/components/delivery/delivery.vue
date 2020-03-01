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
		                    				<router-link to="">全部</router-link>
		                    			</li>
		                    			<!--<li>
		                    				<a href="delivery.html?tag=5">投递成功</a>
		                    			</li>
		                    			<li>
		                    				<a href="delivery.html?tag=1">被查看</a>
		                    			</li>
		                    			<li>
		                    				<a href="delivery.html?tag=2">通过初筛</a>
		                    			</li>-->
		                    			<li :class="[currentroute === 'interview'?'current':'']">
		                    				<router-link to="">通知面试</router-link>
		                    			</li>
		                    			<li :class="[currentroute === 'improper'?'current':'']">
		                    				<router-link style="border-right: none;" to="">不合适</router-link>
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
		            		<!--<a target="_blank" href="mList.html">我的职位推荐</a>-->
		            	</div><!--end #myInfo-->
		            	<!--<div class="mycenterR" id="myRecommend">
		            		<h2>可能适合你的职位 <i>匹配度</i></h2>
		            		<ul class="reset">
		            			<li>
		            				<a target="_blank" href="http://www.lagou.com/jobs/22194.html">
										<span class="f16">产品经理</span>
										<span class="c7">广州百田</span>
										<em>92%</em>
									</a>
		            			</li>
		            			<li>
		            				<a target="_blank" href="http://www.lagou.com/jobs/148004.html">
										<span class="f16">产品经理</span>
										<span class="c7">短讯神州</span>
										<em>92%</em>
									</a>
		            			</li>
		            			<li>
		            				<a target="_blank" href="http://www.lagou.com/jobs/46793.html">
										<span class="f16">产品经理</span>
										<span class="c7">爱拍</span>
										<em>89%</em>
									</a>
		            			</li>
		            			<li>
		            				<a target="_blank" href="http://www.lagou.com/jobs/99307.html">
										<span class="f16">产品经理</span>
										<span class="c7">一彩票</span>
										<em>88%</em>
									</a>
		            			</li>
		            			<li>
		            				<a target="_blank" href="http://www.lagou.com/jobs/147510.html">
										<span class="f16">产品经理</span>
										<span class="c7">林安集团</span>
										<em>88%</em>
									</a>
		            			</li>
		            		</ul>
		            		<a target="_blank" class="more" href="mList.html">更多推荐职位&gt;&gt;</a>
		            	</div>--><!--end #myRecommend-->
						<!--<div class="greybg qrcode mt20">
		                	<img width="242" height="242" alt="拉勾微信公众号二维码" src="style/images/qr_delivery.png">
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
	export default{
		name:"delivery",
		data(){
			return{
				
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