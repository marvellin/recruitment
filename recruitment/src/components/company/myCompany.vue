<template>
	<div>
	<div id="body">
		<div id="header">
			<div class="wrapper">
				<router-link class="logo" to="/">
					<img width="229" height="60" alt="全国招聘第一站" src="../../../build/logo.png"/>
				</router-link>
				<ul id="navheader" class="reset">
					<li>
						<router-link to="/home">首页</router-link>
					</li>
					<li class="current">
						<router-link to="/mycompany">公司</router-link>
					</li>
					<li>
						<router-link to="/forumHome" target="_blank">论坛</router-link>
					</li>
					<li>
						<router-link to="/resumesHome">简历管理</router-link>
					</li>
					<li>
						<router-link to="/postHome">发布职位</router-link>
					</li>
				</ul>
				<dl class="collapsible_menu" style="width: 165px;" :class="collapsibleshow?'expend':''" @mouseenter="entercollapsible" @mouseleave="leavecollapsible">
					<dt>
						<span>test&nbsp;</span>
						<span class="red dn" id="noticeDot-1"></span>
						<i></i>
					</dt>
					<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我发布的职位</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我收到的简历</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}" class="btm"><router-link to="">我的公司主页</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我要找工作</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">账号设置</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}" class="logout"><router-link to="">退出</router-link></dd>
				</dl>
			</div>
		</div>
		<div id="container">
			<div class="clearfix">
				<div class="content_l">
					<div class="c_detail" :class="[editlabel?'c_detail_bg':'']">
						<div style="background-color: #fff;" class="c_logo">
							<a title="上传公司LOGO" id="logoShow" class="inline cboxElement" >
								<img width="190" height="190" alt="公司logo" :src="comdetail.img"/>
								<span>更换公司图片<br />190px*190px 小于5M</span>
								<input type="file" @change="getcomimg"/>
							</a>
						</div>
						<div class="c_box companyName">
							<h2 title="公司名称测试">{{comdetail.shortname}}</h2>
							<em class="unvalid" @mouseover="vaon" @mouseout="vaout"></em>
							<span class="va dn" :style="{'display':vashow?'inline':'none'}">未认证企业</span>
							<router-link target="_blank" class="applyC" to="">申请认证</router-link>
							<div class="clear"></div>
							<h1 title="广东公司名称测试" class="fullname">{{comdetail.fullname}}</h1>
							<form class="clear editDetail" :class="[editdetailshow?'':'dn']" id="editDetailForm">
								<input type="text" ref="editshortname" placeholder="请输入公司简称" maxlength="15" :value="comdetail.shortname" name="companyShortName" id="companyShortName"/>
								<input type="text" ref="editfeature" placeholder="一句话描述公司优势，核心键值，限50字" maxlength="50" :value="comdetail.feature" name="companyFeatures" id="companyFeatures"/>
								<input type="hidden" value="25927" id="companyId" name="companyId"/>
								<input type="button" value="保存" id="saveDetail" class="btn_small" @click="savedetail"/>
								<a id="cancelDetail" class="btn_cancel_s" @click.prevent="canceldetail">取消</a>
							</form>
							<div class="clear oneword" :style="{'display':editdetailshow?'none':'block'}">
								<img width="17" height="15" src="../../../static/images/quote_l.png"/>
								&nbsp;
								<span>{{comdetail.feature}}</span>
								&nbsp;
								<img width="17" height="15" src="../../../static/images/quote_r.png"/>
							</div>
							<h3 class="dn" :style="{'display':editlabel?'block':'none'}">已选择标签</h3>
							<ul style="overflow: auto;" id="hasLabels" class="reset clearfix">
								<li v-for="(item,index) in comdetail.labels" :key="index" @click="deletelabel(index)" :style="{'margin-right':index==labelcurrent?'6px':'18px'}" style="margin-right:18px;cursor: pointer;" @mouseover="mouseonlabel(index)" @mouseout="mouseoutlabel">
									<span>{{item}}</span>
									<i>x</i>
								</li>
								<!--<li><span>年终分红</span></li>
								<li><span>五险一金</span></li>
								<li><span>弹性工作</span></li>
								<li><span>岗位晋升</span></li>-->
								<li class="link" v-show="!editlabel" @click="editlabelshow">编辑标签</li>
							</ul>
							<div class="dn" id="addLabels" :style="{'display':editlabel?'block':'none'}">
								<!--<label id="changeLabels" class="change">点击标签进行删除</label>-->
								<!--<router-link id="changeLabels" class="change" to="">换一换</router-link>-->
								<!--<input type="hidden" value="1" id="labelPageNo"/>-->
								
								<input type="text" ref="newlabel" placeholder="添加自定义标签" name="label" id="label" class="label_form"/>
								<input type="button" value="贴上" class="" id="add_label" @click="pastelabel"/>
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
							<dl class="c_section" v-if="!products.length">
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
						<div v-for="(item,index) in products" :key="index" v-if="products.length">
							<Product :index="index" @delete="handleItemDelete" @insert="addproduct"></Product>
						    <!--无产品 -->
							<!--<dl class="c_section" v-if="!products.length">
					            <dt>
					                <h2><em></em>公司产品</h2>
					            </dt>
					            <dd>
					                <div class="addnew">
					                                                       酒香不怕巷子深已经过时啦！<br>
										把自己优秀的产品展示出来吸引人才围观吧！<br>
					                    <a class="product_edit" href="javascript:void(0)">+添加公司产品</a>
					                </div>
					            </dd>
					        </dl>-->
					        <!--产品编辑-->
					        <!--<dl id="newProduct" class="newProduct dn">
					            <dt>
					            	<h2><em></em>公司产品</h2>
					            </dt>
					            <dd>
					                <form method="post" class="productForm">
					                    <div class="new_product"> 	
							                <div class="product_upload dn productNo">
							                    <div>
							                        <span>上传产品图片</span> 
							                        <br>	
							                                                                  尺寸：380*220px  	大小：小于5M
							                    </div>
							                </div>
							                <div class="product_upload productShow">
							                    <img width="380" height="220" src="style/images/product_default.png">
								                <span>更换产品图片<br>380*220px 小于5M</span>
								            </div>
							                <input type="file" title="支持jpg、jpeg、gif、png格式，文件小于5M" onchange="product_check(this,'http://www.lagou.com/c/upload.json','productNo','productShow','type','productInfos');" name="myfiles" id="myfiles0">
							                <input type="hidden" value="3" name="type" class="type"> 
							                <input type="hidden" value="images/product_default.png" name="productPicUrl" class="productInfos">   
							            </div>
					                    <div class="cp_intro">
					                        <input type="text" placeholder="请输入产品名称" value="发大发" name="product">	
					                        <input type="text" placeholder="请输入产品网址" value="http://www.weimob.com" name="productUrl">	
					                        <textarea placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="500" value="发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf" class="s_textarea" name="productProfile">发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf</textarea>	
					                        <div class="word_count fr">你还可以输入 <span>500</span> 字</div>
					                        <div class="clear"></div>
					                        <input type="submit" value="保存" class="btn_small">
					                        <a class="btn_cancel_s product_delete" href="javascript:void(0)">删除</a>
					                        <input type="hidden" value="11867" class="product_id">
					                    </div>
									</form>
					            </dd>
					        </dl>-->
					        
					        <!--有产品-->
					        <!--<dl class="c_product" v-if="products.length">
					            <dt>
					                <h2><em></em>公司产品</h2>
					            </dt>
					            <dd>
					                <img width="380" height="220" alt="发大发" src="../../../static/images/product_default.png">
				                    <div class="cp_intro">
				                        <h3><a target="_blank" href="http://www.weimob.com">发大发 </a></h3>
					                    <div class="scroll-pane" style="overflow: hidden; padding: 0px; width: 260px;">
					                    	<div class="jspContainer" style="width: 260px; height: 140px;">
					                    		<div class="jspPane" style="padding: 0px; top: 0px; width: 260px;">
					                    			<div>
					                    				发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf
					                    			</div>
					                    		</div>
					                    	</div>
					                    </div>
					                </div>
					                <a title="编辑公司产品" class="c_edit product_edit" href="javascript:void(0)"></a>
					            	<a title="新增公司产品" class="c_add product_add" href="javascript:void(0)"></a>
					            </dd>
					        </dl>-->
	            	</div>
					</div>
					<div id="Profile">
						<div class="profile_wrap">
					        <!--无介绍 -->
							<dl class="c_section nointro" v-if="!hasIntro">
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
						                <textarea placeholder="请分段详细描述公司简介、企业文化等" v-model="comintrotmp" ref="comintro"  name="companyProfile" id="companyProfile">{{comintro}}</textarea>		                                        
						                <div class="word_count fr" v-show="!hascomintro()">简介不超过 <span>1000</span> 字</div>
						                <div class="word_count fr" v-show="hascomintro()">还可以输入 <span>{{1000-comintrotmp.length}}</span> 字</div>
						                <div class="clear"></div>
						                <input type="button" value="保存" id="submitProfile" class="btn_small" @click="saveintro">
						                <a id="delProfile" class="btn_cancel_s" href="javascript:void(0)" @click="cancelintro">取消</a>
						            </form>
					            </dd>
					        </dl>
					            
					        <!--有介绍-->
					        <dl class="c_section" :class="[editintroshow?'dn':'']" v-if="hasIntro">
					            <dt>
					                <h2><em></em>公司介绍</h2>
					            </dt>
					            <dd>
					                <div class="c_intro">{{comintro}}</div>
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
								<router-link to="">+发布招聘职位</router-link>
							</div>
						</dd>
					</dl>
					<input type="hidden" value="" name="hasNextPage" id="hasNextPage"/>
					<input type="hidden" value="" name="pageNo" id="pageNo"/>
					<input type="hidden" value="" name="pageSize" id="pageSize"/>
					<div id="flag"></div>
				</div>
				<div class="content_r">
					<div id="Tags">
						<div id="c_tags_show" class="c_tags solveWrap" :style="{'display':edittagshow?'none':'block'}">
							<table>
								<tbody>
									<tr>
										<td width="62">地点</td>
										<td>{{comtags.city}}</td>
									</tr>
									<tr>
										<td>领域</td>
										<td title="移动互联网">{{comtags.field}}</td>
									</tr>
									<tr>
										<td>规模</td>
										<td>{{comtags.scale}}</td>
									</tr>
									<tr>
										<td>主页</td>
										<td>
											<!--<router-link to="" target="_blank"></router-link>-->
											<a :href="comtags.comurl" target="_blank">前往公司主页</a>
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
		                            		<td>
		                            			<input type="text" placeholder="请输入地点" v-model="comtags.city" name="city" id="city">	
		                            		</td>
		                        		</tr>
		                        		<tr>
		                            		<td>领域</td><!-- 支持多选 -->
		                            		<td>
		                            			<input type="hidden" v-model="comtags.field" id="industryField" name="industryField">
		                            			<!--<input type="text" v-model="comtags.field" style="background:none;cursor:default;border:none !important;" value="移动互联网" id="select_ind" class="select_tags">-->
		                            			<input type="text" v-model="comtags.field" id="select_ind">
		                            		</td>
		                        		</tr>
		                        		<tr>
		                            		<td>规模</td>
		                            		<td @mouseleave="outscalelist">
		                            			<input type="hidden" value="" id="companySize" name="companySize">
		                            			<input type="button" :value="comtags.scale" id="select_sca" class="select_tags" :class="[selecttagshow?'select_tags_focus':'']" @click="overscalelist">
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
		                            			<input type="text" placeholder="请输入网址" v-model="comtags.comurl" name="companyUrl" id="companyUrl">	
				                            </td>
				                        </tr>
		                    		</tbody>
								</table>
								<input type="hidden" id="comCity" :value="comtags.city"/>
								<input type="hidden" id="comInd" :value="comtags.field"/>
								<input type="hidden" id="comSize" :value="comtags.scale"/>
								<input type="hidden" id="comUrl" :value="comtags.comurl"/>
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
							<ul class="reset stageshow" :style="{'display':editstageshow?'none':'block'}">
	                    		<li>目前阶段：<span class="c5">{{comstage.currentstage}}</span></li>
	                    	</ul>
	                    	<form class="dn" id="stageform" :style="{'display':editstageshow?'block':'none'}">
	                    		<div class="stageSelect" @mouseleave="currentstagelistshow = false">
	                    			<label>目前阶段</label>
	                    			<input type="hidden" :value="comstage.currentstage" id="financeStage" name="financeStage">
		                         	<input type="button" :value="comstage.currentstage" id="select_fin" class="select_tags_short fl" @click="currentstagelistshow = true">
		                            <div class="selectBoxShort dn" id="box_fin" :style="{'display':currentstagelistshow?'block':'none'}">
		                                 <ul class="reset">
		                                 	<li v-for="(item,index) in stagelist" :class="index==stagecurrent?'current':''" :key="index" @click="choosestage(index)">
		                                 		{{item}}
		                                 	</li>
		                                 	<!--<li>未融资</li>
					                        <li class="current">天使轮</li>
					                        <li>A轮</li>
					                        <li>B轮</li>
					                        <li>C轮</li>
					                        <li>D轮及以上</li>
					                        <li>上市公司</li>-->
					                    </ul>
		                            </div>	
	                    		</div>	
		                    	<ul id="stagesList" class="reset">
			                    	<li>
			                    		<!--<label>融资阶段</label>
			                    		<input type="hidden" class="select_invest_hidden" name="select_invest_hidden">
					                    <input type="button" value="融资阶段" class="select_tags_short select_invest">
					                    <div class="selectBoxShort dn" style="display: none;">
						                    <ul class="reset">
						                        <li>A轮</li>
							                    <li>B轮</li>
							                    <li>C轮</li>
							                    <li>D轮及以上</li>
							                    <li>上市公司</li>
							                </ul>
					                    </div>-->
					                    <label>投资机构</label>
					                    <input type="text" ref="org" placeholder="如真格基金" name="stageorg" :value="comstage.org">
			                    	</li>
			                    </ul>
			                    <input type="button" value="保存" @click="savestage" class="btn_small">
			                    <a id="cancelStages" class="btn_cancel_s" @click.prevent="editstageshow = false" href="javascript:void(0)">取消</a>
			                    <div class="clear"></div>
			                    <!--<div class="dn" id="cloneInvest">
			                    	<label>融资阶段</label>
		                    		<input type="hidden" class="select_invest_hidden" name="select_invest_hidden">
				                    <input type="button" value="发展阶段" class="select_tags_short select_invest">
				                    <div class="selectBoxShort dn" style="display: none;">
				                        <ul class="reset">
				                        	<li>天使轮</li>
					                        <li>A轮</li>
					                        <li>B轮</li>
					                        <li>C轮</li>
					                        <li>D轮及以上</li>
					                        <li>上市公司</li>
					                    </ul>
				                    </div>
				                    <label>投资机构</label>
				                    <input type="text" placeholder="如真格基金" name="stageorg">
			                    </div>-->
			                </form>
						</dd>
					</dl>
					
					<div id="Member">
						<dl class="c_section c_member">
							<dt>
								<h2>
									<em></em>
									创始团队
								</h2>
								<!--<a title="添加创始人" class="c_add" to=""></a>-->
							</dt>
							<dd>
								<div class="member_wrap">
									<!--无创始人-->
									<div class="member_info addnew_right" v-if="!hasmember">
										展示公司领导团体，<br>提升诱人指数<br>
										<a class="member_edit" @click.prevent="addcommember">+添加成员</a>
									</div>
									
									<!--添加创始人-->
									<div class="member_info newMember" v-show="addmembershow">
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
					                        <!--<input type="text" placeholder="请输入创始人新浪微博地址" value="http://weimob.weibo.com" name="weibo">-->	
					                        <textarea placeholder="请输入创始人个人简介" maxlength="500" class="s_textarea" name="remark" value="" ref="newmemberintro"></textarea>	
					                        <div class="word_count fr">简介不超过 <span>500</span> 字</div>
					                        <div class="clear"></div>
					                        <input type="button" value="保存" class="btn_small" @click="savenewmember">
				                            <!--<a class="btn_cancel_s member_delete" href="javascript:void(0)">删除</a>-->
				                            <a class="btn_cancel_s member_delete" @click.prevent="canceladdnewmember">取消</a>
				                        	<input type="hidden" value="11493" class="leader_id">
										</form>
									</div>
									
									<!--编辑创始人-->
									<div class="member_info newMember" v-show="editmembershow">
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
					                        <!--<input type="text" placeholder="请输入创始人新浪微博地址" value="http://weimob.weibo.com" name="weibo">-->	
					                        <textarea placeholder="请输入创始人个人简介" maxlength="500" class="s_textarea" name="remark" v-model="commember.intro">{{commember.intro}}</textarea>	
					                        <div class="word_count fr">简介不超过 <span>500</span> 字</div>
					                        <div class="clear"></div>
					                        <input type="button" value="保存" class="btn_small" @click="editmembershow = false">
				                            <!--<a class="btn_cancel_s member_delete" href="javascript:void(0)">删除</a>-->
				                            <a class="btn_cancel_s member_delete" @click.prevent="deletemember">删除</a>
				                        	<input type="hidden" value="11493" class="leader_id">
										</form>
									</div>
									
									<!--显示创始人-->
									<div class="member_info" v-if="hasmember" v-show="!editmembershow&!addmembershow">
										<!--<a title="编辑创始人" class="c_edit member_edit" href="javascript:void(0)"></a>-->
										<a title="编辑创始人" class="c_edit member_edit" @click.prevent="editmembershow = true"></a>
				                        <div class="m_portrait">
				                            <div></div>
				                            <img width="120" height="120" :alt="commember.name" :src="commember.img">
					                    </div>
				                        <div class="m_name">
				                        	{{commember.name}}
				                        </div>
				                        <div class="m_position">{{commember.post}}</div>
				                    	<div class="m_intro">{{commember.intro}}</div>
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
	                   			<a v-show="comrepolist.length!=0&&!addreposhow" title="添加报道" class="c_add" @click.prevent="addreposhow = true"></a>
			                </dt>
		                	<dd>
			                	<!-- 编辑报道 -->
	                       		<ul class="reset">
	                       			<li v-for="(item,index) in comrepolist" :key="index">
	                       				<a :style="{'display':editreposhow&&index==repocurrent?'none':''}" class="article" :title="item.repotitle" target="_blank" :href="item.repolink">{{item.repotitle}}</a>
			                			<a title="编辑报道" class="c_edit dn" @click.prevent="editrepo(index)" :style="{'display':editreposhow?'none':'inline'}"></a>
			                			<form class="reportForm" v-show="index==repocurrent&&editreposhow">
			                				<input type="text" placeholder="请输入文章标题" v-model="item.repotitle" name="articleTitle" class="valid">
			                				<input type="text" placeholder="请输入文章链接" v-model="item.repolink" name="articleUrl" class="valid"><span for="articleUrl" generated="true" class="error" style="display: none;">请输入有效的文章链接</span>
			                				<input type="button" value="保存" class="btn_small" @click="editreposhow=false">
				                            <a class="btn_cancel_s report_delete" @click.prevent="deleterepo(index)">删除</a>
				                            <!--<input type="hidden" value="5235" class="article_id">-->
				                     	</form>
	                       			</li>
	                       			<!--<li>
			                			<a style="" class="article" title="随便写" target="_blank" href="http://www.baidu.com">随便写</a>
			                			<a title="编辑报道" class="c_edit dn" href="javascript:;" style="display: inline;"></a>
			                			<form class="reportForm dn">
			                				<input type="text" placeholder="请输入文章标题" value="" name="articleTitle" class="valid">
			                				<input type="text" placeholder="请输入文章链接" value="" name="articleUrl" class="valid"><span for="articleUrl" generated="true" class="error" style="display: none;">请输入有效的文章链接</span>
			                				<input type="submit" value="保存" class="btn_small">
				                            <a class="btn_cancel_s report_delete" href="javascript:;">删除</a>
				                            <input type="hidden" value="5235" class="article_id">
				                     	</form>
			                		</li>
			                		<li>
			                			<a style="" class="article" title="随便写" target="_blank" href="http://www.baidu.com">随便写</a>
			                			<a title="编辑报道" class="c_edit dn" href="javascript:;" style="display: inline;"></a>
			                			<form class="reportForm dn">
			                				<input type="text" placeholder="请输入文章标题" value="" name="articleTitle" class="valid">
			                				<input type="text" placeholder="请输入文章链接" value="" name="articleUrl" class="valid">
			                				<input type="submit" value="保存" class="btn_small">
				                            <a class="btn_cancel_s report_delete" href="javascript:;">删除</a>
				                            <input type="hidden" value="5236" class="article_id">
				                     	</form>
			                		</li>-->
	                       		</ul>
		                	
			                	<!-- 无报道 -->
		                        <div class="addnew_right reported_info" v-show="comrepolist.length==0&&!addreposhow">
		                        	展示外界对公司的深度报道，<br>便于求职者了解公司！<br>
		                            <a class="report_edit" @click.prevent="addreposhow = true">+添加报道</a>
		                        </div>
	                        
	                        	<!--添加新的报道-->
			                	<ul class="newReport" v-show="addreposhow">
		                        	<li>
			                			<!--<a style="display:none;" class="article" title="" target="_blank" ></a>-->
			                			<!--<a title="编辑报道" class="c_edit dn" href="javascript:;"></a>-->
			                			<form class="reportForm">
			                				<input type="text" placeholder="请输入文章标题" ref="newtitle" value="" name="articleTitle">
			                				<input type="text" placeholder="请输入文章链接" ref="newlink" value="" name="articleUrl">
			                				<input type="button" value="保存" class="btn_small" @click="savenewrepo">
				                            <a class="btn_cancel_s report_cancel" @click.prevent="canceladdnewrepo">取消</a>
				                            <input type="hidden" value="" class="article_id">
				                     	</form>
			                		</li>
		                        </ul>
				        	</dd>
		            	</dl><!-- end .c_reported -->
					</div>
				</div>
			</div>
			
			<!--弹窗-->
			<!--<div style="display: none;">
				<div style="width:650px;height:470px;" class="popup" id="logoUploader">
					<object width="650" height="470" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID">
						<param value="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" name="movie">
						<param value="high" name="quality">
					    <param value="opaque" name="wmode">
						<param value="111.0.0.0" name="swfversion">
						<param value="../../Scripts/expressInstall.swf" name="expressinstall">
						<object width="650" height="470" data="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" type="application/x-shockwave-flash">
						    <param value="high" name="quality">
						    <param value="opaque" name="wmode">
						    <param value="111.0.0.0" name="swfversion">
						    <param value="../../Scripts/expressInstall.swf" name="expressinstall">
					    	<div>
					      	<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
					      	<p><a href="http://www.adobe.com/go/getflashplayer"><img width="112" height="33" src="style/images/get_flash_player.gif" alt="获取 Adobe Flash Player"></a></p>
					    	</div>
				  		</object>
					</object>
				</div>
			</div>-->
			<!--弹窗end-->
			
			<div class="clear"></div>
			<input type="hidden" value="d1035b6caa514d869727cff29a1c2e0c" id="resubmitToken"/>
			<a title="回到顶部" id="backtop" style="display: inline;" @click="toTop"></a>
		</div>
	</div>
	<div id="footer">
		<div class="wrapper">
			<!--<router-link to="" target="_blank">联系我们</router-link>-->
			<!--<router-link to=""></router-link>-->
		</div>
	</div>
	</div>
</template>

<script>
	import Product from './product/Product'
	export default{
		name:'myCompany',
		components:{
			Product
		},
		mounted(){
			this.isMounted = true
		},
		data(){
			return{
				isMounted:null,
				vashow:false,
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
				hasmember:false,
				editstageshow:false,
				editmembershow:false,
				comdetail:{
					fullname:'公司全名',
					shortname:'公司简称',
					feature:'公司特征',
					labels:['年终分红','五险一金','弹性工作','岗位晋升'],
					img:'../../../static/images/logo_default.png'
				},
				comtags:{
					city:'上海',
					field:'移动互联网',
					scale:'150-500人',
					comurl:'http://www.baidu.com'
				},
				comstage:{
					currentstage:'天使轮',
					org:null
				},
				commember:{
					name:null,
					img:'../../../static/images/leader_default.png',
					post:null,
					intro:null,
				},
				newmemberimg:'../../../static/images/leader_default.png',
				comrepolist:[
					{
						repotitle:'随便写1',
						repolink:'http://www.baidu.com'
					},
					{
						repotitle:'随便写2',
						repolink:'http://www.alibaba.com'
					}
				],
				newrepo:{
					repotitle:null,
					repolink:null
				},
				scalelist:['少于15人','15-50人','50-150人','150-500人','500-2000人','2000人以上'],
				stagelist:['未融资','天使轮','A轮','B轮','C轮','D轮及以上','上市公司'],
				scalecurrent:null,
				stagecurrent:null,
				repocurrent:null,
				labelcurrent:null,
				products:[],
				comintro:'',
				comintrotmp:'',
				newlabel:''
			}
		},
		methods:{
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
				/*console.log(this.products)
				console.log(this.products.length)*/
			},
			vaout(){
				this.vashow=false
			},
			addproduct(){
				this.products.push({})
			},
			/*editproduct(){
				this.products.push({})
				this.editproshow = true
			},*/
			handleItemDelete(index){
				let confirmmsg = confirm("确认删除该公司产品信息？")
				if(confirmmsg){
					this.products.splice(index,1)
				}
				else{}
			},
			editIntro(){
				this.comintrotmp = this.comintro
				this.editintroshow = true
			},
			addIntro(){
				this.editintroshow = true
				this.hasIntro = true
			},
			saveintro(){
//				console.log(this.comintro)
//				console.log(this.$refs.comintro.value.length)
				this.editintroshow = false
				this.comintro = this.comintrotmp
//				console.log(this.isMounted)
//				console.log(this.comintro)
			},
			cancelintro(){
				this.hasIntro = false
				this.editintroshow = false
			},
			editdetail(){
				this.editdetailshow = true
			},
			savedetail(){
				this.editdetailshow = false
				this.comdetail.shortname = this.$refs.editshortname.value
				this.comdetail.feature = this.$refs.editfeature.value
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
				this.comtags.scale = this.scalelist[index]
			},
			entercollapsible(){
				this.collapsibleshow = true
			},
			leavecollapsible(){
				this.collapsibleshow = false
			},
			savetags(){
				this.edittagshow = false
			},
			editlabelshow(){
				this.editlabel = true
			},
			savelabel(){
				this.editlabel = false
				this.$refs.newlabel.value=""
			},
			cancellabel(){
				this.editlabel = false
				this.$refs.newlabel.value=""
			},
			pastelabel(){
				if(this.$refs.newlabel.value != null && this.$refs.newlabel.value != ''){
					this.comdetail.labels.push(this.$refs.newlabel.value)
					this.$refs.newlabel.value = null
				}
				else{
					alert("请输入标签内容！")
				}
			},
			deletelabel(index){
				let confirmmsg = confirm("确认删除标签？")
				if(confirmmsg == true){
					this.comdetail.labels.splice(index,1)
				}
				else{}
			},
			editstage(){
				this.editstageshow = true
			},
			choosestage(index){
				this.stagecurrent = index
				this.comstage.currentstage = this.stagelist[index]
			},
			savestage(){
				this.comstage.org = this.$refs.org.value
				this.editstageshow = false
			},
			deletemember(){
				let confirmmsg = confirm("确认删除该创始人资料？")
				if(confirmmsg){
					this.commember = {
						name:null,
						img:'../../../static/images/leader_default.png',
						post:null,
						intro:null,
					}
					this.hasmember=false
					this.editmembershow=false
				}
				else{
				}
			},
			addcommember(){
				this.hasmember = true
				this.addmembershow = true
//				this.editmembershow = false
			},
			getmemberimg(e){
				let _this = this
				var files = e.target.files[0]
				if(!e || !window.FileReader) return
				let reader = new FileReader()
				reader.readAsDataURL(files)//这里是关键一步，转换就在这里
				reader.onloadend = function(){
					_this.commember.img = this.result
				}
			},
			getcomimg(e){
				let _this = this
				var files = e.target.files[0]
				if(!e || !window.FileReader) return
				let reader = new FileReader()
				reader.readAsDataURL(files)//这里是关键一步，转换就在这里
				reader.onloadend = function(){
					_this.comdetail.img = this.result
				}
			},
			addrepo(){
				this.comrepolist.push()
			},
			editrepo(index){
				this.repocurrent = index
				this.editreposhow = true
			},
			deleterepo(index){
				let confirmmsg = confirm("确认删除此条报道？")
				if(confirmmsg){
					this.comrepolist.splice(index,1)
					this.editreposhow = false
				}
			},
			savenewrepo(){
				let repo = {repotitle:'',repolink:''} 
				repo.repotitle = this.$refs.newtitle.value
				repo.repolink = this.$refs.newlink.value
				this.comrepolist.push(repo)
				this.addreposhow = false
				this.$refs.newtitle.value = ""
				this.$refs.newlink.value = ""
			},
			savenewmember(){
				this.commember.name = this.$refs.newmembername.value
				this.commember.post = this.$refs.newmemberpost.value
				this.commember.intro = this.$refs.newmemberintro.value
				this.commember.img = this.newmemberimg
				this.newmemberimg = '../../../static/images/leader_default.png'
				this.addmembershow = false
			},
			canceladdnewmember(){
				this.hasmember=false
				this.addmembershow=false
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
				this.$refs.newtitle.value = ""
				this.$refs.newlink.value = ""
			},
			toTop(){
				body.scrollIntoView({behavior:'smooth'})
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
		watch:{
			comintro(){
				if(this.comintro === ''){
					this.hasIntro = false
				}
			},
			commember(){
				if(this.commember == null){
					this.hasmember = false
				}
			},
			/*comrepolist(){
				if(this.comrepolist.length == 0){
					return true
				}
			}*/
		},
		computed:{
			/*restcomintrolength(){
				return 1000 - intro.length
			}*/
		}
	}
</script>

<style>
</style>