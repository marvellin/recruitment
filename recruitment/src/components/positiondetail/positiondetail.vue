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
		                      	<div>发布时间：{{position.releaseTime}}</div>
		                    </dd>
		                    <dd class="job_bt">
		                        <h3 class="description">职位描述</h3>
		                        <p v-html="position.detail"></p>
		                    </dd>
		                    <!--<dd class="resume resume_web">
						        <div style="width:400px;">
									<span>你已设置默认投递简历：<router-link title="jason的简历" target="_blank" to=""><strong>在线简历：jason的简历</strong></router-link></span><br>
									<span>&nbsp;</span>
						        </div>
						        <router-link title="设置默认投递简历" to="/setting/resumesetting" class="inline fl cboxElement">重新设置</router-link>
						    </dd>-->
		                    <dd>
		                        <!-- 用户是否激活 0-否；1-是 -->
				                <a title="投个简历" class="btn fr btn_apply" @click.prevent="delivery">投个简历</a>
							</dd>
                		</dl>
                        <div id="weibolist"></div>
            		</div>	
            		<div class="content_r" v-if="company!=null">
		                <dl class="job_company">
		                    <dt style="height: 109px;">
		                    	<a target="_blank" href="c/19607.html">
		                            <!--<img width="84" height="84" alt="广东国馆酒业有限公司" src="../../../static/images/ff80808145ae05750145b0467a1c7ddd.png" class="b2">-->
		                            <img v-if="company.companyDetail.companyImg&&company.companyDetail.companyImg.img" width="84" height="84" :alt="company.companyDetail.shortname" :src="company.companyDetail.companyImg.img" class="b2">
		                            <img v-else width="84" height="84" alt="公司LOGO" src="../../../static/images/logo_default.png" class="b2">
		                            <img class="fr" @mouseover="approveshow=true" @mouseout="approveshow=false" width="15" height="19" alt="拉勾认证企业" src="../../../static/images/valid.png"> 
		                            <span style="position: relative;" class="fr" :style="{'display':approveshow?'inline':'none'}">认证企业</span>
		                            <div>
		                            	<h2 class="fl" style="text-align: center;" @click.prevent="toCompany(company.companyId)">
		                                	{{company.companyDetail.shortname}}
		                                </h2>
		                            </div>
		                        </a>
		                    </dt>
		                    <dd>
		                    	<ul class="c_feature reset">
		                        	<li><span>领域</span> {{company.companyDetail.field}}</li>
		                        	<li><span>规模</span> {{company.companyDetail.scale}}</li>
		                        	<li>
		                        		<span>主页</span> 
		                        		<a rel="nofollow" :title="company.companyDetail.comurl" target="_blank" :href="company.companyDetail.comurl">{{company.companyDetail.comurl}}</a>
		                        		<!--<a rel="nofollow" title="http://www.guoguan.com" target="_blank" href="http://www.guoguan.com">http://www.guoguan.com</a>-->
		           					</li>
		                        </ul>
		                        <h4>发展阶段</h4>
		                        <ul class="c_feature reset">
		                        	<li><span>目前阶段</span> {{company.companyStage.currentstage}}</li>
		                        </ul>
		                        <h4>工作地址</h4>
		                       	<div>{{position.address}}</div>
		                    </dd>
		                </dl>
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
		methods:{
			toCompany(companyId){
				this.$router.push({
					path:'/companydetail',
					query:{
						companyId:companyId
					}
				})
			},
			delivery(){
				var myPersonId = this.$store.state.person.personId()
				if(eval(this.$store.state.isCompany())){
					this.$message({
						type:'warn',
						message:'您无法投递简历！'
					})
				}
				else if(!eval(this.$store.state.isCompany()) && myPersonId){
					this.$axios({
						method:'get',
						url:'/api/delivery/insert',
						params:{
							positionId:this.position.positionId,
							personId:myPersonId
						}
					}).then(res => {
						console.log(res)
						if(res.data.code == 500){
							this.$message({
								type:'warn',
								message:res.data.msg
							})
						}
						else if(res.data.code == 200){
							this.$message({
								type:'info',
								message:'您已成功投递该职位！'
							})
						}
					}).catch(err => {
						console.log(err)
					})
				}
			},
			async getPosition(){
				await this.$axios({
					method:'get',
					url:'/api/position/get',
					params:{
						positionId:this.positionId
					}
				}).then(res=>{
					console.log(res)
					this.position = res.data.object
					this.getCompany()
				}).catch(err=>{
					console.log(err)
				})
			},
			getCompany(){
				this.$axios({
					method:'get',
					url:'/api/company/get',
					params:{
						companyId:this.position.companyId
					}
				}).then(res=>{
					console.log(res)
					this.company = res.data.object
				}).catch(err=>{
					console.log(err)
				})
			}
		},
		created(){
			if(this.$route.query.positionId!=undefined&&this.$route.query.positionId!=null){
				this.positionId = this.$route.query.positionId
			}
			this.getPosition()
		},
		data(){
			return{
				positionId:null,
				position:null,
				company:null,
				approveshow:false
			}
		}
	}
</script>

<style>
</style>