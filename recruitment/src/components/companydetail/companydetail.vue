<template>
	<div>
		<div id="body">
			<headert :navlist="1" :isCompany="false"></headert>
			<div id="container">
				<div class="clearfix">
					<div class="content_l">
						<div class="c_detail">
							<div style="background-color: #fff;" class="c_logo">
								<a :title="company.comdetail.shortname" id="logoShow" class="inline cboxElement" >
									<img width="190" height="190" :alt="company.comdetail.shortname" :src="company.comdetail.img"/>
									<!--<span>更换公司图片<br />190px*190px 小于5M</span>-->
									<!--<input type="file" @change="getcomimg"/>-->
								</a>
							</div>
							<div class="c_box companyName">
								<h2 :title="company.comdetail.shortname">{{company.comdetail.shortname}}</h2>
								<em :class="[isvalided?'valid':'unvalid']" class="fr" @mouseover="vashow=true" @mouseout="vashow=false"></em>
								<span class="va" :style="{'display':vashow&&!isvalided?'inline':'none'}">未认证企业</span>
								<span class="va" :style="{'display':vashow&&isvalided?'inline':'none'}">认证企业</span>
								<div class="clear"></div>
								<h1 :title="company.comdetail.fullname" class="fullname">{{company.comdetail.fullname}}</h1>
								<!--<form class="clear editDetail" :class="[editdetailshow?'':'dn']" id="editDetailForm">
									<input type="text" ref="editshortname" placeholder="请输入公司简称" maxlength="15" :value="comdetail.shortname" name="companyShortName" id="companyShortName"/>
									<input type="text" ref="editfeature" placeholder="一句话描述公司优势，核心键值，限50字" maxlength="50" :value="comdetail.feature" name="companyFeatures" id="companyFeatures"/>
									<input type="hidden" value="25927" id="companyId" name="companyId"/>
									<input type="button" value="保存" id="saveDetail" class="btn_small" @click="savedetail"/>
									<a id="cancelDetail" class="btn_cancel_s" @click.prevent="canceldetail">取消</a>
								</form>-->
								<div class="clear oneword">
									<img width="17" height="15" src="../../../static/images/quote_l.png"/>
									&nbsp;
									<span>{{company.comdetail.feature}}</span>
									&nbsp;
									<img width="17" height="15" src="../../../static/images/quote_r.png"/>
								</div>
								<ul style="overflow: auto;" id="hasLabels" class="reset clearfix">
									<li v-for="(item,index) in company.comdetail.labels" :key="index" style="margin-right:18px;">
										<span>{{item}}</span>
									</li>
								</ul>
							</div>
							<div class="clear"></div>
						</div>
						<div class="c_breakline"></div>
						<div id="Product">
							<div v-for="(item,index) in company.products" :key="index" class="product_wrap">
								<dl class="c_product">
						            <dt>
						                <h2><em></em>公司产品</h2>
						            </dt>
						            <dd style="width: 680px;">
										<!--<div v-for="(item,index) in company.products" :key="index">-->
											<productbox :product="item"></productbox>
										<!--</div>-->
									</dd>
						        </dl>
							</div>
						</div>
						
						<div id="Profile">
							<div class="profile_wrap">
						            
						        <!--有介绍-->
						        <dl class="c_section">
						            <dt>
						                <h2><em></em>公司介绍</h2>
						            </dt>
						            <dd>
						                <div class="c_intro">{{company.intro}}</div>
						            </dd>
						        </dl>
					        </div>
						</div>
		
						<!--无招聘职位-->
						<dl id="noJobs" class="c_section">
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
						</dl>
						
						<div id="flag"></div>
					</div>
					<div class="content_r">
						<div id="Tags">
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
						</div>
						
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
		                    		<li>目前阶段：<span class="c5">{{company.stage.currentstage}}</span></li>
		                    		<li>投资机构：<span class="c5">{{company.stage.org}}</span></li>
		                    	</ul>
		                    	<!--<form class="dn" id="stageform" :style="{'display':editstageshow?'block':'none'}">
		                    		<div class="stageSelect" @mouseleave="currentstagelistshow = false">
		                    			<label>目前阶段</label>
		                    			<input type="hidden" :value="comstage.currentstage" id="financeStage" name="financeStage">
			                         	<input type="button" :value="comstage.currentstage" id="select_fin" class="select_tags_short fl" @click="currentstagelistshow = true">
			                            <div class="selectBoxShort dn" id="box_fin" :style="{'display':currentstagelistshow?'block':'none'}">
			                                 <ul class="reset">
			                                 	<li v-for="(item,index) in stagelist" :class="index==stagecurrent?'current':''" :key="index" @click="choosestage(index)">
			                                 		{{item}}
			                                 	</li>
						                    </ul>
			                            </div>	
		                    		</div>	
			                    	<ul id="stagesList" class="reset">
				                    	<li>
						                    <label>投资机构</label>
						                    <input type="text" ref="org" placeholder="如真格基金" name="stageorg" :value="comstage.org">
				                    	</li>
				                    </ul>
				                    <input type="button" value="保存" @click="savestage" class="btn_small">
				                    <a id="cancelStages" class="btn_cancel_s" @click.prevent="editstageshow = false" href="javascript:void(0)">取消</a>
				                    <div class="clear"></div>
				                </form>-->
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
										<!--无创始人-->
										<!--<div class="member_info addnew_right" v-if="!hasmember">
											展示公司领导团体，<br>提升诱人指数<br>
											<a class="member_edit" @click.prevent="addcommember">+添加成员</a>
										</div>-->
										
										<!--添加创始人-->
										<!--<div class="member_info newMember" v-show="addmembershow">
											<form class="memberForm">
												<div class="new_portrait">
							                            <div class="portrait_upload dn portraitNo">
							                                <span>上传创始人头像</span>
							                            </div>
							                            <div class="portraitShow">
							                            	<img width="120" height="120" :src="newmemberimg">
								                        	<span>更换头像</span>
								                        </div>
								                        <input type="file" @change="getnewmemberimg" title="支持jpg、jpeg、gif、png格式，文件小于5M" name="myfiles" id="profiles0">
								                    	<input type="hidden" value="7" name="type" class="type">
								                    	<input type="hidden" value="images/leader_default.png" name="photo" class="leaderInfos">
							                            <em>
													                                尺寸：120*120px <br> 	
													                                大小：小于5M
							                            </em>
							                    </div>
							                    <input type="text" placeholder="请输入创始人姓名" value="" ref="newmembername" name="name">	
						                        <input type="text" placeholder="请输入创始人当前职位" value="" ref="newmemberpost" name="position">	
						                        <textarea placeholder="请输入创始人个人简介" maxlength="500" class="s_textarea" name="remark" value="" ref="newmemberintro"></textarea>	
						                        <div class="word_count fr">简介不超过 <span>500</span> 字</div>
						                        <div class="clear"></div>
						                        <input type="button" value="保存" class="btn_small" @click="savenewmember">
					                            <a class="btn_cancel_s member_delete" @click.prevent="canceladdnewmember">取消</a>
											</form>
										</div>-->
										
										<!--编辑创始人-->
										<!--<div class="member_info newMember" v-show="editmembershow">
											<form class="memberForm">
												<div class="new_portrait">
							                            <div class="portrait_upload dn portraitNo">
							                                <span>上传创始人头像</span>
							                            </div>
							                            <div class="portraitShow">
							                            	<img width="120" height="120" :src="commember.img">
								                        	<span>更换头像</span>
								                        </div>
								                        <input type="file" @change="getmemberimg" title="支持jpg、jpeg、gif、png格式，文件小于5M" name="myfiles" id="profiles0">
								                    	<input type="hidden" value="7" name="type" class="type">
								                    	<input type="hidden" value="images/leader_default.png" name="photo" class="leaderInfos">
							                            <em>
													                                尺寸：120*120px <br> 	
													                                大小：小于5M
							                            </em>
							                    </div>
							                    <input type="text" placeholder="请输入创始人姓名" v-model="commember.name" name="name">	
						                        <input type="text" placeholder="请输入创始人当前职位" v-model="commember.post" name="position">	
						                        <textarea placeholder="请输入创始人个人简介" maxlength="500" class="s_textarea" name="remark" v-model="commember.intro">{{commember.intro}}</textarea>	
						                        <div class="word_count fr">简介不超过 <span>500</span> 字</div>
						                        <div class="clear"></div>
						                        <input type="button" value="保存" class="btn_small" @click="editmembershow = false">
					                            <a class="btn_cancel_s member_delete" @click.prevent="deletemember">删除</a>
					                        	<input type="hidden" value="11493" class="leader_id">
											</form>
										</div>-->
										
										<!--显示创始人-->
										<div class="member_info">
					                        <div class="m_portrait">
					                            <div></div>
					                            <img width="120" height="120" :alt="company.member.name" :src="company.member.img">
						                    </div>
					                        <div class="m_name">
					                        	{{company.member.name}}
					                        </div>
					                        <div class="m_position">{{company.member.post}}</div>
					                    	<div class="m_intro">{{company.member.intro}}</div>
										</div>
									</div>
								</dd>
							</dl>
						</div>
						
						<div id="Reported">
							<dl class="c_section c_reported">
				            	<dt>
				                	<h2>
				                		<em></em>
				                		公司新闻报道
				                	</h2>
		                   			<!--<a v-show="comrepolist.length!=0&&!addreposhow" title="添加报道" class="c_add" @click.prevent="addreposhow = true"></a>-->
				                </dt>
			                	<dd>
				                	<!-- 编辑报道 -->
		                       		<ul class="reset">
		                       			<li v-for="(item,index) in company.repolist" :key="index">
		                       				<a class="article" :title="item.repotitle" target="_blank" :href="item.repolink">{{item.repotitle}}</a>
				                			<!--<a title="编辑报道" class="c_edit dn" @click.prevent="editrepo(index)" :style="{'display':editreposhow?'none':'inline'}"></a>-->
				                			<!--<form class="reportForm" v-show="index==repocurrent&&editreposhow">
				                				<input type="text" placeholder="请输入文章标题" v-model="item.repotitle" name="articleTitle" class="valid">
				                				<input type="text" placeholder="请输入文章链接" v-model="item.repolink" name="articleUrl" class="valid"><span for="articleUrl" generated="true" class="error" style="display: none;">请输入有效的文章链接</span>
				                				<input type="button" value="保存" class="btn_small" @click="editreposhow=false">
					                            <a class="btn_cancel_s report_delete" @click.prevent="deleterepo(index)">删除</a>
					                     	</form>-->
		                       			</li>
		                       		</ul>
			                	
				                	<!-- 无报道 -->
			                        <!--<div class="addnew_right reported_info" v-show="comrepolist.length==0&&!addreposhow">
			                        	展示外界对公司的深度报道，<br>便于求职者了解公司！<br>
			                            <a class="report_edit" @click.prevent="addreposhow = true">+添加报道</a>
			                        </div>-->
		                        
		                        	<!--添加新的报道-->
				                	<!--<ul class="newReport" v-show="addreposhow">
			                        	<li>
				                			<form class="reportForm">
				                				<input type="text" placeholder="请输入文章标题" ref="newtitle" value="" name="articleTitle">
				                				<input type="text" placeholder="请输入文章链接" ref="newlink" value="" name="articleUrl">
				                				<input type="button" value="保存" class="btn_small" @click="savenewrepo">
					                            <a class="btn_cancel_s report_cancel" @click.prevent="canceladdnewrepo">取消</a>
					                            <input type="hidden" value="" class="article_id">
					                     	</form>
				                		</li>
			                        </ul>-->
					        	</dd>
			            	</dl><!-- end .c_reported -->
						</div>
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
	import productbox from './productbox/productbox'
	export default{
		name:"companydetail",
		created(){
			this.$axios.get("http://127.0.0.1:3000/company")
			.then((res) => {
				this.company = res.data[1]
				console.log(this.company)
			})
			.catch((err) => {
				console.log(err)
			})
		},
		components:{
			headert,
			footert ,
			totop,
			productbox
		},
		data(){
			return{
				vashow:false,
				company:null,
			}
		},
		computed:{
			isvalided(){
				return false
			}
		}
	}
</script>

<style>
</style>