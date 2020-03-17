<template>
	<div>
		<div id="body">
			<headert :navlist="1" :isCompany="false"></headert>
			<div id="container">
				 <div class="clearfix">
            		<div class="content_l" v-if="position!=null">
            	        <dl class="job_detail">
		                    <dt>
		                        <h1 :title="position.post">
		                            <em></em>
		                            <div >{{position.post}}</div>
		                           	{{position.name}}
		                        </h1>
                                <div class="jd_collection" id="jobCollection">
                       		        <div class="jd_collection_success">
                       					<span>已成功收藏该职位，</span>
										<router-link class="jd_collection_page" to="">查看全部</router-link>								
										<router-link class="jd_collection_x" to=""></router-link>
									</div>
                       			</div>
                       	    </dt>
		                    <dd class="job_request">
		                    	<span class="red">{{position.salarymin}}k-{{position.salarymax}}k</span>
		                       	<span>{{position.city}}</span> 
		                       	<span>经验{{position.experience}} </span>
		                       	<span>{{position.degree}}及以上</span> 
		                       	<span>{{position.type}}</span><br>
		                      	  职位诱惑 : {{position.advantage}}
		                      	<div>发布时间：{{position.time}}</div>
		                    </dd>
		                    <dd class="job_bt">
		                        <h3 class="description">职位描述</h3>
		                        <p v-html="position.detail"></p>
		                    </dd>
		                    <dd class="resume resume_web">
						        <div style="width:400px;">
									<span>你已设置默认投递简历：<router-link title="jason的简历" target="_blank" to=""><strong>在线简历：jason的简历</strong></router-link></span><br>
									<!--<span>设置于2014-07-01 17:08</span>-->
									<span>&nbsp;</span>
						        </div>
						        <router-link title="设置默认投递简历" to="/setting/resumesetting" class="inline fl cboxElement">重新设置</router-link>
						    </dd>
						    <!--<div class="saoma saoma_btm">
		                      	<div class="dropdown_menu">
									<div class="drop_l">
										<img width="131" height="131" src="style/images/73338ca8e1694b298d223745670f8daf_318969.jpg">
										<span>[仅限本人使用]</span>
									</div>
									<div class="drop_r">
										<div class="drop_title"></div>
										<p>
											想知道HR在看简历嘛？<br>
		          							想在微信中收到面试通知？<br>
		          							<span>&lt;&lt; 扫一扫，给你解决</span>
										</p>
									</div>
								</div>
		                    </div>-->
		                    <dd>
		                        <!-- 用户是否激活 0-否；1-是 -->
				                <a title="投个简历" class="btn fr btn_apply" href="javascript:sendResume(314873,149487,false,false);">投个简历</a>
							</dd>
                		</dl>
                        <div id="weibolist"></div>
            		</div>	
            		<div class="content_r" v-if="company!=null">
		                <dl class="job_company">
		                    <dt style="height: 109px;">
		                    	<a target="_blank" href="c/19607.html">
		                            <!--<img width="84" height="84" alt="广东国馆酒业有限公司" src="../../../static/images/ff80808145ae05750145b0467a1c7ddd.png" class="b2">-->
		                            <img width="84" height="84" :alt="company.name" :src="company.img" class="b2">
		                            <img class="fr" @mouseover="approveshow=true" @mouseout="approveshow=false" width="15" height="19" alt="拉勾认证企业" src="../../../static/images/valid.png"> 
		                            <span style="position: relative;" class="fr" :style="{'display':approveshow?'inline':'none'}">认证企业</span>
		                            <div>
		                            	<h2 class="fl" style="text-align: center;">
		                                	{{company.name}}
		                                </h2>
		                            </div>
		                        </a>
		                    </dt>
		                    <dd>
		                    	<ul class="c_feature reset">
		                        	<li><span>领域</span> {{company.field}}</li>
		                        	<li><span>规模</span> {{company.scale}}</li>
		                        	<li>
		                        		<span>主页</span> 
		                        		<a rel="nofollow" title="http://www.guoguan.com" target="_blank" href="http://www.guoguan.com">http://www.guoguan.com</a>
		           					</li>
		                        </ul>
		                        <h4>发展阶段</h4>
		                        <ul class="c_feature reset">
		                        	<li><span>目前阶段</span> {{company.currentstage}}</li>
		                        </ul>
		                        <h4>工作地址</h4>
		                       	<div>{{company.address}}</div>
		                    </dd>
		                </dl>
		                <!--<div id="myRecommend_jd">
		            		<h2>可能适合你的职位 <i>匹配度</i></h2>
		            		<ul class="reset">
		            			            			<li>
		            				<a target="_blank" href="jobs/22194.html">
										<span class="f14">产品经理</span>
										<span class="c7">广州百田</span>
										<em>92%</em>
									</a>
		            			</li>
		            			            			<li>
		            				<a target="_blank" href="jobs/148004.html">
										<span class="f14">产品经理</span>
										<span class="c7">短讯神州</span>
										<em>92%</em>
									</a>
		            			</li>
		            			            			<li>
		            				<a target="_blank" href="jobs/46793.html">
										<span class="f14">产品经理</span>
										<span class="c7">爱拍</span>
										<em>89%</em>
									</a>
		            			</li>
		            			            			<li>
		            				<a target="_blank" href="jobs/99307.html">
										<span class="f14">产品经理</span>
										<span class="c7">一彩票</span>
										<em>88%</em>
									</a>
		            			</li>
		            			            			<li>
		            				<a target="_blank" href="jobs/147510.html">
										<span class="f14">产品经理</span>
										<span class="c7">林安集团</span>
										<em>88%</em>
									</a>
		            			</li>
		            		</ul>
		            		<a target="_blank" class="more" href="mList.html">更多推荐职位&gt;&gt;</a>
		            	</div>--><!--end #myRecommend-->
						<a class="eventAd" target="_blank" href="subject/s_zhouyou.html?utm_source=BD__lagou&amp;utm_medium=&amp;utm_campaign=zhouyou">
		                	<img width="280" height="135" src="../../../static/images/zhouyou.jpg">
		                </a>
		            </div>
		            <div class="clear"></div>
	    			<totop></totop>
		       	</div>
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
		name:"positiondetail",
		components:{
			headert,
			footert,
			totop
		},
		beforeCreate(){
			this.$axios.get('http://127.0.0.1:3000/position').then(res => {
//				console.log(res)
				this.position = res.data[1]
			})
			this.$axios.get('http://127.0.0.1:3000/company').then(res => {
//				console.log(res)
				this.company = res.data[0]
			})
		},
		data(){
			return{
				position:null,
				company:null,
				approveshow:false
			}
		}
	}
</script>

<style>
</style>