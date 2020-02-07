<template>
	<div>
		<div id="body">
			<div id="header">
				<div class="wrapper">
					<router-link class="logo" to="/">
						<img width="229" @mouseover="showgender" height="60" alt="全国招聘第一站" src="../../../build/logo.png"/>
					</router-link>
					<ul id="navheader" class="reset">
						<li>
							<router-link to="/home">首页</router-link>
						</li>
						<li>
							<router-link to="/mycompany">公司</router-link>
						</li>
						<li>
							<router-link to="/forumHome" target="_blank">论坛</router-link>
						</li>
						<li class="current">
							<router-link to="/resumeHome">我的简历</router-link>
						</li>
						<!--<li>
							<router-link to="/postHome">发布职位</router-link>
						</li>-->
					</ul>
					<dl class="collapsible_menu" style="width: 165px;" :class="collapsibleshow?'expend':''" @mouseenter="entercollapsible" @mouseleave="leavecollapsible">
						<dt>
							<span>person&nbsp;</span>
							<span class="red dn" id="noticeDot-1"></span>
							<i></i>
						</dt>
						<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我的简历</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我的收藏</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}" class="btm"><router-link to="">我的订阅</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我要招人</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">账号设置</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}" class="logout"><router-link to="">退出</router-link></dd>
					</dl>
					<div class="dn" id="noticeTip">
		            	<span class="bot"></span>
						<span class="top"></span>
						<a target="_blank" href="delivery.html"><strong>0</strong>条新投递反馈</a>
						<a class="closeNT" href="javascript:;"></a>
	            	</div>
				</div>
			</div>
			<div id="container">       
	  			<div class="clearfix">
	            	<div class="content_l">
		            	<div class="fl" id="resume_name">
			            	<div class="nameShow fl" :class="[renameshow?'dn':'']">
			            		<h1 :title="resume.name">{{resume.name}}</h1>
			            		<span class="rename" @click="rename">重命名</span> | <a target="_blank" href="h/resume/preview.html">预览</a>
		            		</div>
		            		<form class="fl" :class="[renameshow?'':'dn']" id="resumeNameForm">
		            			<input type="text" ref="newresumename" :value="resume.name" name="resumeName" class="nameEdit c9">	
		            			<input type="button" value="保存" @click="saveresumename"> |
		            			<input type="button" value="取消" @click="cancelrename"/>
		            			<!--<a target="_blank" href="h/resume/preview.html">预览</a>-->
		            		</form>
		            	</div><!--end #resume_name-->
		            	<!--<div class="fr c5" id="lastChangedTime">最后一次更新：<span>2014-07-01 15:14 </span></div><!--end #lastChangedTime-->
		            	<div id="resumeScore">
		            		<div class="score fl">
		            			<!--<canvas height="120" width="120" id="doughnutChartCanvas" style="width: 120px; height: 120px;"></canvas>-->
		            			<ve-ring :data="chartdata" :settings="chartsettings" width="120px" height="120px" :tooltip='tooltip' :extend='chartextend' style="margin-left: 49px;margin-top: 19px;"></ve-ring><!--style="margin-left: 49px;margin-top: 19px;"-->
		           				<div class="scoreVal"><span>{{chartdata.rows[0].precent}}</span>分</div>
		            		</div>
		            		<div class="which fl">
		            			<div>工作经历最能体现自己的工作能力，且完善后才可投递简历哦！</div>
		            			<span rel="workExperience" @click="toworkexperience"><a>马上去完善</a></span>
		            			<!--<button value="自增" @click="addcount">自增</button>-->
							</div>
		            	</div><!--end #resumeScore-->
		
		            	<div class="profile_box" id="basicInfo">
		            		<h2>基本信息</h2>
		            		<span class="c_edit" v-show="!editbasicshow" @click="editbasicinfo"></span>
		            		<div class="basicShow" v-show="!editbasicshow" style="height: 100px;">
		            			<span>
			            			{{resume.basicinfo.username}}&nbsp;&nbsp;|&nbsp;&nbsp;{{resume.basicinfo.degree}}&nbsp;&nbsp;|&nbsp;&nbsp;{{resume.basicinfo.workyear}}工作经验<br>
			            			{{resume.basicinfo.tel}}&nbsp;&nbsp;|&nbsp;&nbsp;{{resume.basicinfo.email}}<br>
			            			{{resume.basicinfo.currentstate}}
		            			</span>
		            			<div class="m_portrait">
			                    	<div></div>
			                    	<img width="120" height="120" alt="jason" :src="resume.basicinfo.img">
			                    </div>
		            		</div><!--end .basicShow-->
		
		            		<div class="basicEdit" v-show="editbasicshow">
		            			<form id="profileForm">
								  	<table>
								    	<tbody>
								    		<tr>
								      			<td valign="top">
								        			<span class="redstar">*</span>
								      			</td> 
								      			<td>
								        			<input type="text" placeholder="姓名" v-model="basicinfotmp.username" name="name" id="name">
								      			</td>
								      			<td valign="top"></td> 
								      			<td>
								          			<ul class="profile_radio clearfix reset">
								            			<li :class="[basicinfotmp.gender=='男'?'current':'']">
								           	  				男<em></em>
								              				<input type="radio" name="gender" value="男"  v-model="basicinfotmp.gender"><!--@click="gendertmp='男'"--> 
								            			</li>
											            <li :class="[basicinfotmp.gender=='女'?'current':'']">
											            	女<em></em>
											              	<input type="radio" name="gender" value="女"  v-model="basicinfotmp.gender"><!--@click="gendertmp='女'"--> 
											            </li>
								          			</ul>  
								      			</td>
								    		</tr>
								    		<tr>
											    <td valign="top">
											      	<span class="redstar">*</span>
											    </td> 
								     			<td @mouseleave="degreelistshow=false">
											      	<!--<input type="hidden" id="topDegree" value="大专" name="topDegree">-->
											        <input type="button" :value="basicinfotmp.degree" @click="degreelistshow=true" :class="[degreelistshow?'select_focus':'']" id="select_topDegree" class="profile_select_190 profile_select_normal">
													<div class="boxUpDown boxUpDown_190" id="box_topDegree" :style="{'display':degreelistshow?'block':'none'}" style="width: 190px;">
											        	<ul>
											        		<li v-for="(item,index) in degreelist" :key='index' @click="pickdegree(item)">
											        			{{item}}
											        		</li>
											        		<!--<li>大专</li>
											        		<li>本科</li>
											        		<li>硕士</li>
											        		<li>博士</li>
											        		<li>其他</li>-->
											        	</ul>
								        			</div>  
								      			</td>
								      			<td valign="top">
								        			<span class="redstar">*</span>
								      			</td> 
											    <td @mouseleave="workyearlistshow=false">
											        <!--<input type="hidden" id="workyear" value="" name="workyear">-->
											        <input type="button" :value="basicinfotmp.workyear" id="select_workyear" @click="workyearlistshow=true" :class="[workyearlistshow?'select_focus':'']" class="profile_select_190 profile_select_normal">
													<div class="boxUpDown boxUpDown_190" id="box_workyear" style="width: 190px;" :style="{'display':workyearlistshow?'block':'none'}">
											          	<ul>
											          		<li v-for="(item,index) in workyearlist" :key='index' @click="pickworkyear(item)">
											          			{{item}}
											          		</li>
											        		<!--<li>应届毕业生</li>
											        		<li>1年</li>
											        		<li>2年</li>
											        		<li>3年</li>
											        		<li>4年</li>
											        		<li>5年</li>
											        		<li>6年</li>
											        		<li>7年</li>
											        		<li>8年</li>
											        		<li>9年</li>
											        		<li>10年</li>
											        		<li>10年以上</li>-->
								        				</ul>
								          			</div>  
								      			</td>
								    		</tr>
								    		<tr>
										      	<td valign="top">
										        	<span class="redstar">*</span>
										      	</td> 
								      			<td colspan="3">
								          			<input type="text" placeholder="手机号码" v-model="basicinfotmp.tel" style="width: 410px;" name="tel" id="tel">
								      			</td>
								   			</tr>
								   			<tr>
								      			<td valign="top">
								        			<span class="redstar">*</span>
								      			</td> 
								      			<td colspan="3">
								          			<input type="text" placeholder="接收面试通知的邮箱" v-model="basicinfotmp.email" style="width: 410px;" name="email" id="email">
								      			</td>
								    		</tr>
								    		<tr>
								      			<td valign="top"> </td> 
								      			<td colspan="3" @mouseleave="currentstatelistshow=false">
								          			<!--<input type="hidden" id="currentState" value="" name="currentState">-->
								          			<input type="button" @click="currentstatelistshow=true" :value="basicinfotmp.currentstate" id="select_currentState" class="profile_select_410 profile_select_normal" :class="[currentstatelistshow?'select_focus':'']">
										  			<div class="boxUpDown boxUpDown_410" id="box_currentState" style="width: 410px;" :style="{'display':currentstatelistshow?'block':'none'}">
											          	<ul>
											          		<li v-for="(item,index) in currentstatelist" :key='index' @click="pickcurrentstate(item)">
											          			{{item}}
											          		</li>
											        		<!--<li>我目前已离职，可快速到岗</li>
											        		<li>我目前正在职，正考虑换个新环境</li>
											        		<li>我暂时不想找工作</li>
											        		<li>我是应届毕业生</li>-->
											        	</ul>
								          			</div>  
								      			</td>
								    		</tr>
								    		<tr>
								      			<td></td> 
								      			<td colspan="3">
								          			<input type="submit" value="保 存" class="btn_profile_save" @click.prevent="savebasic">
								          			<a class="btn_profile_cancel" @click.prevent="canceleditbasic">取 消</a>
								      			</td>
								    		</tr>
								  		</tbody>
								  	</table>
								</form><!--end #profileForm-->
								<div class="new_portrait">
								  	<div class="portrait_upload dn" id="portraitNo">
								      	<span>上传自己的头像</span>
								  	</div>
								  	<div class="portraitShow " id="portraitShow">
								    	<img width="120" height="120" :src="basicinfotmp.img">
								    	<span>更换头像</span>
								  	</div>
								  	<input type="file" title="支持jpg、jpeg、gif、png格式，文件小于5M" @change="getresumeimg" name="headPic" id="headPic" class="myfiles">
									<!-- <input type="hidden" id="headPicHidden" /> -->
								  	<em>
								                  尺寸：120*120px <br>   
								                  大小：小于5M
								  	</em>
								  	<span style="display:none;" id="headPic_error" class="error"></span>
								</div><!--end .new_portrait-->
		            		</div><!--end .basicEdit-->
		            		<!--<input type="hidden" id="nameVal" value="jason">
		            		<input type="hidden" id="genderVal" value="男">
		            		<input type="hidden" id="topDegreeVal" value="大专">
		            		<input type="hidden" id="workyearVal" value="3年">
		            		<input type="hidden" id="currentStateVal" value="">
		            		<input type="hidden" id="emailVal" value="jason@qq.com">
		            		<input type="hidden" id="telVal" value="18644444444">
		            		<input type="hidden" id="pageType" value="1">--> 
		            	</div><!--end #basicInfo-->
		
		            	<div class="profile_box" id="expectJob">
		            		<h2>期望工作</h2>
		            		<span class="c_edit" @click="editexpectjob" v-show="resume.expectjob!=null" :class="[editexpectjobshow?'dn':'']"></span>
		            		<div class="expectShow" :class="[editexpectjobshow?'dn':'']" v-if="resume.expectjob!=null">
		            		    <span>
		            		    	{{resume.expectjob.post}}&nbsp;&nbsp;|&nbsp;&nbsp;{{resume.expectjob.salary}}<br>
		            		    	{{resume.expectjob.city}}&nbsp;&nbsp;|&nbsp;&nbsp;{{resume.expectjob.type}}<br>
		            		    </span>
		            		</div><!--end .expectShow-->
		            		<div class="expectEdit" :class="[editexpectjobshow?'':'dn']" v-if="expectjobtmp!=null">
		            			<form id="expectForm" onsubmit="saveexpectjob()">
			            			<table>
			            				<tbody>
			            					<tr>
			            						<td @mouseleave="cityboxshow=false">
			            							<!--<input type="hidden" id="expectCity" value="" name="expectCity">-->
			            							<input type="text" :value="expectjobtmp.city" placeholder="期望城市，如：北京" readonly="readonly" id="select_expectCity" class="profile_select_287 profile_select_normal" @click="cityboxshow=true">
													<div class="boxUpDown boxUpDown_596" id="box_expectCity" :style="{'display':cityboxshow?'block':'none'}">
										          		<dl>
										        			<dt>热门城市</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.hotcities" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        			<!--<span>北京</span>
											        			<span>上海</span>
											        			<span>广州</span>
											        			<span>深圳</span>
											        			<span>成都</span>
											        			<span>杭州</span>-->
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>ABCDEF</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list1" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        			<!--<span>北京</span>
											        			<span>长春</span>
											        			<span>成都</span>
											        			<span>重庆</span>
											        			<span>长沙</span>
											        			<span>常州</span>
											        			<span>东莞</span>
											        			<span>大连</span>
											        			<span>佛山</span>
											        			<span>福州</span>-->
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>GHIJ</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list2" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        			<!--<span>贵阳</span>
											        			<span>广州</span>
											        			<span>哈尔滨</span>
											        			<span>合肥</span>
											        			<span>海口</span>
											        			<span>杭州</span>
											        			<span>惠州</span>
											        			<span>金华</span>
											        			<span>济南</span>
											        			<span>嘉兴</span>-->
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>KLMN</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list3" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        			<!--<span>昆明</span>
											        			<span>廊坊</span>
											        			<span>宁波</span>
											        			<span>南昌</span>
											        			<span>南京</span>
											        			<span>南宁</span>
											        			<span>南通</span>-->
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>OPQR</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list4" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        			<!--<span>青岛</span>
											        			<span>泉州</span>-->
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>STUV</dt>
										        			<dd><span v-for="(item,index) in citylist.list5" :key='index' @click="pickcity(item)">
										        				{{item}}
										        			</span>
											        			<!--<span>上海</span>
											        			<span>石家庄</span>
											        			<span>绍兴</span>
											        			<span>沈阳</span>
											        			<span>深圳</span>
											        			<span>苏州</span>
											        			<span>天津</span>
											        			<span>太原</span>
											        			<span>台州</span>-->
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>WXYZ</dt>
										        			<dd><span v-for="(item,index) in citylist.list6" :key='index' @click="pickcity(item)">
										        				{{item}}
										        			</span>
											        			<!--<span>武汉</span>
											        			<span>无锡</span>
											        			<span>温州</span>
											        			<span>西安</span>
											        			<span>厦门</span>
											        			<span>烟台</span>
											        			<span>珠海</span>
											        			<span>中山</span>
											        			<span>郑州</span>-->
											        		</dd>
										        	  	</dl>
										        	</div>  
			            						</td>
			            						<td>
			            							<ul class="profile_radio clearfix reset">
			            								<li v-for="(item,index) in jobtypelist" :class="[item==expectjobtmp.type?'current':'']" :key='index' @click="expectjobtmp.type=item">
			            									{{item}}<em></em>
			            									<input type="radio" name="type" :value="item"/>
			            								</li>
			            								<!--<li class="current">
											             	 全职<em></em>
											              	<input type="radio" checked="" name="type" value="全职"> 
											            </li>
											            <li>
											              	兼职<em></em>
											              	<input type="radio" name="type" value="兼职"> 
											            </li>
											            <li>
											            	  实习<em></em>
											              	<input type="radio" name="type" value="实习"> 
											            </li>-->
										            </ul> 
			            						</td>
			            					</tr>
			            					<tr>
				            					<td>
										        	<input type="text" placeholder="期望职位，如：产品经理" v-model="expectjobtmp.post" name="expectPosition" id="expectPosition">
												</td>
				            					<td @mouseleave="salaryboxshow=false">
				            						<!--<input type="hidden" id="expectSalary" value="" name="expectSalary">-->
				            						<input type="text" readonly="readonly" placeholder="期望月薪" :value="expectjobtmp.salary" id="select_expectSalary" class="profile_select_287 profile_select_normal" @click="salaryboxshow=true">
				            						<div class="boxUpDown boxUpDown_287" id="box_expectSalary" :style="{'display':salaryboxshow?'block':'none'}" style="width: 287px;">
											          	<ul>
											          		<li v-for="(item,index) in salarylist" :key='index' @click="picksalary(item)">
											          			{{item}}
											          		</li>
											        		<!--<li>2k以下</li>
											        		<li>2k-5k</li>
											        		<li>5k-10k</li>
											        		<li>10k-15k</li>
											        		<li>15k-25k</li>
											        		<li>25k-50k</li>
											        		<li>50k以上</li>-->
											        	</ul>
											        </div>  
				            					</td>
			            					</tr>
				            				<tr>
				            					<td colspan="2">
													<input type="submit" value="保 存" class="btn_profile_save" @click.prevent="saveexpectjob">
									          		<a class="btn_profile_cancel" href="javascript:;" @click.prevent="canceleditexpectjob">取 消</a>
				            					</td>
				            				</tr>
			            				</tbody>
			            			</table>
		            			</form><!--end #expectForm-->
		            		</div><!--end .expectEdit-->
		            		<div class="expectAdd pAdd" v-show="resume.expectjob==null&&!editexpectjobshow"  @click="addexpectjob"><!--v-show="!hasexpectjob&&!editexpectjobshow"-->
		            			填写准确的期望工作能大大提高求职成功率哦…<br>
								快来添加期望工作吧！
								<span>添加期望工作</span>
		            		</div><!--end .expectAdd-->
		            		<!--<button @click="resume.expectjob=null">置空</button>-->
		            		
		            		<!--<input type="hidden" id="expectJobVal" value="">
		            		<input type="hidden" id="expectCityVal" value="">
		            		<input type="hidden" id="typeVal" value="">
		            		<input type="hidden" id="expectPositionVal" value="">
		            		<input type="hidden" id="expectSalaryVal" value="">-->
		            	</div><!--end #expectJob-->
		            	
		            	<div class="profile_box" id="workExperience">
		            		<h2>
		            			工作经历  
		            			<!--<span>
		            	 			（投递简历时必填）
		            			</span>-->
		            		</h2>
		            		<span class="c_add" @click="addexperience" title="添加工作经历" v-show="resume.experiencelist.length!=0&&!addexperienceshow&&!editexperienceshow"></span> <!--:class="[editexperienceshow?'dn':'']"-->
		            		<div class="experienceShow" v-if="resume.experiencelist.length!=0"><!--:class="[editexperienceshow?'dn':'']"-->
		            		    <!--<form class="experienceForm borderBtm dn">
			            			<table>
			            				<tbody><tr>
									      	<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
									      	<td>
									        	<input type="text" placeholder="公司名称" name="companyName" class="companyName">
									      	</td>
									      	<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
									      	<td>
									          	<input type="text" placeholder="职位名称，如：产品经理" name="positionName" class="positionName">
									      	</td>
									    </tr>
			            				<tr>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
			            					<td>
				            					<div class="fl">
				            						<input type="hidden" class="companyYearStart" value="" name="companyYearStart">
										        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart">
													<div class="box_companyYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
											            <ul>
											        											        			<li>2014</li>
											        											        			<li>2013</li>
											        											        			<li>2012</li>
											        											        			<li>2011</li>
											        											        			<li>2010</li>
											        											        			<li>2009</li>
											        											        			<li>2008</li>
											        											        			<li>2007</li>
											        											        			<li>2006</li>
											        											        			<li>2005</li>
											        											        			<li>2004</li>
											        											        			<li>2003</li>
											        											        			<li>2002</li>
											        											        			<li>2001</li>
											        											        			<li>2000</li>
											        											        			<li>1999</li>
											        											        			<li>1998</li>
											        											        			<li>1997</li>
											        											        			<li>1996</li>
											        											        			<li>1995</li>
											        											        			<li>1994</li>
											        											        			<li>1993</li>
											        											        			<li>1992</li>
											        											        			<li>1991</li>
											        											        			<li>1990</li>
											        											        			<li>1989</li>
											        											        			<li>1988</li>
											        											        			<li>1987</li>
											        											        			<li>1986</li>
											        											        			<li>1985</li>
											        											        			<li>1984</li>
											        											        			<li>1983</li>
											        											        			<li>1982</li>
											        											        			<li>1981</li>
											        											        			<li>1980</li>
											        											        			<li>1979</li>
											        											        			<li>1978</li>
											        											        			<li>1977</li>
											        											        			<li>1976</li>
											        											        			<li>1975</li>
											        											        			<li>1974</li>
											        											        			<li>1973</li>
											        											        			<li>1972</li>
											        											        			<li>1971</li>
											        											        			<li>1970</li>
											        											        	</ul>
											        </div>
												</div>
												<div class="fl">
											        <input type="hidden" class="companyMonthStart" value="" name="companyMonthStart">
										        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_companyMonthStart">
													<div style="display: none;" class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
											            <ul>
											        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
											        	</ul>
											        </div>
											    </div>
											    <div class="clear"></div>
			            					</td>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
			            					<td>
				            					<div class="fl">
				            						<input type="hidden" class="companyYearEnd" value="" name="companyYearEnd">
										        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_companyYearEnd">
													<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
											            <ul>
											            	<li>至今</li>
											        											        			<li>2014</li>
											        											        			<li>2013</li>
											        											        			<li>2012</li>
											        											        			<li>2011</li>
											        											        			<li>2010</li>
											        											        			<li>2009</li>
											        											        			<li>2008</li>
											        											        			<li>2007</li>
											        											        			<li>2006</li>
											        											        			<li>2005</li>
											        											        			<li>2004</li>
											        											        			<li>2003</li>
											        											        			<li>2002</li>
											        											        			<li>2001</li>
											        											        			<li>2000</li>
											        											        			<li>1999</li>
											        											        			<li>1998</li>
											        											        			<li>1997</li>
											        											        			<li>1996</li>
											        											        			<li>1995</li>
											        											        			<li>1994</li>
											        											        			<li>1993</li>
											        											        			<li>1992</li>
											        											        			<li>1991</li>
											        											        			<li>1990</li>
											        											        			<li>1989</li>
											        											        			<li>1988</li>
											        											        			<li>1987</li>
											        											        			<li>1986</li>
											        											        			<li>1985</li>
											        											        			<li>1984</li>
											        											        			<li>1983</li>
											        											        			<li>1982</li>
											        											        			<li>1981</li>
											        											        			<li>1980</li>
											        											        			<li>1979</li>
											        											        			<li>1978</li>
											        											        			<li>1977</li>
											        											        			<li>1976</li>
											        											        			<li>1975</li>
											        											        			<li>1974</li>
											        											        			<li>1973</li>
											        											        			<li>1972</li>
											        											        			<li>1971</li>
											        											        			<li>1970</li>
											        											        	</ul>
											        </div>
												</div>
												<div class="fl">
											        <input type="hidden" class="companyMonthEnd" value="" name="companyMonthEnd">
										        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_companyMonthEnd">
													<div style="display: none;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
											            <ul>
											        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
											        	</ul>
											        </div>
										        </div>
										        <div class="clear"></div>
			            					</td>
			            				</tr>
			            				<tr>
			            					<td></td>
			            					<td colspan="3">
												<input type="submit" value="保 存" class="btn_profile_save">
								          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
			            					</td>
			            				</tr>
			            			</tbody></table>
			            			<input type="hidden" class="expId" value="">
		            			</form><!--end .experienceForm-->
		            			<ul class="wlist clearfix">
		            				<li v-for="(item,index) in resume.experiencelist" :key='index'>
		            					<a class="c_edit fr" v-show="(index!=currentexperience||!editexperienceshow)&&!addexperienceshow" @click="editexperience(index)"></a>
		            					<div v-show="!editexperienceshow||index!=currentexperience">
		            						<!--<h3>
		            							{{item.post}}&nbsp;&nbsp;|&nbsp;&nbsp;{{item.comname}}<br>
		            		    				{{item.startym}}&nbsp;&nbsp;至&nbsp;&nbsp;{{item.endym}}
		            		    			</h3>-->
		            		    			<h3>{{item.post}}</h3><h4>{{item.comname}}</h4>
		            		    			<h4>{{item.startym}}&nbsp;&nbsp;至&nbsp;&nbsp;{{item.endym}}</h4>
		            					</div>
		            					<form class="experienceForm" v-show="index==currentexperience&&editexperienceshow">
		            						编辑工作经历
					            			<table>
					            				<tbody>
						            				<tr>
												      	<td valign="top">
												        	<span class="redstar">*</span>
												      	</td> 
												      	<td>
												        	<input type="text" v-model="experiencetmp.comname" placeholder="公司名称" name="companyName" class="companyName">
												      	</td>
												      	<td valign="top">
												        	<span class="redstar">*</span>
												      	</td> 
												      	<td>
												          	<input type="text" v-model="experiencetmp.post" placeholder="职位名称，如：产品经理" name="positionName" class="positionName">
												      	</td>
												    </tr>
						            				<tr>
						            					<td valign="top">
												        	<span class="redstar">*</span>
												      	</td> 
						            					<td>
							            					<div class="fl">
							            						<!--<input type="hidden" class="companyYearStart" value="" name="companyYearStart">-->
													        	<!--<input type="text" v-model="experiencetmp.start.year" readonly="readonly" style="width: 139px;height: 46px;font-size: 15px;" placeholder="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart" :class="[startyearboxshow?'select_focus':'']" @click="startyearboxshow=true">-->
													        	<el-date-picker v-model="experiencetmp.startym" type="month" placeholder="开始年月" value-format="yyyy-MM"></el-date-picker>
																<!--<div class="box_companyYearStart boxUpDown boxUpDown_139 dn" :style="{'display':startyearboxshow?'block':'none'}" style="width: 139px;">
														            <ul>
														        		<li>2014</li>
														        		<li>2013</li>
														        		<li>2012</li>
														        		<li>2011</li>
														        		<li>2010</li>
														        		<li>2009</li>
														        		<li>2008</li>
														        		<li>2007</li>
														        		<li>2006</li>
														        		<li>2005</li>
														        		<li>2004</li>
														        		<li>2003</li>
														        		<li>2002</li>
														        		<li>2001</li>
														        		<li>2000</li>
														        		<li>1999</li>
														        		<li>1998</li>
														        		<li>1997</li>
														        		<li>1996</li>
														        		<li>1995</li>
														        		<li>1994</li>
														        		<li>1993</li>
														        		<li>1992</li>
														        		<li>1991</li>
														        		<li>1990</li>
														        		<li>1989</li>
														        		<li>1988</li>
														        		<li>1987</li>
														        		<li>1986</li>
														        		<li>1985</li>
														        		<li>1984</li>
														        		<li>1983</li>
														        		<li>1982</li>
														        		<li>1981</li>
														        		<li>1980</li>
														        		<li>1979</li>
														        		<li>1978</li>
														        		<li>1977</li>
														        		<li>1976</li>
														        		<li>1975</li>
														        		<li>1974</li>
														        		<li>1973</li>
														        		<li>1972</li>
														        		<li>1971</li>
														        		<li>1970</li>
														        	</ul>
														        </div>-->
															</div>
															<!--<div class="fl" @mouseleave="startmonthboxshow=false">
													        	<input type="text" v-model="experiencetmp.start.month" readonly="readonly" style="width: 139px;height: 46px;font-size: 15px;" placeholder="开始月份" class="profile_select_139 profile_select_normal select_companyYearStart" :class="[startmonthboxshow?'select_focus':'']" @click="startmonthboxshow=true">
																<div :style="{'display':startmonthboxshow?'block':'none'}" class="box_companyMonthStart boxUpDown boxUpDown_139 dn" style="width: 139px;">
														            <ul>
														        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
														        	</ul>
														        </div>
														    </div>-->
														    <div class="clear"></div>
						            					</td>
						            					<td valign="top">
												        	<span class="redstar">*</span>
												      	</td> 
						            					<td>
							            					<div class="fl">
							            						<el-date-picker v-model="experiencetmp.endym" type="month" placeholder="结束年月" value-format="yyyy-MM"></el-date-picker>
													        	<!--<input type="text" v-model="experiencetmp.end.year" readonly="readonly" style="width: 139px;height: 46px;font-size: 15px;" placeholder="结束年份" class="profile_select_139 profile_select_normal select_companyYearStart" :class="[endyearboxshow?'select_focus':'']" @click="endyearboxshow=true">
																<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn" :style="{'display':endyearboxshow?'block':'none'}" style="width: 139px;">
														            <ul>
														            	<li>至今</li>
														        		<li>2014</li>
														        		<li>2013</li>
														        		<li>2012</li>
														        		<li>2011</li>
														        		<li>2010</li>
														        		<li>2009</li>
														        		<li>2008</li>
														        		<li>2007</li>
														        		<li>2006</li>
														        		<li>2005</li>
														        		<li>2004</li>
														        		<li>2003</li>
														        		<li>2002</li>
														        		<li>2001</li>
														        		<li>2000</li>
														        		<li>1999</li>
														        		<li>1998</li>
														        		<li>1997</li>
														        		<li>1996</li>
														        		<li>1995</li>
														        		<li>1994</li>
														        		<li>1993</li>
														        		<li>1992</li>
														        		<li>1991</li>
														        		<li>1990</li>
														        		<li>1989</li>
														        		<li>1988</li>
														        		<li>1987</li>
														        		<li>1986</li>
														        		<li>1985</li>
														        		<li>1984</li>
														        		<li>1983</li>
														        		<li>1982</li>
														        		<li>1981</li>
														        		<li>1980</li>
														        		<li>1979</li>
														        		<li>1978</li>
														        		<li>1977</li>
														        		<li>1976</li>
														        		<li>1975</li>
														        		<li>1974</li>
														        		<li>1973</li>
														        		<li>1972</li>
														        		<li>1971</li>
														        		<li>1970</li>
														        	</ul>-->
														        <!--</div>-->
															</div>
															<!--<div class="fl" @mouseleave="endmonthboxshow=false">
														        <input type="text" v-model="experiencetmp.end.month" readonly="readonly" style="width: 139px;height: 46px;font-size: 15px;" placeholder="结束月份" class="profile_select_139 profile_select_normal select_companyYearStart" :class="[endmonthboxshow?'select_focus':'']" @click="endmonthboxshow=true">
																<div :style="{'display':endmonthboxshow?'block':'none'}" style="width: 139px;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
														            <ul>
														        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
														        	</ul>
														        </div>
													        </div>-->
													        <div class="clear"></div>
						            					</td>
						            				</tr>
						            				<tr>
						            					<td></td>
						            					<td colspan="3">
															<input type="submit" @click.prevent="saveexperience(index)" value="保 存" class="btn_profile_save">
											          		<a class="btn_profile_cancel" href="javascript:;" @click.prevent="deleteexperience(index)">删 除</a>
						            					</td>
						            				</tr>
					            				</tbody>
					            			</table>
			            					<!--<input type="hidden" class="expId" value="">-->
		            					</form>
		            				</li>
		            			</ul>
		            		</div><!--end .experienceShow-->
		            		<div class="experienceEdit" :class="[addexperienceshow?'':'dn']" v-if="experiencetmp!=null">
		            			<form class="experienceForm">
			            			<table>
			            				<tbody>
				            				<tr>
										      	<td valign="top">
										        	<span class="redstar">*</span>
										      	</td> 
										      	<td>
										        	<input type="text" v-model="experiencetmp.comname" placeholder="公司名称" name="companyName" class="companyName">
										      	</td>
										      	<td valign="top">
										        	<span class="redstar">*</span>
										      	</td> 
										      	<td>
										          	<input type="text" v-model="experiencetmp.post" placeholder="职位名称，如：产品经理" name="positionName" class="positionName">
										      	</td>
										    </tr>
				            				<tr>
				            					<td valign="top">
										        	<span class="redstar">*</span>
										      	</td> 
				            					<td>
					            					<div class="fl">
					            						<el-date-picker v-model="experiencetmp.startym" type="month" placeholder="开始年月" value-format="yyyy-MM"></el-date-picker>
													</div>
												    <div class="clear"></div>
				            					</td>
				            					<td valign="top">
										        	<span class="redstar">*</span>
										      	</td> 
				            					<td>
					            					<div class="fl">
					            						<el-date-picker v-model="experiencetmp.endym" type="month" placeholder="结束年月" value-format="yyyy-MM"></el-date-picker>
													</div>
											        <div class="clear"></div>
				            					</td>
				            				</tr>
				            				<tr>
				            					<td></td>
				            					<td colspan="3">
													<input type="submit" @click.prevent="savenewexperience" value="保 存" class="btn_profile_save">
									          		<a class="btn_profile_cancel" href="javascript:;" @click.prevent="canceladdexperience">取 消</a>
				            					</td>
				            				</tr>
			            				</tbody>
			            			</table>
			            			<!--<input type="hidden" class="expId" value="">-->
		            			</form><!--end .experienceForm-->
		            		</div><!--end .experienceEdit-->
		            		<div class="experienceAdd pAdd" v-show="resume.experiencelist.length==0&&!addexperienceshow" @click="addexperience">
		            		        工作经历最能体现自己的工作能力,<br>
		            		        来展示你的工作经历吧！
								<!--且完善后才可投递简历哦！-->
								<span>添加工作经历</span>
		            		</div><!--end .experienceAdd-->
		            	</div><!--end #workExperience-->
					
		            	<div class="profile_box" id="projectExperience">
		            		<h2>项目经验</h2>
		            		<span class="c_add" style="position: absolute;" @click="addproject" title="添加项目经历" v-show="resume.projectlist.length!=0&&!addprojectshow&&!editprojectshow"></span>
		            		<div class="projectShow" v-if="resume.projectlist.length!=0">
		            		    <ul class="plist clearfix">
		            		    	<li v-for="(item,index) in resume.projectlist" :key='index'>
		            		    		<a class="c_edit fr" style="position: relative;" v-show="(index!=currentproject||!editprojectshow)&&!addprojectshow" @click="editproject(index)"></a>
		            		    		<!--<dl v-show="!editprojectshow||index!=currentproject">
		            		    			<dt>
		            		    				{{item.proname}}&nbsp;&nbsp;|&nbsp;&nbsp;{{item.post}}
		            		    			</dt><br />
		            		    			<dd>
		            		    				{{item.startym}}&nbsp;&nbsp;至&nbsp;&nbsp;{{item.endym}}<br />
		            		    				{{item.intro}}
		            		    			</dd>
		            		    		</dl>-->
		            		    		<div v-show="!editprojectshow||index!=currentproject" style="margin-left: 30px;">
		            		    			<h3 style="font-weight: bold;">{{item.proname}}&nbsp;&nbsp;|&nbsp;&nbsp;{{item.post}}</h3>
		            		    			{{item.startym}}&nbsp;&nbsp;至&nbsp;&nbsp;{{item.endym}}<br />
		            		    			{{item.intro}}
		            		    		</div>
		            		    		<form class="projectForm" v-show="index==currentproject&&editprojectshow">
					            			<table><tbody>
					            				<tr>
					            					<td valign="top">
											        	<span class="redstar">*</span>
											      	</td> 
											      	<td>
											        	<input type="text" v-model="projecttmp.proname" placeholder="项目名称" name="projectName" class="projectName">
											      	</td>
					            					<td valign="top">
											        	<span class="redstar">*</span>
											      	</td> 
											      	<td>
											          	<input type="text" v-model="projecttmp.post" placeholder="担任职务，如：产品负责人" name="thePost" class="thePost">
											      	</td>
											    </tr>
					            				<tr>
					            					<td valign="top">
											        	<span class="redstar">*</span>
											      	</td> 
					            					<td>
						            					<div class="fl">
						            						<el-date-picker v-model="projecttmp.startym" type="month" placeholder="开始年月" value-format="yyyy-MM"></el-date-picker>
														</div>
												        <div class="clear"></div>
					            					</td>
					            					<td valign="top">
											        	<span class="redstar">*</span>
											      	</td> 
					            					<td>
					            						<div class="fl">
					            							<el-date-picker v-model="projecttmp.endym" type="month" placeholder="结束年月" value-format="yyyy-MM"></el-date-picker>
														</div>
												        <div class="clear"></div>
					            					</td>
					            				</tr>
					            				<tr>
					            					<td valign="top"></td> 
													<td colspan="3">
														<textarea class="projectDescription s_textarea" v-model="projecttmp.intro" name="projectDescription" placeholder="项目描述"></textarea>
														<div class="word_count">你还可以输入 <span>{{500-projecttmp.intro.length}}</span> 字</div>
													</td>
					            				</tr>
					            				<tr>
					            					<td valign="top"></td> 
					            					<td colspan="3">
														<input type="submit" value="保 存" class="btn_profile_save" @click.prevent="saveproject(index)">
										          		<a class="btn_profile_cancel" href="javascript:;" @click.prevnet="deleteproject(index)">删 除</a>
					            					</td>
					            				</tr>
					            			</tbody></table>
					            			<!--<input type="hidden" value="" class="projectId">-->
		            					</form>
		            		    	</li>
			            		</ul>
		            		</div><!--end .projectShow-->
		            		<div class="projectEdit" :class="[addprojectshow?'':'dn']" v-if="projecttmp!=null">
		            			<form class="projectForm">
			            			<table>
			            				<tbody>
			            				<tr>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
									      	<td>
									        	<input type="text" v-model="projecttmp.proname" placeholder="项目名称" name="projectName" class="projectName">
									      	</td>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
									      	<td>
									          	<input type="text" v-model="projecttmp.post" placeholder="担任职务，如：产品负责人" name="thePost" class="thePost">
									      	</td>
									    </tr>
			            				<tr>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
			            					<td>
				            					<div class="fl">
				            						<el-date-picker v-model="projecttmp.startym" type="month" placeholder="开始年月" value-format="yyyy-MM"></el-date-picker>
				            						<!--<input type="hidden" class="projectYearStart" value="" name="projectYearStart">-->
										        	<!--<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_projectYearStart">-->
													<!--<div class="box_projectYearStart  boxUpDown boxUpDown_139 dn" style="display: none;">
											            <ul>
											        											        			<li>2014</li>
											        											        			<li>2013</li>
											        											        			<li>2012</li>
											        											        			<li>2011</li>
											        											        			<li>2010</li>
											        											        			<li>2009</li>
											        											        			<li>2008</li>
											        											        			<li>2007</li>
											        											        			<li>2006</li>
											        											        			<li>2005</li>
											        											        			<li>2004</li>
											        											        			<li>2003</li>
											        											        			<li>2002</li>
											        											        			<li>2001</li>
											        											        			<li>2000</li>
											        											        			<li>1999</li>
											        											        			<li>1998</li>
											        											        			<li>1997</li>
											        											        			<li>1996</li>
											        											        			<li>1995</li>
											        											        			<li>1994</li>
											        											        			<li>1993</li>
											        											        			<li>1992</li>
											        											        			<li>1991</li>
											        											        			<li>1990</li>
											        											        			<li>1989</li>
											        											        			<li>1988</li>
											        											        			<li>1987</li>
											        											        			<li>1986</li>
											        											        			<li>1985</li>
											        											        			<li>1984</li>
											        											        			<li>1983</li>
											        											        			<li>1982</li>
											        											        			<li>1981</li>
											        											        			<li>1980</li>
											        											        			<li>1979</li>
											        											        			<li>1978</li>
											        											        			<li>1977</li>
											        											        			<li>1976</li>
											        											        			<li>1975</li>
											        											        			<li>1974</li>
											        											        			<li>1973</li>
											        											        			<li>1972</li>
											        											        			<li>1971</li>
											        											        			<li>1970</li>
											        											        	</ul>
											        </div>-->
												</div>
												<!--<div class="fl">
											        <input type="hidden" class="projectMonthStart" value="" name="projectMonthStart">
										        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_projectMonthStart">
													<div style="display: none;" class="box_projectMonthStart boxUpDown boxUpDown_139 dn">
											            <ul>
											        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
											        	</ul>
											        </div>
										        </div>-->
										        <div class="clear"></div>
			            					</td>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
			            					<td>
			            						<div class="fl">
			            							<el-date-picker v-model="projecttmp.endym" type="month" placeholder="结束年月" value-format="yyyy-MM"></el-date-picker>
				            						<!--<input type="hidden" class="projectYearEnd" value="" name="projectYearEnd">
										        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_projectYearEnd">
													<div class="box_projectYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
											            <ul>
											            	<li>至今</li>
											        											        			<li>2014</li>
											        											        			<li>2013</li>
											        											        			<li>2012</li>
											        											        			<li>2011</li>
											        											        			<li>2010</li>
											        											        			<li>2009</li>
											        											        			<li>2008</li>
											        											        			<li>2007</li>
											        											        			<li>2006</li>
											        											        			<li>2005</li>
											        											        			<li>2004</li>
											        											        			<li>2003</li>
											        											        			<li>2002</li>
											        											        			<li>2001</li>
											        											        			<li>2000</li>
											        											        			<li>1999</li>
											        											        			<li>1998</li>
											        											        			<li>1997</li>
											        											        			<li>1996</li>
											        											        			<li>1995</li>
											        											        			<li>1994</li>
											        											        			<li>1993</li>
											        											        			<li>1992</li>
											        											        			<li>1991</li>
											        											        			<li>1990</li>
											        											        			<li>1989</li>
											        											        			<li>1988</li>
											        											        			<li>1987</li>
											        											        			<li>1986</li>
											        											        			<li>1985</li>
											        											        			<li>1984</li>
											        											        			<li>1983</li>
											        											        			<li>1982</li>
											        											        			<li>1981</li>
											        											        			<li>1980</li>
											        											        			<li>1979</li>
											        											        			<li>1978</li>
											        											        			<li>1977</li>
											        											        			<li>1976</li>
											        											        			<li>1975</li>
											        											        			<li>1974</li>
											        											        			<li>1973</li>
											        											        			<li>1972</li>
											        											        			<li>1971</li>
											        											        			<li>1970</li>
											        											        	</ul>
											        </div>-->
												</div>
												<!--<div class="fl">
											        <input type="hidden" class="projectMonthEnd" value="" name="projectMonthEnd">
										        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_projectMonthEnd">
													<div style="display: none;" class="box_projectMonthEnd boxUpDown boxUpDown_139 dn">
											            <ul>
											        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
											        	</ul>
											        </div>
										        </div>-->
										        <div class="clear"></div>
			            					</td>
			            				</tr>
			            				<tr>
			            					<td valign="top"></td> 
											<td colspan="3">
												<textarea class="projectDescription s_textarea" v-model="projecttmp.intro" name="projectDescription" placeholder="项目描述"></textarea>
												<div class="word_count">你还可以输入 <span>{{500-projecttmp.intro.length}}</span> 字</div>
												<!--<div class="word_count" v-show="projecttmp.intro.length!=0"></div>-->
											</td>
			            				</tr>
			            				<!-- <tr>
											<td colspan="2">
												<textarea placeholder="职责描述" name="ResponsDescription" class="ResponsDescription s_textarea"></textarea>
												<div class="word_count">你还可以输入 <span>500</span> 字</div>
											</td>
			            				</tr> -->
			            				<tr>
			            					<td valign="top"></td> 
			            					<td colspan="3">
												<input type="submit" value="保 存" class="btn_profile_save" @click.prevent="savenewproject">
								          		<a class="btn_profile_cancel" href="javascript:;" @click.prevnet="canceladdproject">取 消</a>
			            					</td>
			            				</tr>
			            			</tbody></table>
					            	<input type="hidden" value="" class="projectId">
		            			</form><!--end .projectForm-->
		            		</div><!--end .projectEdit-->
		            		<div class="projectAdd pAdd" v-show="resume.projectlist.length==0&&!addprojectshow" @click="addproject">
		            		        项目经验是用人单位衡量人才能力的重要指标哦！<br>
								来说说让你难忘的项目吧！
								<span>添加项目经验</span>
		            		</div><!--end .projectAdd-->
		            	</div><!--end #projectExperience-->
		
		            	<div class="profile_box" id="educationalBackground">
		            		<h2>教育背景<!--<span>（投递简历时必填）</span>--></h2>
		            		<span class="c_add" @click="addeducation" title="添加教育经历" v-show="resume.educationlist.length!=0&&!addedushow&&!editedushow"></span>
		            		<div class="educationalShow" v-if="resume.educationlist.length!=0">
		            		    <!--<form class="educationalForm borderBtm dn">
			            			<table>
			            				<tbody><tr>
									      	<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
									      	<td>
									        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName">
									      	</td>
									      	<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
									      	<td>
									      		<input type="hidden" class="degree" value="" name="degree">
									        	<input type="button" value="学历" class="profile_select_287 profile_select_normal select_degree">
												<div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;">
										            <ul>
										        										        			<li>大专</li>
										        										        			<li>本科</li>
										        										        			<li>硕士</li>
										        										        			<li>博士</li>
										        										        			<li>其他</li>
										        										        	</ul>
										        </div>
									        </td>
									    </tr>
			            				<tr>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
			            					<td>
			            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName">
			            					</td>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
			            					<td>
				            					<div class="fl">
				            						<input type="hidden" class="schoolYearStart" value="" name="schoolYearStart">
										        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_schoolYearStart">
													<div class="box_schoolYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
											            <ul>
											        											        			<li>2014</li>
											        											        			<li>2013</li>
											        											        			<li>2012</li>
											        											        			<li>2011</li>
											        											        			<li>2010</li>
											        											        			<li>2009</li>
											        											        			<li>2008</li>
											        											        			<li>2007</li>
											        											        			<li>2006</li>
											        											        			<li>2005</li>
											        											        			<li>2004</li>
											        											        			<li>2003</li>
											        											        			<li>2002</li>
											        											        			<li>2001</li>
											        											        			<li>2000</li>
											        											        			<li>1999</li>
											        											        			<li>1998</li>
											        											        			<li>1997</li>
											        											        			<li>1996</li>
											        											        			<li>1995</li>
											        											        			<li>1994</li>
											        											        			<li>1993</li>
											        											        			<li>1992</li>
											        											        			<li>1991</li>
											        											        			<li>1990</li>
											        											        			<li>1989</li>
											        											        			<li>1988</li>
											        											        			<li>1987</li>
											        											        			<li>1986</li>
											        											        			<li>1985</li>
											        											        			<li>1984</li>
											        											        			<li>1983</li>
											        											        			<li>1982</li>
											        											        			<li>1981</li>
											        											        			<li>1980</li>
											        											        			<li>1979</li>
											        											        			<li>1978</li>
											        											        			<li>1977</li>
											        											        			<li>1976</li>
											        											        			<li>1975</li>
											        											        			<li>1974</li>
											        											        			<li>1973</li>
											        											        			<li>1972</li>
											        											        			<li>1971</li>
											        											        			<li>1970</li>
											        											        	</ul>
											        </div>
												</div>
												<div class="fl">
				            						<input type="hidden" class="schoolYearEnd" value="" name="schoolYearEnd">
										        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_schoolYearEnd">
													<div style="display: none;" class="box_schoolYearEnd  boxUpDown boxUpDown_139 dn">
											            <ul>
											        											        			<li>2021</li>
											        											        			<li>2020</li>
											        											        			<li>2019</li>
											        											        			<li>2018</li>
											        											        			<li>2017</li>
											        											        			<li>2016</li>
											        											        			<li>2015</li>
											        											        			<li>2014</li>
											        											        			<li>2013</li>
											        											        			<li>2012</li>
											        											        			<li>2011</li>
											        											        			<li>2010</li>
											        											        			<li>2009</li>
											        											        			<li>2008</li>
											        											        			<li>2007</li>
											        											        			<li>2006</li>
											        											        			<li>2005</li>
											        											        			<li>2004</li>
											        											        			<li>2003</li>
											        											        			<li>2002</li>
											        											        			<li>2001</li>
											        											        			<li>2000</li>
											        											        			<li>1999</li>
											        											        			<li>1998</li>
											        											        			<li>1997</li>
											        											        			<li>1996</li>
											        											        			<li>1995</li>
											        											        			<li>1994</li>
											        											        			<li>1993</li>
											        											        			<li>1992</li>
											        											        			<li>1991</li>
											        											        			<li>1990</li>
											        											        			<li>1989</li>
											        											        			<li>1988</li>
											        											        			<li>1987</li>
											        											        			<li>1986</li>
											        											        			<li>1985</li>
											        											        			<li>1984</li>
											        											        			<li>1983</li>
											        											        			<li>1982</li>
											        											        			<li>1981</li>
											        											        			<li>1980</li>
											        											        			<li>1979</li>
											        											        			<li>1978</li>
											        											        			<li>1977</li>
											        											        			<li>1976</li>
											        											        			<li>1975</li>
											        											        			<li>1974</li>
											        											        			<li>1973</li>
											        											        			<li>1972</li>
											        											        			<li>1971</li>
											        											        			<li>1970</li>
											        											        	</ul>
											        </div>
			            						</div>
			            						<div class="clear"></div>
			            					</td>
			            				</tr>
			            				<tr>
			            					<td></td>
			            					<td colspan="3">
												<input type="submit" value="保 存" class="btn_profile_save">
								          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
			            					</td>
			            				</tr>
			            			</tbody></table>
			            			<input type="hidden" class="eduId" value="">
		            			</form>--><!--end .educationalForm-->
	
		            			<ul class="elist clearfix">
		            				<li v-for="(item,index) in resume.educationlist" :key='index'>
		            					<a class="c_edit fr" v-show="(index!=currenteducation||!editedushow)&&!addedushow" @click="editeducation(index)"></a>
		            					<div v-show="!editedushow||index!=currenteducation">
		            		    			<h3>{{item.school}}&nbsp;&nbsp;|&nbsp;&nbsp;{{item.degree}}</h3>
		            		    			<h4>{{item.profession}}&nbsp;&nbsp;|&nbsp;&nbsp;{{item.rank}}<br />{{item.startyear}}&nbsp;&nbsp;至&nbsp;&nbsp;{{item.endyear}}</h4>
		            		    			<!--<h4>{{item.startyear}}&nbsp;&nbsp;至&nbsp;&nbsp;{{item.endyear}}</h4>-->
		            					</div>
		            					<form class="educationalForm" v-show="index==currenteducation&&editedushow">
					            			<table><tbody>
					            				<tr>
											      	<td valign="top">
											        	<span class="redstar">*</span>
											      	</td> 
											      	<td>
											        	<input type="text" v-model="educationtmp.school" placeholder="学校名称" name="schoolName" class="schoolName">
											      	</td>
											      	<td valign="top">
											        	<span class="redstar">*</span>
											      	</td> 
											      	<td @mouseleave="edudegreelistshow=false">
											      		<!--<input type="hidden" class="degree" value="" name="degree">-->
											        	<input type="text" @click="edudegreelistshow=true" placeholder="学历" :class="[edudegreelistshow?'select_focus':'']" readonly="readonly" v-model="educationtmp.degree" class="profile_select_287 profile_select_normal select_degree">
														<div class="box_degree boxUpDown boxUpDown_287 dn" style="width: 288px;" :style="{'display':edudegreelistshow?'block':'none'}">
												            <ul>
												            	<li v-for="(item,index) in degreelist" :key="index" @click="pickedudegree(item)">
												            		{{item}}
												            	</li>
												        		<!--<li>大专</li>
												        		<li>本科</li>
												        		<li>硕士</li>
												        		<li>博士</li>
												        		<li>其他</li>-->
												        	</ul>
												        </div>
											        </td>
											    </tr>
					            				<tr>
					            					<td valign="top">
											        	<span class="redstar">*</span>
											      	</td> 
					            					<td>
					            						<input type="text" placeholder="专业名称" v-model="educationtmp.profession" name="professionalName" class="professionalName">
					            					</td>
					            					<td valign="top">
											        	<span class="redstar"></span>
											      	</td> 
					            					<td @mouseleave="ranklistshow=false">
											      		<!--<input type="hidden" class="degree" value="" name="degree">-->
											        	<input type="text" @click="ranklistshow=true" placeholder="专业排名" :class="[ranklistshow?'select_focus':'']" readonly="readonly" v-model="educationtmp.rank" class="profile_select_287 profile_select_normal select_degree">
														<div class="box_degree boxUpDown boxUpDown_287 dn" style="width: 288px;" :style="{'display':ranklistshow?'block':'none'}">
												            <ul>
												            	<li v-for="(item,index) in ranklist" :key="index" @click="pickrank(item)">
												            		{{item}}
												            	</li>
												        	</ul>
												        </div>
											        </td>
					            				</tr>
					            				<tr>
					            					<td valign="top">
											        	<span class="redstar">*</span>
											      	</td>
											      	<div class="fl" style="margin-left: -13px;width: 288px;">
						            						<el-date-picker class="edudate" v-model="educationtmp.startyear" type="year" placeholder="开始年份" value-format="yyyy"></el-date-picker>
						            				</div>
					            					<!--<td>
						            					<div class="fl">
						            						<el-date-picker class="edudate" v-model="educationtmp.startyear" type="year" placeholder="开始年份" value-format="yyyy"></el-date-picker>
						            					</div>
					            					</td>-->
					            					<td valign="top">
											        	<span class="redstar">*</span>
											      	</td>
											      	<div class="fl" style="margin-left: -13px;">
															<el-date-picker class="edudate" v-model="educationtmp.endyear" type="year" placeholder="结束年份" value-format="yyyy"></el-date-picker>
						            				</div>
											      	<!--<td>
											      		<div class="fl">
															<el-date-picker class="edudate" v-model="educationtmp.endyear" type="year" placeholder="结束年份" value-format="yyyy"></el-date-picker>
						            					</div>
											      	</td>-->
					            				</tr>
					            				<tr>
					            					<td></td>
					            					<td colspan="3">
														<input type="submit" value="保 存" class="btn_profile_save" @click.prevent="saveeducation(index)">
										          		<a class="btn_profile_cancel" href="javascript:;" @click.prevent="deleteeducation(index)">删 除</a>
					            					</td>
					            				</tr>
					            			</tbody></table>
					            			<!--<input type="hidden" class="eduId" value="">-->
				            			</form>
		            				</li>
		            			</ul>
		            		</div><!--end .educationalShow-->
		            		<div class="educationalEdit" :class="[addedushow?'':'dn']" v-if="educationtmp!=null">
		            			<form class="educationalForm">
			            			<table><tbody>
			            				<tr>
									      	<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
									      	<td>
									        	<input type="text" v-model="educationtmp.school" placeholder="学校名称" name="schoolName" class="schoolName">
									      	</td>
									      	<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
									      	<td @mouseleave="edudegreelistshow=false">
									      		<!--<input type="hidden" class="degree" value="" name="degree">-->
									        	<input type="text" @click="edudegreelistshow=true" placeholder="学历" :class="[edudegreelistshow?'select_focus':'']" readonly="readonly" v-model="educationtmp.degree" class="profile_select_287 profile_select_normal select_degree">
												<div class="box_degree boxUpDown boxUpDown_287 dn" style="width: 288px;" :style="{'display':edudegreelistshow?'block':'none'}">
										            <ul>
										            	<li v-for="(item,index) in degreelist" :key="index" @click="pickedudegree(item)">
										            		{{item}}
										            	</li>
										        		<!--<li>大专</li>
										        		<li>本科</li>
										        		<li>硕士</li>
										        		<li>博士</li>
										        		<li>其他</li>-->
										        	</ul>
										        </div>
									        </td>
									    </tr>
			            				<tr>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
			            					<td>
			            						<input type="text" placeholder="专业名称" v-model="educationtmp.profession" name="professionalName" class="professionalName">
			            					</td>
			            					<td valign="top">
									        	<span class="redstar"></span>
									      	</td> 
			            					<td @mouseleave="ranklistshow=false">
									      		<!--<input type="hidden" class="degree" value="" name="degree">-->
									        	<input type="text" @click="ranklistshow=true" placeholder="专业排名" :class="[ranklistshow?'select_focus':'']" readonly="readonly" v-model="educationtmp.rank" class="profile_select_287 profile_select_normal select_degree">
												<div class="box_degree boxUpDown boxUpDown_287 dn" style="width: 288px;" :style="{'display':ranklistshow?'block':'none'}">
										            <ul>
										            	<li v-for="(item,index) in ranklist" :key="index" @click="pickrank(item)">
										            		{{item}}
										            	</li>
										        	</ul>
										        </div>
									        </td>
			            				</tr>
			            				<tr>
			            					<td valign="top">
									        	<span class="redstar">*</span>
									      	</td> 
			            					<td>
				            					<div class="fl">
				            						<el-date-picker class="edudate" v-model="educationtmp.startyear" type="year" placeholder="开始年份" value-format="yyyy"></el-date-picker>
				            						<!--<el-date-picker
												      v-model="educationtmp.startyear"
												      type="monthrange"
												      align="right"
												      unlink-panels
												      range-separator="至"
												      start-placeholder="开始月份"
												      end-placeholder="结束月份"
												      :picker-options="pickerOptions">
												    </el-date-picker> -->
				            					</div>
				            					<td valign="top">
									        		<span class="redstar">*</span>
									      		</td>
												<div class="fl">
													<el-date-picker class="edudate" v-model="educationtmp.endyear" type="year" placeholder="结束年份" value-format="yyyy"></el-date-picker>
				            					</div>
			            						<div class="clear"></div>
			            					</td>
			            				</tr>
			            				<tr>
			            					<td></td>
			            					<td colspan="3">
												<input type="submit" value="保 存" class="btn_profile_save" @click.prevent="saveneweducation">
								          		<a class="btn_profile_cancel" href="javascript:;" @click.prevent="canceladdeducation">取 消</a>
			            					</td>
			            				</tr>
			            			</tbody></table>
			            			<!--<input type="hidden" class="eduId" value="">-->
		            			</form><!--end .educationalForm-->
		            		</div><!--end .educationalEdit-->
		            		<div class="educationalAdd pAdd" v-show="resume.educationlist.length==0&&!addedushow" @click="addeducation">
		            		        教育背景可以充分体现你的学习和专业能力，<br>
								且完善后才可投递简历哦！
								<span>添加教育经历</span>
		            		</div><!--end .educationalAdd-->
		            	</div><!--end #educationalBackground-->
		
		            	<div class="profile_box" id="selfDescription">
		            		<h2>自我描述</h2>
		            		<span class="c_edit" @click="editdescription" v-show="resume.selfdescription!=null&&resume.selfdescription!=''"></span>
		            		<div class="descriptionShow" v-show="!editdescriptionshow" v-if="resume.selfdescription!=null&&resume.selfdescription!=''">
		            		    {{resume.selfdescription}} 			
		            		</div><!--end .descriptionShow-->
		            		<div class="descriptionEdit" v-show="editdescriptionshow">
		            			<form class="descriptionForm">
			            			<table>
			            				<tbody><tr>
											<td colspan="2">
												<textarea v-model="descriptiontmp" class="selfDescription s_textarea" name="selfDescription" placeholder="请输入自我介绍"></textarea>
												<div class="word_count" v-if="descriptiontmp!=null">你还可以输入 <span>{{lastlength_des}}</span> 字</div>
											</td>
			            				</tr>
			            				<tr>
			            					<td colspan="2">
												<input type="submit" value="保 存" class="btn_profile_save" @click.prevent="savedescript">
								          		<a class="btn_profile_cancel" href="javascript:;" @click.prevent="canceleditdescription">取 消</a>
			            					</td>
			            				</tr>
			            			</tbody></table>
		            			</form><!--end .descriptionForm-->
		            		</div><!--end .descriptionEdit-->
		            		<div class="descriptionAdd pAdd" v-show="(resume.selfdescription==null||resume.selfdescription=='')&&!editdescriptionshow" @click="adddescription">
		            		        描述你的性格、爱好以及吸引人的经历等，<br>
								让企业了解多元化的你！
								<span>添加自我描述</span>
		            		</div><!--end .descriptionAdd-->
		            	</div><!--end #selfDescription-->

		
		            	<!--<div class="profile_box" id="worksShow">
		            		<h2>作品展示</h2>
		            		<span class="c_add dn"></span>
		            		<div class="workShow dn">
		            		    <ul class="slist clearfix">
		            			</ul>
		            		</div>
		            		<div class="workEdit dn">
		            			<form class="workForm">
			            			<table>
			            				<tbody><tr>
									      	<td>
									        	<input type="text" placeholder="请输入作品链接" name="workLink" class="workLink">
									      	</td>
									    </tr>
			            				<tr>
											<td>
												<textarea maxlength="100" class="workDescription s_textarea" name="workDescription" placeholder="请输入说明文字"></textarea>
												<div class="word_count">你还可以输入 <span>100</span> 字</div>
											</td>
			            				</tr>
			            				<tr>
			            					<td>
												<input type="submit" value="保 存" class="btn_profile_save">
								          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
			            					</td>
			            				</tr>
			            			</tbody></table>
			            			<input type="hidden" class="showId" value="">
		            			</form>
		            		</div>
		            		<div class="workAdd pAdd">
		            		           好作品会说话！<br>
								快来秀出你的作品打动企业吧！
								<span>添加作品展示</span>
		            		</div>
		            	</div>-->
	            	</div><!--end .content_l-->
	            	<div class="content_r">
		            	<div class="mycenterR" id="myInfo">
		            		<h2>我的信息</h2>
		            		<!--<a target="_blank" href="collections.html">我收藏的职位</a>-->
		            		<router-link to="" target="_blank">我收藏的职位</router-link>
		            		<br>
		            		<!--<a target="_blank" href="subscribe.html">我订阅的职位</a>-->
		            		<router-link to="" target="_blank">我订阅的职位</router-link>
		            	</div><!--end #myInfo-->
		
						<div class="mycenterR" id="myResume">
		            		<h2>我的附件简历 
		            			<!--<a title="上传附件简历" href="#uploadFile" class="inline cboxElement">-->
		            			<a title="上传附件简历" @click.prevent="uploadresume" class="inline cboxElement">
		            				上传附件简历
		            			</a>
		            		</h2>
		            		<div class="resumeUploadDiv" v-show="resume.resumefilelist.length==0">
			            		暂无附件简历
			            	</div>
			            	<div class="resumefileDiv" v-show="resume.resumefilelist.length!=0">
			            		<ul>
			            			<li v-for="(item,index) in resume.resumefilelist" :key='index'>
			            				<a :href="item" :download="item.name">{{item.name}}</a>
			            			</li>
			            		</ul>
			            	</div>
		            	</div><!--end #myResume-->
		
						<div class="mycenterR" style="padding: 0 0;" id="rightNav">
							<ul style="list-style: none;">
								<li class="divnav" :class="[currentdiv===index?'current':'']" v-for="(item,index) in divlist" :key='index' @click="todiv(index)">{{item.name}}</li>
							</ul>
						</div>
		
		            	<!--<div class="mycenterR" id="resumeSet">
		            		<h2>投递简历设置  <span>修改设置</span></h2>-->
		            		<!-- -1 (0=附件， 1=在线， 其他=未设置) -->
		            		<!--<div class="noSet set0 dn">默认使用<span>附件简历</span>进行投递</div>
		            		<div class="noSet set1 dn">默认使用<span>在线简历</span>进行投递</div>
							<div class="noSet">暂未设置默认投递简历</div>
		            		<input type="hidden" class="defaultResume" value="-1">
		            		<form class="dn" id="resumeSetForm">
			            		<label><input type="radio" value="1" class="resume1" name="resume">默认使用<span>在线简历</span>进行投递</label>
			            		<label><input type="radio" value="0" class="resume0" name="resume">默认使用<span>附件简历</span>进行投递</label>
			            		<span class="setTip error"></span>
			            		<div class="resumeTip">设置后投递简历时将不再提醒</div>
			            		<input type="submit" value="保 存" class="btn_profile_save">
								<a class="btn_profile_cancel" href="javascript:;">取 消</a>
			            	</form>
		            	</div>--><!--end #resumeSet-->
						
						<!--<div class="mycenterR" id="myShare">
		            		<h2>当前每日投递量：10个</h2>
		            		<a target="_blank" href="h/share/invite.html">邀请好友，提升投递量</a>
		            	</div><!--end #myShare-->
		            	
										
						<!--<div class="greybg qrcode mt20">
		                	<img width="242" height="242" alt="拉勾微信公众号二维码" src="style/images/qr_resume.png">
		                    <span class="c7">微信扫一扫，轻松找工作</span>
		                </div>-->
	            	</div><!--end .content_r-->
	        	</div>
	        	<!--<input type="hidden" id="userid" name="userid" value="314873">-->
	<!-------------------------------------弹窗lightbox ----------------------------------------->
				<div style="display:none;">
					<!-- 上传简历 -->
					<div class="popup" id="uploadFile">
					    <table width="100%"><tbody>
					    	<tr>
					        	<td align="center">
					                <form>
					                    <a class="btn_addPic" href="javascript:void(0);">
					                    	<span>选择上传文件</span>
					                        <!--<input type="file" onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload')" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3">-->
					                        <input type="file" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3"/>
					                    </a>
					                </form>
					            </td>
					        </tr>
					    	<tr>
					        	<td align="left">支持word、pdf、ppt、txt、wps格式文件<br>文件大小需小于10M</td>
					        </tr>
					        <!--<tr>
					        	<td align="left" style="color:#dd4a38; padding-top:10px;">注：若从其它网站下载的word简历，请将文件另存为.docx格式后上传</td>
					        </tr>-->
					    	<tr>
					        	<td align="center"><img width="55" height="16" alt="loading" style="visibility: hidden;" id="loadingImg" src="style/images/loading.gif"></td>
					        </tr>
					    </tbody></table>
					</div><!--/#uploadFile-->
					
					<!-- 简历上传成功 -->
					<div class="popup" id="uploadFileSuccess">
				     	<h4>简历上传成功！</h4>
				         <table width="100%">
				             <tbody><tr>
				                 <td align="center"><p>你可以将简历投给你中意的公司了。</p></td>
				             </tr>
				         	<tr>
				             	<td align="center"><a class="btn_s" href="javascript:;">确&nbsp;定</a></td>
				             </tr>
				         </tbody></table>
				     </div><!--/#uploadFileSuccess-->
				     
					<!-- 没有简历请上传 -->
				    <div class="popup" id="deliverResumesNo">
				        <table width="100%">
				            <tbody><tr>
				                <td align="center"><p class="font_16">你在拉勾还没有简历，请先上传一份</p></td>
				            </tr>
				        	<tr>
				            	<td align="center">
				                    <form>
				                        <a class="btn_addPic" href="javascript:void(0);">
				                        	<span>选择上传文件</span>
				                        	<input type="file" onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload1')" class="filePrew" id="resumeUpload1" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M">
				                        </a>
				                    </form>
				                </td>
				            </tr>
				        	<tr>
				            	<td align="center">支持word、pdf、ppt、txt、wps格式文件，大小不超过10M</td>
				            </tr>
				        </tbody></table>
				    </div><!--/#deliverResumesNo-->
				    
				    <!-- 上传附件简历操作说明-重新上传 -->
				    <div class="popup" id="fileResumeUpload">
				        <table width="100%">
				            <tbody><tr>
				                <td>
				                	<div class="f18 mb10">请上传标准格式的word简历</div>
				                </td>
				            </tr>
				            <tr>
				                <td>
				                	<div class="f16">
				                		操作说明：<br>
				                		打开需要上传的文件 - 点击文件另存为 - 选择.docx - 保存
				                	</div>
				                </td>
				            </tr>
				        	<tr>
				            	<td align="center">
				            		<a title="上传附件简历" href="#uploadFile" class="inline btn cboxElement">重新上传</a>
				            	</td>
				            </tr>
				        </tbody></table>
				    </div><!--/#fileResumeUpload-->
				    
				    <!-- 上传附件简历操作说明-重新上传 -->
				    <div class="popup" id="fileResumeUploadSize">
			        <table width="100%">
			            <tbody><tr>
			                <td>
			                	<div class="f18 mb10">上传文件大小超出限制</div>
			                </td>
			            </tr>
			            <tr>
			                <td>
			                	<div class="f16">
			                		提示：<br>
			                		单个附件不能超过10M，请重新选择附件简历！
			                	</div>
			                </td>
			            </tr>
			        	<tr>
			            	<td align="center">
			            		<a title="上传附件简历" href="#uploadFile" class="inline btn cboxElement">重新上传</a>
			            	</td>
			            </tr>
			        </tbody></table>
			    </div><!--/#deliverResumeConfirm--> 
				</div>
				<!--<div class="popup" id="uploadFile">
					<div class="cloud">
						<img width="134" height="134" src="">
						<a class="close" href="javascript:;"></a>
					</div>
				</div>-->
				<div class="clear"></div>
				<!--<input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655" id="resubmitToken">-->
		   	 	<a rel="nofollow" @click.prevent="toTop" title="回到顶部" id="backtop" style="display: inline;"></a>
		    </div><!-- end #container -->
		</div>
		<div id="footer">
			<div class="wrapper">
				<!--<router-link to="" target="_blank">联系我们</router-link>-->
				<!--<router-link to=""></router-link>-->
			</div>
		</div>
		<div id="cboxOverlay" :style="{'display':uploadboxshow?'block':'none','opacity':uploadboxshow?'0.9':'1','cursor':uploadboxshow?'pointer':'auto'}" style="visibility: visible;"></div>
		<div id="colorbox" class="" role="dialog" tabindex="-1" :style="{'display':uploadboxshow?'block':'none'}" style="visibility: visible;top: 307px;left: 370.8px;position: absolute;width: 528px;height: 308px;opacity: 1;cursor: suto;">
			<div id="cboxWrapper" style="width: 528px;height: 308px;">
				<div>
					<div id="cboxTopLeft" style="float: left;"></div>
					<div id="cboxTopCenter" style="float: left;width: 502px;"></div>
					<div id="cboxTopRight" style="float: left;"></div>
				</div>
				<div style="clear: left;">
					<div id="cboxMiddleLeft" style="float: left;height: 282px;"></div>
					<div id="cboxContent" style="float: left;height: 282px;width: 502px;">
						<div id="cboxLoadedContent" style="width: 502px;height: 238px;overflow: auto;">
							<div class="popup" id="uploadFile" style="width: 502px;height: 238px;">
							    <table width="100%" style="height: 177px;"><tbody>
							    	<tr>
							        	<td align="center">
							                <form>
							                    <a class="btn_addPic" href="javascript:void(0);">
							                    	<span>选择上传文件</span>
							                        <!--<input type="file" onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload')" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3">-->
							                        <input type="file" accept="application/msword,application/pdf,application/vnd.ms-powerpoint,application/vnd.ms-works" @change="getresumefile" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3"/>
							                    </a>
							                </form>
							            </td>
							        </tr>
							    	<tr>
							        	<td align="left" style="text-align: center;">支持word、pdf、ppt、txt、wps格式文件<br>文件大小需小于10M</td>
							        </tr>
							        <!--<tr>
							        	<td align="left" style="color:#dd4a38; padding-top:10px;">注：若从其它网站下载的word简历，请将文件另存为.docx格式后上传</td>
							        </tr>-->
							    	<tr>
							        	<td align="center"><img width="55" height="16" alt="loading" style="visibility: hidden;" id="loadingImg" src="style/images/loading.gif"></td>
							        </tr>
							    </tbody></table>
							</div>
						</div>
						<div id="cboxTitle" style="float: left;display: block;">上传附件简历</div>
						<div id="cboxCurrent" style="float: left;display: none;"></div>
						<button type="button" id="cboxPrevious" style="display: none;"></button>
						<button type="button" id="cboxNext" style="display: none;"></button>
						<button id="cboxSlideshow" style="display: none;"></button>
						<div id="cboxLoadingOverlay" style="float: left;display: none;"></div>
						<div id="cboxLoadingGraphic" style="float: left;display: none;"></div>
						<button type="button" id="cboxClose" @click="uploadboxshow=false">close</button>
					</div>
					<div id="cboxMiddleRight" style="float: left;height: 282px;"></div>
				</div>
				<div style="clear: left;">
					<div id="cboxBottomLeft" style="float: left;"></div>
					<div id="cboxBottomCenter" style="float: left;width: 502px;"></div>
					<div id="cboxBottomRight" style="float: left;"></div>
				</div>
			</div>
			<div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
		</div>
	</div>
</template>

<script> 
	export default{
		name:'resume',
		data(){
			this.chartsettings = {
					dimension:'mode',
					metrics:'precent',
					label:{
						show:false
					},
					offsetY:55,
					radius:[
						'45','55'
					],
					limitShowNum:this.showNum
			}
			return{
				collapsibleshow:false,
				editbasicshow:false,
				editexpectjobshow:false,
				degreelistshow:false,
				edudegreelistshow:false,
				workyearlistshow:false,
				currentstatelistshow:false,
				ranklistshow:false,
				renameshow:false,
				cityboxshow:false,
				salaryboxshow:false,
				editexperienceshow:false,
				addexperienceshow:false,
				editprojectshow:false,
				addprojectshow:false,
				editedushow:false,
				addedushow:false,
				editdescriptionshow:false,
				uploadboxshow:false,
				resume:{
					name:'person的简历',
					basicinfo:{
						username:'person',
						tel:'15813359',
						email:'1021478@qq.com',
						gender:'女',
						degree:'大专',
						workyear:'3年',
						currentstate:'我是应届毕业生',
						img:'../../../static/images/default_headpic.png'
					},
					expectjob:null,
					experiencelist:[],
					projectlist:[],
					educationlist:[],
					resumefilelist:[],
					selfdescription:null,
				},
				watcher:[false,false,false,false,false],
				degreelist:['大专','本科','硕士','博士','其他'],
				workyearlist:['应届毕业生','1年','2年','3年','4年','5年','6年','7年','8年','9年','10年','10年以上'],
				currentstatelist:['我目前已离职，可快速到岗','我目前正在职，正考虑换个新环境','我暂时不想找工作','我是应届毕业生'],
				jobtypelist:['全职','兼职','实习'],
				citylist:{
					hotcities:['北京','上海','广州','深圳','成都','杭州'],
					list1:['北京','长春','成都','重庆','长沙','常州','东莞','大连','佛山','福州'],
					list2:['贵阳','广州','哈尔滨','合肥','海口','杭州','惠州','金华','济南','嘉兴'],
					list3:['昆明','廊坊','宁波','南昌','南京','南宁','南通'],
					list4:['青岛','泉州'],
					list5:['上海','石家庄','绍兴','沈阳','深圳','苏州','天津','太原','台州'],
					list6:['武汉','无锡','温州','西安','厦门','烟台','珠海','中山','郑州']
				},
				salarylist:['2k以下','2k-5k','5k-10k','10k-15k','15k-25k','25k-50k','50k以上'],
				ranklist:['10%','20%','30%','50%','其他'],
				divlist:[
					{
						name:'基本信息',
						div:'basicInfo'
					},
					{
						name:'期望工作',
						div:'expectJob'
					},
					{
						name:'工作经历',
						div:'workExperience'
					},
					{
						name:'项目经历',
						div:'workExperience'
					},
					{
						name:'教育背景',
						div:'projectExperience'
					},
					{
						name:'自我描述',
						div:'selfDescription'
					},
				],
				chartdata:{
					columns:['mode','precent'],
					rows:[
						{'mode':'已完成','precent':0},
						{'mode':'未完成','precent':100}
					]
				},
				chartextend:{
					legend:{
						show:false
					},
					animation:false,
					color:['#019875','#fff'],
				},
				tooltip:{
					trigger:'none'
				},
				basicinfotmp:null,
				expectjobtmp:null,
				experiencetmp:null,
				educationtmp:null,
				projecttmp:null,
				descriptiontmp:null,
				currentexperience:null,
				currentproject:null,
				currenteducation:null,
				currentdiv:null,
			}
		},
		beforeMount(){
			this.basicinfotmp = JSON.parse(JSON.stringify(this.resume.basicinfo))
			this.expectjobtmp = JSON.parse(JSON.stringify(this.resume.expectjob))
		},
		mounted(){
			console.log('inside mounted')
			this.initchartdata()
		},
		computed:{
			lastlength_des(){
				return 500-this.descriptiontmp.length
			},
			resume_precent(){
				let num = 0
				for(item in this.chartdata.rows){
					num += parseInt(item.precent)
				}
				return num
			},
			showNum(){
				return 1
			}
		},
		methods:{
			chartdata_inc(index){
				this.chartdata.rows[0].precent += index
				this.chartdata.rows[1].precent -= index
			},
			chartdata_dec(index){
				this.chartdata.rows[0].precent -= index
				this.chartdata.rows[1].precent += index
			},
			initchartdata(){
				console.log('inside init')
				console.log(this.chartdata.rows[0].precent)
				if(this.resume.basicinfo !== undefined && this.resume.basicinfo !== null){
					this.chartdata_inc(15)
				}
				if(this.resume.expectJob !== undefined && this.resume.expectJob !== null){
					this.chartdata_inc(20)
				}
				if(this.resume.experiencelist !== undefined && this.resume.experiencelist !== null && this.resume.experiencelist.length !== 0){
					this.chartdata_inc(30)
				}
				if(this.resume.projectlist !== undefined && this.resume.projectlist !== null && this.resume.projectlist.length !== 0){
					this.chartdata_inc(20)
				}
				if(this.resume.educationlist !== undefined && this.resume.educationlist !== null && this.resume.educationlist.length !== 0){
					this.chartdata_inc(10)
				}
				if(this.resume.selfdescription !== undefined && this.resume.selfdescription !== null && this.resume.selfdescription !== ''){
					this.chartdata_inc(5)
				}
				console.log(this.chartdata.rows[0].precent)
			},
			entercollapsible(){
				this.collapsibleshow = true
			},
			leavecollapsible(){
				this.collapsibleshow = false
			},
			rename(){
				this.renameshow = true
			},
			getresumeimg(e){
				let _this = this
				var files = e.target.files[0]
				if(!e || !window.FileReader) return
				let reader = new FileReader()
				reader.readAsDataURL(files)
				reader.onloadend = function(){
					_this.basicinfotmp.img = this.result
				}
			},
			saveresumename(){
				let newresumename = this.$refs.newresumename.value
				if(newresumename != null && newresumename != ''){
					this.resume.name =  this.$refs.newresumename.value
					this.renameshow = false
				}
				else{
					alert("请输入简历名称！")
				}
			},
			cancelrename(){
				this.renameshow = false
			},
			toworkexperience(){
				let el = document.getElementById("workExperience")
				window.scrollTo({"behavior":"smooth","top":el.offsetTop})
			},
			savebasic(){
				this.resume.basicinfo = JSON.parse(JSON.stringify(this.basicinfotmp))
				this.editbasicshow = false
			},
			canceleditbasic(){
				this.editbasicshow = false
			},
			showgender(){
				
			},
			editbasicinfo(){
				this.basicinfotmp = JSON.parse(JSON.stringify(this.resume.basicinfo))
				this.editbasicshow=true
			},
			pickdegree(item){
				this.basicinfotmp.degree=item
				this.degreelistshow=false
			},
			pickworkyear(item){
				this.basicinfotmp.workyear=item
				this.workyearlistshow=false
			},
			pickcurrentstate(item){
				this.basicinfotmp.currentstate=item
				this.currentstatelistshow=false
			},
			addexpectjob(){
				let tmp = {
					city:'',
					type:'',
					post:'',
					salary:'',
				}
//				this.resume.expectjob = JSON.parse(JSON.stringify(tmp))
				this.expectjobtmp = JSON.parse(JSON.stringify(tmp))
				this.editexpectjobshow=true
			},
			editexpectjob(){
				this.expectjobtmp = JSON.parse(JSON.stringify(this.resume.expectjob))
				this.editexpectjobshow=true
			},
			pickcity(item){
				this.expectjobtmp.city=item
				this.cityboxshow=false
			},
			picksalary(item){
				this.expectjobtmp.salary=item
				this.salaryboxshow=false
			},
			saveexpectjob(){
				this.resume.expectjob = JSON.parse(JSON.stringify(this.expectjobtmp))
				this.editexpectjobshow=false
			},
			canceleditexpectjob(){
				this.editexpectjobshow=false
			},
			addexperience(){
				let tmp = {
					comname:'',
					post:'',
					startym:'',
					endym:''
				}
//				this.resume.experience = JSON.parse(JSON.stringify(tmp))
				this.experiencetmp = JSON.parse(JSON.stringify(tmp))
				this.addexperienceshow=true
			},
			savenewexperience(){
				this.resume.experiencelist.push(JSON.parse(JSON.stringify(this.experiencetmp)))
				this.addexperienceshow=false
			},
			canceladdexperience(){
				this.addexperienceshow=false
			},
			editexperience(index){
				this.currentexperience=index
				this.experiencetmp = JSON.parse(JSON.stringify(this.resume.experiencelist[index]))
				this.editexperienceshow=true
			},
			saveexperience(index){
				this.resume.experiencelist[index]=JSON.parse(JSON.stringify(this.experiencetmp))
				this.editexperienceshow=false
			},
			deleteexperience(index){
				let confirmmsg = confirm("确定删除此条工作经历？")
				if(confirmmsg){
					this.resume.experiencelist.splice(index,1)
					this.editexperienceshow=false
				}
			},
			addproject(){
				let tmp = {
					proname:'',
					post:'',
					startym:'',
					endym:'',
					intro:''
				}
				this.projecttmp = JSON.parse(JSON.stringify(tmp))
				this.addprojectshow = true
			},
			editproject(index){
				this.currentproject=index
				this.projecttmp = JSON.parse(JSON.stringify(this.resume.projectlist[index]))
				this.editprojectshow=true
			},
			savenewproject(){
				this.resume.projectlist.push(JSON.parse(JSON.stringify(this.projecttmp)))
				this.addprojectshow=false
			},
			canceladdproject(){
				this.addprojectshow=false
			},
			deleteproject(index){
				let confirmmsg = confirm("确定删除此条项目经历？")
				if(confirmmsg){
					this.resume.projectlist.splice(index,1)
					this.editprojectshow=false
				}
			},
			saveproject(index){
				this.resume.projectlist[index]=JSON.parse(JSON.stringify(this.projecttmp))
				this.editprojectshow=false
			},
			addeducation(){
				let tmp = {
					school:'',
					degree:'',
					profession:'',
					startyear:'',
					endyear:'',
					rank:''
				}
				this.educationtmp = JSON.parse(JSON.stringify(tmp))
				this.addedushow=true
			},
			saveneweducation(){
				this.resume.educationlist.push(JSON.parse(JSON.stringify(this.educationtmp)))
				this.addedushow=false
			},
			canceladdeducation(){
				this.addedushow=false
			},
			saveeducation(index){
				this.resume.educationlist[index]=JSON.parse(JSON.stringify(this.educationtmp))
				this.editedushow=false
			},
			editeducation(index){
				this.currenteducation=index
				this.educationtmp = JSON.parse(JSON.stringify(this.resume.educationlist[index]))
				this.editedushow=true
			},
			deleteeducation(index){
				let confirmmsg = confirm("确定删除此条教育背景？")
				if(confirmmsg){
					this.resume.educationlist.splice(index,1)
					this.editedushow=false
				}
			},
			pickedudegree(item){
				this.educationtmp.degree=item
				this.edudegreelistshow=false
			},
			pickrank(item){
				this.educationtmp.rank=item
				this.ranklistshow=false
			},
			adddescription(){
				this.descriptiontmp=''
				this.editdescriptionshow=true
			},
			canceleditdescription(){
				this.editdescriptionshow=false
			},
			savedescript(){
				this.resume.selfdescription = JSON.parse(JSON.stringify(this.descriptiontmp))
				this.editdescriptionshow=false
			},
			editdescription(){
				this.descriptiontmp = JSON.parse(JSON.stringify(this.resume.selfdescription))
				this.editdescriptionshow=true
			},
			uploadresume(){
				this.uploadboxshow=true
			},
			getresumefile(e){
				let file = e.target.files[0]
				this.resume.resumefilelist.push(file)
				let length = this.resume.resumefilelist.length
				console.log(this.resume.resumefilelist[length - 1])
				this.uploadboxshow=false
			},
			todiv(index){
				this.currentdiv = index
				let el = document.getElementById(this.divlist[index].div)
				window.scrollTo({"behavior":"smooth","top":el.offsetTop})
			},
			toTop(){
				body.scrollIntoView({behavior:'smooth'})
			}
		},
		watch:{
			'resume.expectjob':{
				handler(newval){
					if(newval !== undefined && newval !== null && !this.watcher[0]){
						this.chartdata_inc(20)
						this.watcher[0] = true
					}
				}
			},
			'resume.experiencelist':{
				handler(){
					if(this.resume.experiencelist !== undefined && this.resume.experiencelist !== null && this.resume.experiencelist.length !== 0 && !this.watcher[1]){
						this.chartdata_inc(30)
						this.watcher[1] = true
					}
					else if((this.resume.experiencelist === undefined || this.resume.experiencelist === null || this.resume.experiencelist.length === 0) && this.watcher[1]){
						this.chartdata_dec(30)
						this.watcher[1] = false
					}
				}
			},
			'resume.projectlist':{
				handler(){
					if(this.resume.projectlist !== undefined && this.resume.projectlist !== null && this.resume.projectlist.length !== 0 && !this.watcher[2]){
						this.chartdata_inc(20)
						this.watcher[2] = true
					}
					else if((this.resume.projectlist === undefined || this.resume.projectlist === null || this.resume.projectlist.length === 0) && this.watcher[2]){
						this.chartdata_dec(20)
						this.watcher[2] = false
					}
				}
			},
			'resume.educationlist':{
				handler(){
					if(this.resume.educationlist !== undefined && this.resume.educationlist !== null && this.resume.educationlist.length !== 0 && !this.watcher[3]){
						this.chartdata_inc(10)
						this.watcher[3] = true
					}
					else if((this.resume.educationlist === undefined || this.resume.educationlist === null || this.resume.educationlist.length === 0) && this.watcher[3]){
						this.chartdata_dec(10)
						this.watcher[3] = false
					}
				}
			},
			'resume.selfdescription':{
				handler(){
					if(this.resume.selfdescription !== undefined && this.resume.selfdescription !== null && !this.watcher[4]){
						this.chartdata_inc(5)
						this.watcher[4] = true
					}
					else if((this.resume.selfdescription === undefined || this.resume.selfdescription === null || this.resume.selfdescription === '') && this.watcher[4]){
						this.chartdata_dec(5)
						this.watcher[4] = false
						
					}
				}
			}
		}
	}
</script>

<style>
</style>