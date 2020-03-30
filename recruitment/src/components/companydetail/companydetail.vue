<template>
	<div>
		<div id="body">
			<headert :navlist="1" :isCompany="false"></headert>
			<div id="container">
				<div id="comdetail" v-if="company">
					<div class="c_detail" style="margin:5px 0;">
							<div style="background-color: #fff;" class="c_logo">
								<a :title="company.companyDetail.shortname" id="logoShow" class="inline cboxElement" >
									<img v-if="company.companyDetail.img" width="190" height="190" :alt="company.companyDetail.shortname" :src="company.companyDetail.img"/>
									<img v-if="!company.companyDetail.img" width="190" height="190" :alt="company.companyDetail.shortname" src="../../../static/images/logo_default.png"/>
								</a>
							</div>
							<div class="c_box companyName">
								<h2 style="max-width: 350px;" :title="company.companyDetail.shortname">{{company.companyDetail.shortname}}</h2>
								<em :class="[isvalided?'valid':'unvalid']" class="fr" @mouseover="vashow=true" @mouseout="vashow=false"></em>
								<span style="margin:-24px 0 0 420px" class="va" :style="{'display':vashow&&!isvalided?'inline':'none'}">未认证企业</span>
								<span style="margin:-24px 0 0 420px" class="va" :style="{'display':vashow&&isvalided?'inline':'none'}">认证企业</span>
								<div class="clear"></div>
								<h1 style="max-width: 350px;" :title="company.companyDetail.fullname" class="fullname">{{company.companyDetail.fullname}}</h1>
								<div style="max-width: 350px;" class="clear oneword">
									<img width="17" height="15" src="../../../static/images/quote_l.png"/>
									&nbsp;
									<span>{{company.companyDetail.feature}}</span>
									&nbsp;
									<img width="17" height="15" src="../../../static/images/quote_r.png"/>
								</div>
								<ul style="max-width: 350px;overflow: auto;" id="hasLabels" class="reset clearfix">
									<li v-for="(item,index) in company.companyDetail.labelList" :key="index" style="margin-right:18px;">
										<span>{{item.label}}</span>
									</li>
								</ul>
								<div class="c_tags_s">
									<div id="c_tags_show" class="c_tags solveWrap">
										<table>
											<tbody>
												<tr>
													<td width="62">地点</td>
													<td>{{company.companyDetail.city}}</td>
												</tr>
												<tr>
													<td>领域</td>
													<td :title="company.companyDetail.field">{{company.companyDetail.field}}</td>
												</tr>
												<tr>
													<td>规模</td>
													<td>{{company.companyDetail.scale}}</td>
												</tr>
												<tr>
													<td>主页</td>
													<td>
														<a :href="company.companyDetail.comurl" target="_blank">前往公司主页</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="clear"></div>
					</div>
				</div>
				<div class="company_nav">
					<ul style="list-style: none;">
						<li><router-link :class="[currentroutername==='company_home'?'current':'']" :to="{name:'company_home',query:{companyId:company.companyId}}">公司主页</router-link></li>
						<li><router-link :class="[currentroutername==='company_product'?'current':'']" :to="{name:'company_product',query:{companyId:company.companyId}}">公司产品</router-link></li>
						<li class="last"><router-link :class="[currentroutername==='company_position'?'current':'']" :to="{name:'company_position',query:{companyId:company.companyId}}">招聘职位</router-link></li>
					</ul>
				</div>
				<div class="c_breakline"></div>
				<div class="clearfix" v-if="company">
					<div class="content_l">
						<router-view/>
						<!--<div id="Product">
							<div v-for="(item,index) in company.products" :key="index" class="product_wrap">
								<dl class="c_product">
						            <dt>
						                <h2><em></em>公司产品</h2>
						            </dt>
						            <dd style="width: 680px;">
											<productbox :product="item"></productbox>
									</dd>
						        </dl>
							</div>
						</div>-->
						
						<!--<div id="Profile">
							<div class="profile_wrap">
						            
						        <dl class="c_section">
						            <dt>
						                <h2><em></em>公司介绍</h2>
						            </dt>
						            <dd>
						                <div class="c_intro">{{company.intro}}</div>
						            </dd>
						        </dl>
					        </div>
						</div>-->
		
						<!--无招聘职位-->
						<!--<dl id="noJobs" class="c_section">
							<dt>
								<h2>
									<em></em>
									招聘职位
								</h2>
							</dt>
							<dd style="height: 200px;">
								<div class="addnew">
									发布需要的人才信息，让伯乐和千里马尽快相遇......<br />
									<router-link to="/management/postposition">+发布招聘职位</router-link>
								</div>
							</dd>
						</dl>-->
						
						<div id="flag"></div>
					</div>
					<div class="content_r">
						<!--<div id="Tags">
							<div id="c_tags_show" class="c_tags solveWrap">
								<table>
									<tbody>
										<tr>
											<td width="62">地点</td>
											<td>{{company.comdetail.city}}</td>
										</tr>
										<tr>
											<td>领域</td>
											<td :title="company.comdetail.field">{{company.comdetail.field}}</td>
										</tr>
										<tr>
											<td>规模</td>
											<td>{{company.comdetail.scale}}</td>
										</tr>
										<tr>
											<td>主页</td>
											<td>
												<a :href="company.comdetail.comurl" target="_blank">前往公司主页</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>-->
						
						<dl class="c_section c_stages">
							<dt>
								<h2>
									<em></em>
									融资阶段
								</h2>
								<!--<a title="编辑融资阶段" class="c_edit" :style="{'display':editstageshow?'none':'block'}" @click.prevent="editstage"></a>-->
							</dt>
							<dd>
								<ul class="reset stageshow">
		                    		<li>目前阶段：<span class="c5">{{company.companyStage.currentstage}}</span></li>
		                    		<li>投资机构：<span class="c5">{{company.companyStage.org}}</span></li>
		                    </ul>
							</dd>
						</dl>
						
						<div id="Member">
							<dl class="c_section c_member">
								<dt>
									<h2>
										<em></em>
										领导团队
									</h2>
								</dt>
								<dd>
									<div class="member_wrap">
										
										<div class="member_info">
					                        <div class="m_portrait">
					                            <div></div>
					                            <img v-if="company.companyMember.img" width="120" height="120" :alt="company.companyMember.name" :src="company.companyMember.img">
					                            <img v-else width="120" height="120" :alt="company.companyMember.name" src="../../../static/images/default_headpic.png"/>
						                    </div>
					                        <div class="m_name">
					                        	{{company.companyMember.name}}
					                        </div>
					                        <div class="m_position">{{company.companyMember.post}}</div>
					                    	<div class="m_intro">{{company.companyMember.intro}}</div>
										</div>
									</div>
								</dd>
							</dl>
						</div>
						
						<!--<div id="Reported">
							<dl class="c_section c_reported">
				            	<dt>
				                	<h2>
				                		<em></em>
				                		公司新闻报道
				                	</h2>
				                </dt>
			                	<dd>
		                       		<ul class="reset" style="color: #555;">
		                       			<li v-for="(item,index) in company.repolist" :key="index">
		                       				<a class="article" :title="item.repotitle" target="_blank" :href="item.repolink">{{item.repotitle}}</a>
				                		</li>
		                       		</ul>
			                	</dd>
			            	</dl>
						</div>-->
					</div>
				</div>
				
				<div class="clear"></div>
				<totop></totop>
			</div>
		</div>
		<footer></footer>
	</div>
</template>

<script>
	import headert from '../header/header'
	import footert from '../footer/footer'
	import totop from '../totop/totop'
	export default{
		name:"companydetail",
		created(){
			this.companyId = this.$route.query.companyId
//			console.log(this.companyId)
			this.$axios({
				method:'post',
				url:'/api/company/get',
				params:{
					companyId:this.companyId
				}
			}).then(res => {
				this.company = res.data.object
				console.log(res)
			}).catch(err => {
				console.log(err)
			})
		},
		components:{
			headert,
			footert ,
			totop,
		},
		data(){
			return{
				companyId:null,
				vashow:false,
				company:null,
			}
		},
		computed:{
			isvalided(){
				return false
			},
			currentroutername(){
				return this.$route.name
			}
		},
		methods:{
			
		}
	}
</script>

<style>
	.c_tags_s{
		/*margin-right: 40px;*/
		top: 0;
		right: 15%;
		min-width: 100px;
		width: 280px;
		min-height: 100px;
		height: 100%;
		/*background-color: #019875;*/
		position: absolute;
	}
	#comdetail{
		margin:5px 0;
		height: 200px;
		width: 100%;
	}
	.company_nav{
		margin: 5px 0;
		background-color: #fafafa;
		height: 54px;
		width: 100%;
	}
	.company_nav ul{
		padding-top: 15px;
	}
	.company_nav li{
		display: inline-block;
		width: 33%;
		text-align: center;
		border-right: solid 2px #019875;
	}
	.company_nav li a{
		width: 70px;
		margin: 0 30px;
		padding: 10px 0;
	}
	.company_nav li a.current{
		color:#333;
		border-bottom:3px solid #019875;
	}
	.company_nav li a{
		line-height: 30px;
		text-align: center;
		color: #999;
		/*font: "微软雅黑" 18px;*/
		font-weight: 900;
	}
	.company_nav li a:hover{
		color: #555;
	}
	.company_nav .last{
		border-right: none;
	}
</style>