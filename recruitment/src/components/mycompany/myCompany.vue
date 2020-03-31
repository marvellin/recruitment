<template>
	<div>
	<div id="body">
		<headert :navlist='2' :isCompany='true'></headert>
		<div id="container">
			<div class="clearfix" v-if="company">
				<div class="content_l">
					<div class="c_detail" :class="[editlabel?'c_detail_bg':'']">
						<div style="background-color: #fff;" class="c_logo">
							<a title="上传公司LOGO" id="logoShow" class="inline cboxElement" >
								<img v-if="company.companyDetail.img" width="190" height="190" alt="公司logo" :src="company.companyDetail.img"/>
								<img v-else width="190" height="190" alt="公司logo" src="../../../static/images/logo_default.png"/>
								<span>更换公司图片<br />190px*190px 小于5M</span>
								<input type="file" accept="image/jpeg,image/png,image/jp2,image/gif" @change="setcompanyImg"/>
							</a>
						</div>
						
						<div class="c_box companyName">
							<h2 title="公司名称测试">{{company.companyDetail.shortname}}</h2>
							<em class="unvalid" @mouseover="vaon" @mouseout="vaout"></em>
							<span class="va dn" :style="{'display':vashow?'inline':'none'}">未认证企业</span>
							<router-link target="_blank" class="applyC" to="auth">申请认证</router-link>
							<div class="clear"></div>
							<h1 title="广东公司名称测试" class="fullname">{{company.companyDetail.fullname}}</h1>
							<form v-if="detailtmp" class="clear editDetail" :class="[editdetailshow?'':'dn']" id="editDetailForm">
								<input v-validate="'required|companyshortname|max:10'" data-vv-scope="scope1" type="text" ref="editshortname" placeholder="请输入公司简称" maxlength="15" v-model="detailtmp.shortname" name="companyshortname" id="companyShortName"/>
								<el-alert style="width:400px;" :closable="false" :title="errors.first('scope1.companyshortname')" type="error" v-show="errors.has('scope1.companyshortname')"></el-alert>

								<input data-vv-scope="scope1" v-validate="'required|max:50'" type="text" ref="editfeature" placeholder="一句话描述公司优势，核心键值，限50字" maxlength="50" v-model="detailtmp.feature" name="temptation" id="companyFeatures"/>
	                    		<el-alert style="width:400px;" :closable="false" :title="errors.first('scope1.temptation')" type="error" v-show="errors.has('scope1.temptation')"></el-alert>
								
								<!--<input type="hidden" value="25927" id="companyId" name="companyId"/>-->
								<input type="button" value="保存" id="saveDetail" class="btn_small" @click="savedetail"/>
								<a id="cancelDetail" class="btn_cancel_s" @click.prevent="canceldetail">取消</a>
							</form>
							<div class="clear oneword" :style="{'display':editdetailshow?'none':'block'}">
								<img width="17" height="15" src="../../../static/images/quote_l.png"/>
								&nbsp;
								<span>{{company.companyDetail.feature}}</span>
								&nbsp;
								<img width="17" height="15" src="../../../static/images/quote_r.png"/>
							</div>
							<h3 class="dn" :style="{'display':editlabel?'block':'none'}">已选择标签</h3>
							<ul style="overflow: auto;" id="hasLabels" class="reset clearfix">
								<li v-for="(item,index) in company.companyDetail.labelList" :key="index" @click="deletelabel(index)" :style="{'margin-right':index==labelcurrent?'6px':'18px'}" style="margin-right:18px;cursor: pointer;" @mouseover="mouseonlabel(index)" @mouseout="mouseoutlabel">
									<span>{{item.label}}</span>
									<i>x</i>
								</li>
								<!--<li><span>年终分红</span></li>
								<li><span>五险一金</span></li>
								<li><span>弹性工作</span></li>
								<li><span>岗位晋升</span></li>-->
								<li class="link" v-show="!editlabel" @click="editlabelshow">编辑标签</li>
							</ul>
							<div class="dn" id="addLabels" :style="{'display':editlabel?'block':'none'}">
								
								<input data-vv-scope="labelscope" v-validate="'max:6'" v-model="labeltmp" type="text" ref="newlabel" placeholder="添加自定义标签" name="label" id="label" class="label_form"/>
								<input type="button" value="贴上" class="" id="add_label" @click="pastelabel"/>
								<el-alert style="width:215px;" :closable="false" :title="errors.first('labelscope.label')" type="error" v-show="errors.has('labelscope.label')"></el-alert>
								
								<div class="clear"></div>
								<ul class="reset clearfix"></ul>
								<a id="saveLabels" class="btn_small" @click.prevent="savelabel">保存</a>
								<a id="cancelLabels" class="btn_cancel_s" @click.prevent="cancellabel">取消</a>
								
							</div>
						</div>
						
						<a title="编辑基本信息" class="c_edit" id="editCompanyDetail" @click.prevent="editdetail"></a>
						<div class="clear"></div>
					</div>
					
					<div class="c_breakline"></div>
					
					<div id="Product">
						<div>
							<!--无产品 -->
							<dl class="c_section" v-if="!company.productList.length">
					            <dt>
					                <h2><em></em>公司产品</h2>
					            </dt>
					            <dd>
					                <div class="addnew">
					                    	酒香不怕巷子深已经过时啦！<br>
										把自己优秀的产品展示出来吸引人才围观吧！<br>
					                    <a class="product_edit" href="javascript:void(0)" @click.prevent="addproduct">+添加公司产品</a>
					                </div>
					            </dd>
					        </dl>
						</div>
						<div v-for="(item,index) in company.productList" :key="index" v-if="company.productList.length">
							<Product :product="item" :index="index" @delete="handleItemDelete" @insert="addproduct"></Product>
						</div>
					</div>
					
					<div id="Profile">
						<div class="profile_wrap">
					        <!--无介绍 -->
							<dl class="c_section nointro" v-show="!editintroshow" v-if="company.intro===undefined||company.intro===null||company.intro===''">
					            <dt>
					                <h2><em></em>公司介绍</h2>
					            </dt>
					            <dd>
					                <div class="addnew">
					                                                       详细公司的发展历程、让求职者更加了解你!<br>
					                    <a id="addIntro" href="javascript:void(0)" @click.prevent="addIntro">+添加公司介绍</a>
					                </div>
					            </dd>
					        </dl>
					        
					        <!--编辑介绍-->
					        <dl class="c_section newIntro" :class="[editintroshow?'':'dn']">
					            <dt>
					                <h2><em></em>公司介绍</h2>
					            </dt>
					            <dd>
						            <form id="companyDesForm">
						                <textarea data-vv-scope="comintro" v-validate="'required|max:1000'" placeholder="请分段详细描述公司简介、企业文化等" v-model="comintrotmp" ref="comintro"  name="companyProfile" id="companyProfile"></textarea>		                                        
						                
						                <div class="word_count fr" v-show="!hascomintro()">简介不超过 <span>1000</span> 字</div>
						                <div class="word_count fr" v-show="hascomintro()">还可以输入 <span>{{1000-comintrotmp.length}}</span> 字</div>
						                <el-alert style="width: 600px;height: 40px;" :closable="false" :title="errors.first('comintro.companyProfile')" type="error" v-show="errors.has('comintro.companyProfile')"></el-alert>
						                
						                <div class="clear"></div>
						                <input type="button" value="保存" id="submitProfile" class="btn_small" @click="saveintro">
						                <a id="delProfile" class="btn_cancel_s" href="javascript:void(0)" @click="cancelintro">取消</a>
						            </form>
					            </dd>
					        </dl>
					            
					        <!--有介绍-->
					        <dl class="c_section" v-if="company.intro!==undefined&&company.intro!==null&&company.intro!==''" v-show="!editintroshow">
					            <dt>
					                <h2><em></em>公司介绍</h2>
					            </dt>
					            <dd>
					                <div class="c_intro">{{company.intro}}</div>
					                <a title="编辑公司介绍" id="editIntro" class="c_edit" href="javascript:void(0)" @click.prevent="editIntro"></a>
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
					<!--<input type="hidden" value="" name="hasNextPage" id="hasNextPage"/>
					<input type="hidden" value="" name="pageNo" id="pageNo"/>
					<input type="hidden" value="" name="pageSize" id="pageSize"/>-->
					<div id="flag"></div>
				</div>
				<div class="content_r">
					<div id="Tags">
						<div id="c_tags_show" class="c_tags solveWrap" :style="{'display':edittagshow?'none':'block'}">
							<table>
								<tbody>
									<tr>
										<td width="62">地点</td>
										<td>{{company.companyDetail.city}}</td>
									</tr>
									<tr>
										<td>领域</td>
										<td title="移动互联网">{{company.companyDetail.field}}</td>
									</tr>
									<tr>
										<td>规模</td>
										<td>{{company.companyDetail.scale}}</td>
									</tr>
									<tr>
										<td>主页</td>
										<td>
											<!--<router-link to="" target="_blank"></router-link>-->
											<a :href="company.companyDetail.comurl" target="_blank">前往公司主页</a>
										</td>
									</tr>
								</tbody>
							</table>
							<a title="编辑信息" id="editTags" class="c_edit" @click.prevent="edittag"></a>
						</div>
						<div id="c_tags_edit" class="c_tags editTags" :style="{'display':edittagshow?'block':'none'}">
							<form>
								<table>
									<tbody>
										<tr>
		                            		<td>地点</td>
		                            		<td @mouseleave="cityboxshow=false">
		                            		<!--<td>-->
		                            			<!--<input type="text" placeholder="请输入地点" v-model="company.companyDetail.city" name="city" id="city">-->	
		                            			<input data-vv-scope="tags" v-validate="'required'" type="text" placeholder="请输入地点" readonly="readonly" @click="cityboxshow=true" :value="company.companyDetail.city" name="companycity" id="city">
		                            			<el-alert style="width: 184px;height: 36px;" :closable="false" :title="errors.first('tags.companycity')" type="error" v-show="errors.has('tags.companycity')"></el-alert>
		                            			<div class="boxUpDown_s boxUpDown_596" id="box_expectCity_s" :style="{'display':cityboxshow?'block':'none'}">
										          		<dl>
										        			<dt>热门城市</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.hotcities" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>ABCDEF</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list1" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>GHIJ</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list2" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>KLMN</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list3" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>OPQR</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list4" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>STUV</dt>
										        			<dd><span v-for="(item,index) in citylist.list5" :key='index' @click="pickcity(item)">
										        				{{item}}
										        			</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>WXYZ</dt>
										        			<dd><span v-for="(item,index) in citylist.list6" :key='index' @click="pickcity(item)">
										        				{{item}}
										        			</span>
											        		</dd>
										        	  	</dl>
										        	</div>
		                            		</td>
		                        		</tr>
		                        		<tr>
		                            		<td>领域</td><!-- 支持多选 -->
		                            		<td>
		                            			<!--<input type="hidden" v-model="company.companyDetail.field" id="industryField" name="industryField">-->
		                            			<!--<input type="text" v-model="company.companyDetail.field" style="background:none;cursor:default;border:none !important;" value="移动互联网" id="select_ind" class="select_tags">-->
		                            			<input data-vv-scope="tags" type="text" v-validate="'required|industry|max:15'" v-model="company.companyDetail.field" id="select_ind" name="select_industry">
		                            			<el-alert style="width: 184px;height: 36px;" :closable="false" :title="errors.first('tags.select_industry')" type="error" v-show="errors.has('tags.select_industry')"></el-alert>
		                            		</td>
		                        		</tr>
		                        		<tr>
		                            		<td>规模</td>
		                            		<td @mouseleave="outscalelist">
		                            			<!--<input type="hidden" value="" id="companySize" name="companySize">-->
		                            			<input data-vv-scope="tags" name="select_scale" v-validate="'required'" type="button" :value="company.companyDetail.scale" id="select_sca" class="select_tags" :class="[selecttagshow?'select_tags_focus':'']" @click="overscalelist">
		                            			<el-alert style="width: 184px;height: 36px;" :closable="false" :title="errors.first('tags.select_scale')" type="error" v-show="errors.has('tags.select_scale')"></el-alert>
		                                		<div class="selectBox dn" id="box_sca" :style="{'display': selecttagshow?'block':'none'}">
			                                    	<ul class="reset">
			                                    		<li :class="[index==scalecurrent?'current':'']" v-for="(item,index) in scalelist" :key="index" @click="choosescale(index)">
			                                    			{{item}}
			                                    		</li>
			                                    		<!--<li>少于15人</li>
					                            		<li>15-50人</li>
					                            		<li>50-150人</li>
					                            		<li class="current">150-500人</li>
					                            		<li>500-2000人</li>
					                            		<li>2000人以上</li>-->
					                            	</ul>
		                                		</div>	
		                            		</td>
		                        		</tr>
				                        <tr>
				                            <td>主页</td>
				                            <td>
		                            			<input data-vv-scope="tags" v-validate="'required|website'" type="text" placeholder="请输入网址" v-model="company.companyDetail.comurl" name="website" id="companyUrl">	
		                            			<el-alert style="width: 184px;height: 46px;" :closable="false" :title="errors.first('tags.website')" type="error" v-show="errors.has('tags.website')"></el-alert>
				                            </td>
				                        </tr>
		                    		</tbody>
								</table>
								<!--<input type="hidden" id="comCity" :value="company.companyDetail.city"/>
								<input type="hidden" id="comInd" :value="company.companyDetail.field"/>
								<input type="hidden" id="comSize" :value="company.companyDetail.scale"/>
								<input type="hidden" id="comUrl" :value="company.companyDetail.comurl"/>-->
								<input type="button" value="保存" id="submitFeatures" class="btn_small" @click="savetags"/>
								<!--<router-link id="cancelFeatures" class="btn_cancel_s" to="">取消</router-link>-->
								<div class="clear"></div>
							</form>
						</div>
					</div>
					
					<dl class="c_section c_stages">
						<dt>
							<h2>
								<em></em>
								融资阶段
							</h2>
							<a title="编辑融资阶段" class="c_edit" :style="{'display':editstageshow?'none':'block'}" @click.prevent="editstage"></a>
						</dt>
						
						<dd>
							<ul v-if="company.companyStage" class="reset stageshow" :style="{'display':editstageshow?'none':'block'}">
	                    		<li>目前阶段：<span class="c5">{{company.companyStage.currentstage}}</span></li>
	                    		<li v-if="company.companyStage.org&&company.companyStage.org !== ''">投资机构：<span class="c5">{{company.companyStage.org}}</span></li>
	                    	</ul>
	                    	<form v-if="stagetmp" class="dn" id="stageform" :style="{'display':editstageshow?'block':'none'}">
	                    		<div class="stageSelect" @mouseleave="currentstagelistshow = false">
	                    			<label>目前阶段</label>
		                         	<input v-validate="'required'" data-vv-scope="stage" type="button" :value="stagetmp.currentstage" id="select_fin" class="select_tags_short fl" @click="currentstagelistshow = true" name="companystage">
		                         	<el-alert style="width: 228px;height: 36px;" :closable="false" :title="errors.first('stage.companystage')" type="error" v-show="errors.has('stage.companystage')"></el-alert>
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
					                    <input v-validate="'max:10'" data-vv-scope="stage" type="text" ref="org" placeholder="如真格基金" name="stageorg" v-model="stagetmp.org">
					                    <el-alert style="width: 228px;height: 36px;" :closable="false" :title="errors.first('stage.stageorg')" type="error" v-show="errors.has('stage.stageorg')"></el-alert>
			                    	</li>
			                    </ul>
			                    <input type="button" value="保存" @click="savestage" class="btn_small">
			                    <a id="cancelStages" class="btn_cancel_s" @click.prevent="editstageshow = false" href="javascript:void(0)">取消</a>
			                    <div class="clear"></div>
			                </form>
						</dd>
					</dl>
					
					<div id="Member">
						<dl class="c_section c_member">
							<dt>
								<h2>
									<em></em>
									领导团队
								</h2>
								<!--<a title="添加创始人" class="c_add" to=""></a>-->
							</dt>
							<dd>
								<div class="member_wrap">
									<!--无创始人-->
									<div class="member_info addnew_right" v-show="!addmembershow&&!editmembershow" v-if="company.companyMember===undefined||company.companyMember===null||company.companyMember===''||company.companyMember.name===undefined||company.companyMember.name===null||company.companyMember.name===''">
										展示公司领导团体，<br>提升诱人指数<br>
										<a class="member_edit" @click.prevent="addcommember">+添加成员</a>
									</div>
									
									<!--添加创始人-->
									<div class="member_info newMember" v-if="membertmp" v-show="addmembershow">
										<form class="memberForm">
											<div class="new_portrait">
						                            <div class="portrait_upload dn portraitNo">
						                                <span>上传负责人头像</span>
						                            </div>
						                            <div class="portraitShow">
						                            	<img width="120" height="120" :src="newmemberimg">
							                        	<span>更换头像</span>
							                        </div>
							                        <input type="file" accept="image/jpeg,image/png,image/jp2,image/gif" @change="getnewmemberimg" title="支持jpg、jpeg、gif、png格式，文件小于5M" name="myfiles" id="profiles0">
							                    	<!--<input type="hidden" value="7" name="type" class="type">-->
							                    	<!--<input type="hidden" value="images/leader_default.png" name="photo" class="leaderInfos">-->
						                            <em>
												                                尺寸：120*120px <br> 	
												                                大小：小于5M
						                            </em>
						                    </div>
						                    <input style="width: 234px;height: 46px;" v-validate="'required|membername|max:20'" data-vv-scope="member" type="text" placeholder="请输入负责人姓名" v-model="membertmp.name" ref="newmembername" name="membername">	
						                    <el-alert style="width: 234px;height: 36px;" :closable="false" :title="errors.first('member.membername')" type="error" v-show="errors.has('member.membername')"></el-alert>
						                    
						                    
					                        <input style="width: 234px;height: 46px;" v-validate="'required|nosymbol|max:20'" data-vv-scope="member" type="text" placeholder="请输入负责人当前职位" v-model="membertmp.post" ref="newmemberpost" name="memberposition">	
					                        <el-alert style="width: 234px;height: 36px;" :closable="false" :title="errors.first('member.memberposition')" type="error" v-show="errors.has('member.memberposition')"></el-alert>
					                        
					                        
					                        <textarea style="width: 234px;" v-validate="'required|max:500'" data-vv-scope="member" placeholder="请输入负责人个人简介" maxlength="500" class="s_textarea" name="memberintro" v-model="membertmp.intro" ref="newmemberintro"></textarea>	
					                        <div v-if="membertmp.intro" class="word_count fr">简介不超过 <span>{{500-membertmp.intro.length}}</span> 字</div>
					                        <div v-if="!membertmp.intro" class="word_count fr">简介不超过 <span>500</span> 字</div>
					                        <el-alert style="width: 234px;height: 36px;" :closable="false" :title="errors.first('member.memberintro')" type="error" v-show="errors.has('member.memberintro')"></el-alert>
					                        
					                        <div class="clear"></div>
					                        <input type="button" value="保存" class="btn_small" @click="savenewmember">
				                            <!--<a class="btn_cancel_s member_delete" href="javascript:void(0)">删除</a>-->
				                            <a class="btn_cancel_s member_delete" @click.prevent="canceladdnewmember">取消</a>
										</form>
									</div>
									
									<!--编辑创始人-->
									<div class="member_info newMember" v-if="membertmp" v-show="editmembershow">
										<form class="memberForm">
											<div class="new_portrait">
						                            <div class="portrait_upload dn portraitNo">
						                                <span>上传创始人头像</span>
						                            </div>
						                            <div class="portraitShow">
						                            	<img v-if="membertmp.img" width="120" height="120" :src="membertmp.img">
						                            	<img v-else width="120" height="120" src="../../../static/images/default_headpic.png">
							                        	<span>更换头像</span>
							                        </div>
							                        <input type="file" accept="image/jpeg,image/png,image/jp2,image/gif" @change="getmemberimg" title="支持jpg、jpeg、gif、png格式，文件小于5M" name="myfiles" id="profiles1">
						                            <em>
												                                尺寸：120*120px <br> 	
												                                大小：小于5M
						                            </em>
						                    </div>
						                    <input style="width: 234px;height: 46px;" v-validate="'required|membername|max:20'" data-vv-scope="member" type="text" placeholder="请输入创始人姓名" v-model="membertmp.name" name="membername">	
						                    <el-alert style="width: 234px;height: 36px;" :closable="false" :title="errors.first('member.membername')" type="error" v-show="errors.has('member.membername')"></el-alert>
						                    
					                        <input style="width: 234px;height: 46px;" v-validate="'required|nosymbol|max:20'" data-vv-scope="member" type="text" placeholder="请输入创始人当前职位" v-model="membertmp.post" name="memberposition">	
					                        <el-alert style="width: 234px;height: 36px;" :closable="false" :title="errors.first('member.memberposition')" type="error" v-show="errors.has('member.memberposition')"></el-alert>
					                        
					                        <textarea style="width: 234px;" v-validate="'required|max:500'" data-vv-scope="member" placeholder="请输入创始人个人简介" maxlength="500" class="s_textarea" name="memberintro" v-model="membertmp.intro"></textarea>	
					                        <div v-if="membertmp.intro" class="word_count fr">简介不超过 <span>{{500-membertmp.intro.length}}</span> 字</div>
					                        <div v-if="!membertmp.intro" class="word_count fr">简介不超过 <span>500</span> 字</div>
					                        <el-alert style="width: 234px;height: 36px;" :closable="false" :title="errors.first('member.memberintro')" type="error" v-show="errors.has('member.memberintro')"></el-alert>
					                        
					                        <div class="clear"></div>
					                        <input type="button" value="保存" class="btn_small" @click="savenewmember">
				                            <a class="btn_cancel_s member_delete" @click.prevent="deletemember">删除</a>
										</form>
									</div>
									
									<!--显示创始人-->
									<div class="member_info" v-if="company.companyMember!==undefined&&company.companyMember!==null&&company.companyMember!==''&&company.companyMember.name!==undefined&&company.companyMember.name!==null&&company.companyMember.name!==''" v-show="!editmembershow&!addmembershow">
										<!--<a title="编辑创始人" class="c_edit member_edit" href="javascript:void(0)"></a>-->
										<a title="编辑创始人" class="c_edit member_edit" @click.prevent="editmember"></a>
				                        <div class="m_portrait">
				                            <div></div>
				                            <img v-if="company.companyMember&&company.companyMember.img" width="120" height="120" :alt="company.companyMember.name" :src="company.companyMember.img">
				                            <img v-else width="120" height="120" src="../../../static/images/leader_default.png"/>
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
					
					<div id="Reported">
						<dl class="c_section c_reported">
			            	<dt>
			                	<h2>
			                		<em></em>
			                		公司新闻报道
			                	</h2>
	                   			<!--<a title="添加报道" class="c_add" href="javascript:void(0)"></a>-->
	                   			<a v-show="company.reportList&&company.reportList.length!=0&&!addreposhow&&!editreposhow&&company.reportList.length<3" title="添加报道" class="c_add" @click.prevent="addrepo"></a>
			                </dt>
		                	<dd>
			                	<!-- 编辑报道 -->
	                       		<ul class="reset">
	                       			<li v-for="(item,index) in company.reportList" :key="index">
	                       				<a :style="{'display':editreposhow&&index==repocurrent?'none':''}" class="article" :title="item.repotitle" target="_blank" :href="item.repolink">{{item.repotitle}}</a>
			                			<a title="编辑报道" v-show="!addreposhow" class="c_edit dn" @click.prevent="editrepo(index)" :style="{'display':editreposhow?'none':'inline'}"></a>
			                			<form class="reportForm" v-if="repotmp" v-show="index==repocurrent&&editreposhow&&!addreposhow">
			                				<input style="width: 234px;height: 46px;" v-validate="'required|max:15'" data-vv-scope="repo" type="text" placeholder="请输入文章标题" v-model="repotmp.repotitle" name="articleTitle" class="valid">
			                				<el-alert style="width: 234px;height: 46px;" :closable="false" :title="errors.first('repo.articleTitle')" type="error" v-show="errors.has('repo.articleTitle')"></el-alert>
			                				
			                				<input style="width: 234px;height: 46px;" v-validate="'required|website'" data-vv-scope="repo" type="text" placeholder="请输入文章链接" v-model="repotmp.repolink" name="articleUrl" class="valid"><span for="articleUrl" generated="true" class="error" style="display: none;">请输入有效的文章链接</span>
			                				<el-alert style="width: 234px;height: 46px;" :closable="false" :title="errors.first('repo.articleUrl')" type="error" v-show="errors.has('repo.articleUrl')"></el-alert>
			                				
			                				<input type="button" value="保存" class="btn_small" @click="saverepo(index)">
				                            <a class="btn_cancel_s report_delete" @click.prevent="deleterepo(index)">删除</a>
				                     	</form>
	                       		</li>
	                       		</ul>
		                	
			                	<!-- 无报道 -->
		                        <div class="addnew_right reported_info" v-show="company.reportList.length==0&&!addreposhow">
		                        	展示外界对公司的深度报道，<br>便于求职者了解公司！<br>
		                            <a class="report_edit" @click.prevent="addrepo">+添加报道</a>
		                        </div>
	                        
	                        	<!--添加新的报道-->
			                	<ul class="newReport" v-if="repotmp" v-show="addreposhow">
		                        	<li>
			                			<form class="reportForm">
			                				<input style="width: 234px;height: 46px;" v-validate="'required|max:15'" data-vv-scope="repo" type="text" placeholder="请输入文章标题" ref="newtitle" v-model="repotmp.repotitle" name="articleTitle">
			                				<el-alert style="width: 234px;height: 46px;" :closable="false" :title="errors.first('repo.articleTitle')" type="error" v-show="errors.has('repo.articleTitle')"></el-alert>
			                				
			                				<input style="width: 234px;height: 46px;" v-validate="'required|website'" data-vv-scope="repo" type="text" placeholder="请输入文章链接" ref="newlink" v-model="repotmp.repolink" name="articleUrl">
			                				<el-alert style="width: 234px;height: 46px;" :closable="false" :title="errors.first('repo.articleUrl')" type="error" v-show="errors.has('repo.articleUrl')"></el-alert>
			                				
			                				<input type="button" value="保存" class="btn_small" @click="savenewrepo">
				                            <a class="btn_cancel_s report_cancel" @click.prevent="canceladdnewrepo">取消</a>
				                            <!--<input type="hidden" value="" class="article_id">-->
				                     	</form>
			                		</li>
		                        </ul>
				        	</dd>
		            	</dl><!-- end .c_reported -->
					</div>
				</div>
			</div>
			
			<div class="clear"></div>
			<!--<a title="回到顶部" id="backtop" style="display: inline;" @click="toTop"></a>-->
			<totop></totop>
		</div>
	</div>
	<footert></footert>
	</div>
</template>

<script>
	import Product from './product/Product'
	import footert from '../footer/footer'
	import headert from '../header/header'
	import totop from '../totop/totop'
	export default{
		name:'myCompany',
		created(){
			this.dataInit()
		},
		components:{
			Product,
			footert,
			headert,
			totop
		},
		mounted(){
			this.isMounted = true
		},
		data(){
			return{
				company:null,
				isMounted:null,
				citylist:{
					hotcities:['北京','上海','广州','深圳','成都','杭州'],
					list1:['北京','长春','成都','重庆','长沙','常州','东莞','大连','佛山','福州'],
					list2:['贵阳','广州','哈尔滨','合肥','海口','杭州','惠州','金华','济南','嘉兴'],
					list3:['昆明','廊坊','宁波','南昌','南京','南宁','南通'],
					list4:['青岛','泉州'],
					list5:['上海','石家庄','绍兴','沈阳','深圳','苏州','天津','太原','台州'],
					list6:['武汉','无锡','温州','西安','厦门','烟台','珠海','中山','郑州']
				},
				vashow:false,
				cityboxshow:false,
				editintroshow:false,
				editdetailshow:false,
				edittagshow:false,
				editlabel:false,
				editreposhow:false,
				addreposhow:false,
				addmembershow:false,
				selecttagshow:false,
				collapsibleshow:false,
				currentstagelistshow:false,
				hasIntro:false,
				editstageshow:false,
				editmembershow:false,
				detailtmp:null,
				labeltmp:null,
				stagetmp:null,
				membertmp:null,
				repotmp:null,
				/*company:{
					intro:'',
					companyDetail:{
						fullname:'公司全名',
						shortname:'公司简称',
						feature:'公司特征',
						labels:['年终分红','五险一金','弹性工作','岗位晋升'],
						img:'../../../static/images/logo_default.png',
						city:'上海',
						field:'移动互联网',
						scale:'150-500人',
						comurl:'http://www.baidu.com'
					},
					companyStage:{
						currentstage:'天使轮',
						org:null
					},
					companyMember:{
						name:null,
						img:'../../../static/images/leader_default.png',
						post:null,
						intro:null,
					},
					reportList:[
						{
							repotitle:'随便写1',
							repolink:'http://www.baidu.com'
						},
						{
							repotitle:'随便写2',
							repolink:'http://www.alibaba.com'
						}
					],
					productList:[
						{
							name:'',
							info:'',
							img:'../../../../static/images/product_default.png'
						}
					],
				}*/
				newmemberimg:'../../../static/images/leader_default.png',
				scalelist:['少于15人','15-50人','50-150人','150-500人','500-2000人','2000人以上'],
				stagelist:['未融资','天使轮','A轮','B轮','C轮','D轮及以上','上市公司'],
				scalecurrent:null,
				stagecurrent:null,
				repocurrent:null,
				labelcurrent:null,
				comintrotmp:'',
				newlabel:''
			}
		},
		methods:{
			getMemberImg(){
				this.$axios({
					method:'get',
					url:'/api/memberImg/download',
					params:{
						companyMemberId:this.company.companyMember.companyMemberId
					},
					responseType:'arraybuffer'
				}).then(res=>{
						let blob = new Blob([res.data])
						if(blob.size>0){
							console.log(blob)
							let url = window.URL.createObjectURL(blob)
							this.company.companyMember.img = url
							console.log(this.company.companyMember.img)
						}
						else{
							this.company.companyMember.img = null
						}
				}).catch(err=>{
					console.log(err)
				})
			},
			setMemberImg(e){
				var memberImg = e.target.files[0]
				var formData = new FormData()
				formData.append('file',memberImg)
				formData.append('userId',this.$store.state.userId())
				formData.append('companyMemberId',this.company.companyMember.companyMemberId)
				this.$axios({
					method:'post',
					url:'/api/memberImg/upload',
					data:formData,
					headers:{
						'Content-Type':'multipart/form-data'
					},
					responseType:'arraybuffer'
				}).then(res=>{
					console.log(res)
					let blob = new Blob([res.data])
						if(blob.size>0){
							let url = window.URL.createObjectURL(blob)
							this.company.img = url
							console.log(this.company.img)
						}
						else{
							this.company.img = null
						}
				}).catch(err=>{
					console.log(err)
				})
//				this.uploadimg(memberimg)
			},
			getCompanyImg(){
				this.$axios({
					method:'get',
					url:'/api/companyImg/download',
					params:{
						companyDetailId:this.company.companyDetail.companyDetailId
					},
					responseType:'arraybuffer'
				}).then(res=>{
						let blob = new Blob([res.data])
						if(blob.size>0){
							console.log(blob)
							let url = window.URL.createObjectURL(blob)
							this.company.companyDetail.img = url
							console.log(this.company.companyDetail.img)
						}
						else{
							this.company.companyDetail.img = null
						}
				}).catch(err=>{
					console.log(err)
				})
			},
			setcompanyImg(e){
				var companyImg = e.target.files[0]
				var formData = new FormData()
				formData.append('file',companyImg)
				formData.append('userId',this.$store.state.userId())
				formData.append('companyDetailId',this.company.companyDetail.companyDetailId)
				this.$axios({
					method:'post',
					url:'/api/companyImg/upload',
					data:formData,
					headers:{
						'Content-Type':'multipart/form-data'
					},
					responseType:'arraybuffer'
				}).then(res=>{
					console.log(res)
					let blob = new Blob([res.data])
						if(blob.size>0){
							let url = window.URL.createObjectURL(blob)
							this.company.companyDetail.img = url
							console.log(this.company.companyDetail.img)
						}
						else{
							this.company.companyDetail.img = null
						}
				}).catch(err=>{
					console.log(err)
				})
			},
			dataInit(){
				this.$axios({
					method:'get',
					url:'/api/company/getByUserId',
					params:{
						userId:this.myUserId
					}
				}).then(res => {
					console.log(res)
					this.company = res.data.object
					this.getCompanyImg()
					this.getMemberImg()
				}).catch(err => {
					console.log(err)
				})
			},
			mouseonlabel(index){
				this.labelcurrent = index
				/*console.log(this.editlabel)
				console.log(this.labelcurrent)*/
			},
			mouseoutlabel(){
				this.labelcurrent = null
			},
			vaon(){
				this.vashow=true
			},
			vaout(){
				this.vashow=false
			},
			addproduct(){
				this.company.productList.push({
					name:'',
					info:'',
					img:'../../../../static/images/product_default.png'
				})
			},
			handleItemDelete(index){
				if(index >= 0 && index < this.company.productList.length){
					this.$confirm('是否删除这个产品?', '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
			        }).then(() => {
			        	  this.$axios({
			        	  	method:'get',
			        	  	url:'/api/companyProduct/delete',
			        	  	params:{
			        	  		companyProductId:this.company.productList[index].companyProductId
			        	  	}
			        	  }).then(res=>{
			        	  	console.log(res)
			        	  	this.dataInit()
			        	  }).catch(err=>{
			        	  	console.log(err)
			        	  })
			        	  this.company.productList.splice(index,1)
				          this.$message({
				            type: 'success',
				            message: '删除成功!'
				          });
			        }).catch(() => {
				          this.$message({
				            type: 'info',
				            message: '已取消删除'
				          });          
			        })
				}
			},
			editIntro(){
				this.comintrotmp = this.company.intro
				this.editintroshow = true
			},
			addIntro(){
				this.editintroshow = true
			},
			saveintro(){
				var validateScope = 'comintro'
				this.$validator.validate(validateScope + '.*').then((result) => {
					if (result) {
//					     	console.log(this.$validator)
					      	// 保存公司介绍并关闭编辑页面
					      	this.editintroshow = false
							this.company.intro = this.comintrotmp
							this.$axios({
								method:'post',
								url:'/api/company/update',
								data:this.company,
								headers:{
									'Content-Type':'application/json'
								}
							}).then(res => {
								console.log(res)
								this.dataInit()
							}).catch(err => {
								console.log(err)
							})
					}
					else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善公司介绍信息！'
							})
					}
			   	}).catch(err => {
			   			console.log(err)
			   			this.$message({
								type:'warn',
								message:'请先完善公司介绍信息！'
						})
			   	})
			},
			cancelintro(){
				this.editintroshow = false
			},
			editdetail(){
				this.editdetailshow = true
				this.detailtmp = JSON.parse(JSON.stringify(this.company.companyDetail))
			},
			savedetail(){
				    var validateScope = 'scope1'
				    this.$validator.validate(validateScope + '.*').then((result) => {
					     if (result) {
					      	// 保存数据
					      	this.company.companyDetail = JSON.parse(JSON.stringify(this.detailtmp))
							this.editdetailshow = false
							this.$axios({
								method:'post',
								url:'/api/companyDetail/update',
								data:this.company.companyDetail,
								headers:{
									'Content-Type':'application/json'
								}
							}).then(res=>{
								console.log(res)
								this.dataInit()
							}).catch(err=>{
								console.log(err)
							})
					     }
					     else{
					     	this.$message({
								type:'warn',
								message:'请先完善页面信息！'
							})
					     }
			   		}).catch(err => {
			   			console.log(err)
			   		})
			},
			canceldetail(){
				this.editdetailshow = false
			},
			edittag(){
				this.edittagshow = true
			},
			overscalelist(){
				this.selecttagshow = true
			},
			outscalelist(){
				this.selecttagshow = false
			},
			choosescale(index){
				this.scalecurrent = index
				this.company.companyDetail.scale = this.scalelist[index]
				this.selecttagshow = false
			},
			entercollapsible(){
				this.collapsibleshow = true
			},
			leavecollapsible(){
				this.collapsibleshow = false
			},
			savetags(){
				var validateScope = 'tags'
				this.$validator.validate(validateScope + '.*').then((result) => {
					     if (result) {
//					     	console.log(this.$validator)
					      	// 保存company.companyDetail数据并关闭编辑页面
						    this.edittagshow = false
						    this.$axios({
								method:'post',
								url:'/api/companyDetail/update',
								data:this.company.companyDetail,
								headers:{
									'Content-Type':'application/json'
								}
							}).then(res=>{
								console.log(res)
								this.dataInit()
							}).catch(err=>{
								console.log(err)
							})
					     }
					     else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善公司信息！'
							})
					     }
			   	}).catch(err => {
			   			console.log(err)
			   	})
			},
			editlabelshow(){
				this.editlabel = true
			},
			savelabel(){
				var validateScope = 'labelscope'
				this.$validator.validate(validateScope + '.*').then((result) => {
					     if (result) {
//					     	console.log(this.$validator)
					      	// 保存数据
					      	if(this.labeltmp && this.company.companyDetail.labelList.length < 10){
//					      		this.company.companyDetail.labelList.push(this.labeltmp)
								var label = {
									label:this.labeltmp
								}
					      		this.$axios({
									method:'post',
									url:'/api/companyLabel/insert',
									data:label,
									params:{
										companyDetailId:this.company.companyDetail.companyDetailId
									},
									headers:{
										'Content-Type':'application/json'
									}
								}).then(res=>{
									console.log(res)
									this.dataInit()
								}).catch(err=>{
									console.log(err)
								})
					      	}
					      	else{
					      		this.$message({
									type:'info',
									message:'已选择10个标签，无法再添加新的标签！'
								})
					      	}
					      	this.labeltmp = null
					      	this.editlabel = false
					     }
					     else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善标签信息！'
							})
					     }
			   	}).catch(err => {
			   			console.log(err)
			   	})
			},
			cancellabel(){
				this.editlabel = false
				this.labeltmp = null
			},
			pastelabel(){
				var validateScope = 'labelscope'
				this.$validator.validate(validateScope + '.*').then((result) => {
					     if (result) {
//					     	console.log(this.$validator)
					      	// 保存数据
					      	if(this.labeltmp && this.company.companyDetail.labelList.length < 10){
					      		/*this.company.companyDetail.labelList.push(this.labeltmp)
					      		this.labeltmp = null*/
					      		var label = {
									label:this.labeltmp
								}
					      		this.$axios({
									method:'post',
									url:'/api/companyLabel/insert',
									data:label,
									params:{
										companyDetailId:this.company.companyDetail.companyDetailId
									},
									headers:{
										'Content-Type':'application/json'
									}
								}).then(res=>{
									console.log(res)
									this.dataInit()
								}).catch(err=>{
									console.log(err)
								})
								this.labeltmp = null
					      	}
					      	else{
					      		this.$message({
									type:'info',
									message:'已选择10个标签，无法再添加新的标签！'
								})
					      	}
					     }
					     else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善标签信息！'
							})
					     }
			   	}).catch(err => {
			   			console.log(err)
			   	})
			},
			deletelabel(index){
				if(index >= 0 && index < this.company.companyDetail.labelList.length){
					this.$confirm('是否删除这个标签?', '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
			        }).then(() => {
//			        	  this.company.companyDetail.labelList.splice(index,1)
							this.$axios({
									method:'get',
									url:'/api/companyLabel/delete',
									params:{
										companyLabelId:this.company.companyDetail.labelList[index].companyLabelId
									}
								}).then(res=>{
									console.log(res)
									this.dataInit()
								}).catch(err=>{
									console.log(err)
								})
				          this.$message({
				            type: 'success',
				            message: '删除成功!'
				          });
			        }).catch(() => {
				          this.$message({
				            type: 'info',
				            message: '已取消删除'
				          });          
			        })
				}
			},
			editstage(){
				this.stagetmp = JSON.parse(JSON.stringify(this.company.companyStage))
				this.editstageshow = true
			},
			choosestage(index){
				this.stagecurrent = index
				this.stagetmp.currentstage = this.stagelist[index]
				this.currentstagelistshow = false
			},
			savestage(){
				var validateScope = 'stage'
				this.$validator.validate(validateScope + '.*').then((result) => {
					     if (result) {
//					     	console.log(this.$validator)
					      	// 保存融资阶段数据并关闭编辑页
					      	this.company.companyStage = JSON.parse(JSON.stringify(this.stagetmp))
							this.$axios({
									method:'post',
									url:'/api/companyStage/insert',
									data:this.company.companyStage,
									headers:{
										'Content-Type':'application/json'
									},
									params:{
										companyId:this.company.companyId
									}
								}).then(res=>{
									console.log(res)
									this.dataInit()
									this.editstageshow = false
								}).catch(err=>{
									console.log(err)
								})
					     }
					     else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善融资信息！'
							})
					     }
			   	}).catch(err => {
			   			console.log(err)
			   	})
			},
			deletemember(){
					this.$confirm('是否删除这个负责人?', '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
			        }).then(() => {
			        	this.$axios({
									method:'get',
									url:'/api/companyMember/delete',
									/*data:this.company.companyStage,
									headers:{
										'Content-Type':'application/json'
									},*/
									params:{
										companyMemberId:this.company.companyMember.companyMemberId
									}
								}).then(res=>{
									console.log(res)
									this.dataInit()
									this.membertmp=null
			        	  			this.editmembershow=false
								}).catch(err=>{
									console.log(err)
								})
			        	  
				          this.$message({
				            type: 'success',
				            message: '删除成功!'
				          });
			        }).catch(() => {
				          this.$message({
				            type: 'info',
				            message: '已取消删除'
				          });          
			        })
			},
			addcommember(){
				this.membertmp = {
					name:null,
					img:'../../../static/images/leader_default.png',
					post:null,
					intro:null,
				}
				this.addmembershow = true
			},
			editmember(){
				this.membertmp = JSON.parse(JSON.stringify(this.company.companyMember))
				this.editmembershow = true
			},
			getmemberimg(e){
				let _this = this
				var files = e.target.files[0]
				if(!e || !window.FileReader) return
				let reader = new FileReader()
				reader.readAsDataURL(files)//这里是关键一步，转换就在这里
				reader.onloadend = function(){
					_this.company.companyMember.img = this.result
				}
			},
			getcomimg(e){
				let _this = this
				var files = e.target.files[0]
				if(!e || !window.FileReader) return
				let reader = new FileReader()
				reader.readAsDataURL(files)//这里是关键一步，转换就在这里
				reader.onloadend = function(){
					_this.company.companyDetail.img = this.result
				}
			},
			addrepo(){
				if(this.company.reportList.length < 5){
					this.repotmp = {
						repotitle:null,
						repolink:null
					}
					this.addreposhow = true
				}
				else{
					this.$message({
						message:'已拥有3条公司新闻报道，无法编写更多报道！'
					})
				}
			},
			editrepo(index){
				if(index >= 0 && index < this.company.reportList.length){
					this.repotmp = JSON.parse(JSON.stringify(this.company.reportList[index]))
					this.repocurrent = index
					this.editreposhow = true
				}
			},
			deleterepo(index){
				if(index >= 0 && index < this.company.reportList.length){
					this.$confirm('是否删除这条新闻报道?', '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
			        }).then(() => {
//			        	  this.company.reportList.splice(index,1)
						  this.$axios({
									method:'get',
									url:'/api/companyReport/delete',
									/*data:this.company.companyStage,
									headers:{
										'Content-Type':'application/json'
									},*/
									params:{
										companyReportId:this.company.reportList[index].companyReportId
									}
								}).then(res=>{
									console.log(res)
									this.dataInit()
									this.repocurrent = null
			        	  			this.editreposhow = false
			        	  			this.addreposhow = false
								}).catch(err=>{
									console.log(err)
								})
			        	  
				          this.$message({
				            type: 'success',
				            message: '删除成功!'
				          });
			        }).catch(() => {
				          this.$message({
				            type: 'info',
				            message: '已取消删除'
				          });          
			        })
				}
			},
			saverepo(index){
				var validateScope = 'repo'
				this.$validator.validate(validateScope + '.*').then((result) => {
					     if (result) {
					      	// 保存新闻报道数据并关闭编辑页
					      	if(index >= 0 && index < this.company.reportList.length){
					      		this.company.reportList[index] = JSON.parse(JSON.stringify(this.repotmp))
					      		this.$axios({
									method:'post',
									url:'/api/companyReport/update',
									data:this.company.reportList[index],
									headers:{
										'Content-Type':'application/json'
									},
								}).then(res=>{
									console.log(res)
									this.dataInit()
									this.editreposhow = false
								}).catch(err=>{
									console.log(err)
								})
					      	}
					     }
					     else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善新闻报道信息！'
							})
					     }
			   	}).catch(err => {
			   			console.log(err)
			   	})
			},
			savenewrepo(){
				var validateScope = 'repo'
				this.$validator.validate(validateScope + '.*').then((result) => {
					     if (result) {
					      	// 保存新添加的新闻报道数据并关闭编辑页
					      	if(this.company.reportList.length < 3){
					      		if(this.repotmp){
					      			var report = JSON.parse(JSON.stringify(this.repotmp))
					      			this.$axios({
										method:'post',
										url:'/api/companyReport/insert',
										data:report,
										headers:{
											'Content-Type':'application/json'
										},
										params:{
											companyId:this.company.companyId
										}
									}).then(res=>{
										console.log(res)
										this.dataInit()
										this.addreposhow = false
									}).catch(err=>{
										console.log(err)
									})
					      		}
					      	}
					      	else{
								this.$message({
									message:'已拥有3条公司新闻报道，无法编写更多报道！'
								})
							}
						 }
					     else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善新闻报道信息！'
							})
					     }
			   	}).catch(err => {
			   			console.log(err)
			   	})
			},
			savenewmember(){
				//添加新的member和编译保存已有member相同
				var validateScope = 'member'
				    this.$validator.validate(validateScope + '.*').then((result) => {
					     if (result) {
//					     	console.log(this.$validator)
					      	// 保存member数据并关闭编辑页面
					      	this.company.companyMember = JSON.parse(JSON.stringify(this.membertmp))
					      	this.$axios({
										method:'post',
										url:'/api/companyMember/insert',
										data:this.company.companyMember,
										headers:{
											'Content-Type':'application/json'
										},
										params:{
											companyId:this.company.companyId
										}
									}).then(res=>{
										console.log(res)
										this.dataInit()
										this.addmembershow = false
										this.editmembershow = false
									}).catch(err=>{
										console.log(err)
									})
					     }
					     else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善负责人信息！'
							})
					     }
			   		}).catch(err => {
			   			console.log(err)
			   		})
			},
			canceladdnewmember(){
//				this.hasmember=false
				this.addmembershow=false
//				this.membertmp = null
				this.newmemberimg = '../../../static/images/leader_default.png'
			},
			getnewmemberimg(e){
				let _this = this
				var files = e.target.files[0]
				if(!e || !window.FileReader) return
				let reader = new FileReader()
				reader.readAsDataURL(files)//这里是关键一步，转换就在这里
				reader.onloadend = function(){
					_this.newmemberimg = this.result
				}
			},
			canceladdnewrepo(){
				this.addreposhow=false
				this.repotmp = null
			},
			toTop(){
				body.scrollIntoView({behavior:'smooth'})
			},
			pickcity(item){
				this.company.companyDetail.city = item
				this.cityboxshow = false
			},
			hascomintro(){
				if(this.comintrotmp.length==0){
					return false
				}
				else{
					return true
				}
			}
		},
		computed:{
			myUserId(){
				return this.$store.state.userId()
			}
		}
	}
</script>

<style>
	.boxUpDown_s{position:absolute;z-index:20;border:2px solid #c8e6de;margin-top:-2px;background:#fff;margin-left: -421px;}
	#box_expectCity_s{padding:5px 0;width: 605px;}
	#box_expectCity_s dl{min-height:30px;margin:3px 0;padding:0;clear:both;overflow:hidden;line-height:28px;}
	/*#box_expectCity dt{width:68px;color:#019875;font-weight:normal;margin:3px 0;*margin-left:-80px;padding-left:12px;position:absolute;float:left;}*/
	#box_expectCity_s dt{color:#019875;font-weight:normal;margin:3px 0;*margin-left:-80px;padding-left:12px;position:absolute;float:left;}
	#box_expectCity_s dd{margin-left:80px;overflow:hidden;}
	#box_expectCity_s dd span{width:66px;height:28px;font-size:14px;text-align:center;float:left;margin:3px 3px;background-color:#fafafa;}
	#box_expectCity_s dd span:hover{background-color:#91cebe;color:#fff;cursor:pointer;}
</style>