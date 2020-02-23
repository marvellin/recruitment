<template>   		
	<div class="content">
		<dl class="company_center_content">
		    <dt>
		        <h1>
		            <em></em>
		                               发布新职位
		        </h1>
		    </dt>
		<dd>
		<form action="http://www.lagou.com/corpPosition/preview.html" method="post" id="jobForm">
		                            <table class="btm">
		                            	<tbody>
			                            	<tr>
			                                	<td width="25"><span class="redstar">*</span></td>
			                                	<td width="85">职位类别</td>
			                                	<td>
			                                    	<!--<input type="hidden" id="positionType" value="" name="positionType">-->
			                                        <input @click.stop="jobboxshow=true" :class="[jobboxshow?'selectrFocus':'']" type="text" readonly="readonly" style="width: 380px;height: 46px;" placeholder="请选择职位类别" :value="job.post" id="select_category" class="selectr selectr_380">      
			                                        <jobbox name="jobbox" :jobboxshow='jobboxshow' @getposttype='getposttype' @getpost='getpost'></jobbox>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>职位名称</td>
			                                	<td>
			                                    	<input type="text" style="width: 380px;height: 46px;" placeholder="请输入职位名称，如：产品经理" v-model="job.name" name="positionName" id="positionName">
                                                </td>
			                                </tr>
			                            	<tr>
			                                	<td></td>
			                                	<td>所属部门</td>
			                                	<td>
			                                    	<input type="text" style="width: 380px;height: 46px;" placeholder="请输入所属部门" v-model="job.department" name="department" id="department">	
			                                    </td>
			                                </tr>
		                            	</tbody>
		                            </table>
		                            
		                            <table class="btm">
		                            	<tbody>
		                            		<tr>
			                                	<td width="25"><span class="redstar">*</span></td>
			                                	<td width="85">工作性质</td>
			                                	<td>
			                                    	<ul class="profile_radio clearfix reset">
			                                    		<li style="width: 46px;height: 46px;" v-for="(item,index) in jobtypelist" :key='index' :class="[item==job.type?'current':'']" @click="job.type=item">
			                                    			{{item}}<em></em>
			                                    			<input type="radio" name="jobNature" :value="item"/>
			                                    		</li>
			                                    		<!--<li>
			                                                                                                                             全职<em></em>
			                                                <input type="radio" name="jobNature" value="全职"> 
			                                            </li>
			                                            <li>
			                                                                                                                             兼职<em></em>
			                                                <input type="radio" name="jobNature" value="兼职"> 
			                                            </li>
			                                            <li>
			                                                                                                                             实习<em></em>
			                                                <input type="radio" name="jobNature" value="实习"> 
			                                            </li>-->
			                                        </ul>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>月薪范围</td>
			                                    <!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
			                                	<td>
			                                    	<div class="salary_range">
			                                            <div>
			                                                <input type="text" style="width: 170px;height: 46px;" placeholder="最低月薪" v-model="job.salarymin" id="salaryMin" name="salaryMin"> 
			                                                <span>k</span>
			                                            </div>
			                                          
			                                            <div>
			                                                <input type="text" style="width: 170px;height: 46px;" placeholder="最高月薪" v-model="job.salarymax" id="salaryMax" name="salaryMax"> 
			                                                <span>k</span>
			                                            </div>
			                                            <span>只能输入整数，如：9</span>
			                                        </div>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>工作城市</td>
			                                	<td>
			                                    	<input type="text" style="width: 380px;height: 46px;" placeholder="请输入工作城市，如：北京" v-model="job.city" name="workAddress" id="workAddress">
			                                    </td>
			                                </tr>
		                            	</tbody>
		                            </table>
		
		                            <table class="btm">
		                            	<tbody>
		                            		<tr>
			                                	<td width="25"><span class="redstar">*</span></td>
			                                	<td width="85">工作经验</td>
			                                	<td @mouseleave="experienceboxshow=false">
			                                    	<!--<input type="hidden" id="experience" value="" name="workYear">-->
			                                        <input type="text" :class="[experienceboxshow?'selectrFocus':'']" @click="experienceboxshow=true" style="width: 380px;height: 46px;" readonly="readonly" placeholder="请选择工作经验" :value="job.experience" id="select_experience" class="selectr selectr_380">                                      
			                                        <div class="boxUpDown boxUpDown_380" style="width: 380px;" id="box_experience" :style="{'display':experienceboxshow?'block':'none'}">
			                                            <ul>
			                                            	<li v-for="(item,index) in experiencelist" :key='index' @click="job.experience=item;experienceboxshow=false">
			                                            		{{item}}
			                                            	</li>
			                                                <!--<li>
			                                                    	不限
			                                                </li>
			                                        	 	<li>
			                                                                                                                                                  应届毕业生
			                                                </li>
			                                        	 	<li>
			                                                        1年以下
			                                                </li>
			                                        	 	<li>
			                                                        1-3年
			                                                </li>
			                                        	 	<li>
			                                                        3-5年
			                                                </li>
			                                        	 	<li>
			                                                        5-10年
			                                                </li>
			                                        	 	<li>
			                                                        10年以上
			                                                </li>-->
			                                        	</ul>
			                                    	</div>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>学历要求</td>
			                                    <!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
			                                	<td @mouseleave="degreeboxshow=false">
			                                    	<!--<input type="hidden" id="education" value="" name="education">-->
			                                        <input type="text" style="width: 380px;height: 46px;" @click="degreeboxshow=true" :class="[degreeboxshow?'selectrFocus':'']" readonly placeholder="请选择学历要求" :value="job.degree" id="select_education" class="selectr selectr_380">                                      
			                                        <div style="width: 380px;" class="boxUpDown boxUpDown_380" id="box_education" :style="{'display':degreeboxshow?'block':'none'}">
			                                            <ul>
			                                            	<li v-for="(item,index) in degreelist" :key='index' @click="job.degree=item;degreeboxshow=false">
			                                            		{{item}}
			                                            	</li>
			                                                <!--<li>
			                                                        	不限
			                                                </li>
			                                        	 	<li>
			                                                        	大专
			                                                </li>
			                                        	 	<li>
			                                                        	本科
			                                                </li>
			                                        	 	<li>
			                                                       	 	硕士
			                                                </li>
			                                        	 	<li>
			                                                       		 博士
			                                                </li>-->
			                                        	</ul>
			                                    	</div>
			                                    </td>
			                                </tr>
		                            	</tbody>
		                            </table>
		                           
		                            <table class="btm">
		                            	<tbody>
		                            		<tr>
			                                	<td width="25"><span class="redstar">*</span></td>
			                                	<td width="85">职位诱惑</td>
			                                	<td>
			                                    	<input type="text" style="width: 560px;height: 46px;" placeholder="20字描述该职位的吸引力，如：福利待遇、发展前景等" v-model="job.advantage" name="positionAdvantage" class="input_520" id="positionAdvantage">
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>职位描述</td>
			                                	<td>
			                                    	<span class="c9 f14">(建议分条描述工作职责等。请勿输入公司邮箱、联系电话及其他外链)</span>
			                                    	
			                                    	<editor @getcontent="getdetail"></editor>
			                                    	<!--<editor v-model='job.detail'></editor>-->
			                                        <!--<textarea name="positionDetail" id="positionDetail" class="tinymce" style="display: none;" aria-hidden="true"></textarea>
			                                        <span role="application" aria-labelledby="positionDetail_voice" id="positionDetail_parent" class="mceEditor defaultSkin">
			                                        	<span class="mceVoiceLabel" style="display:none;" id="positionDetail_voice">富文本域</span>
			                                        	<table cellspacing="0" cellpadding="0" role="presentation" id="positionDetail_tbl" class="mceLayout" style="width: 544px; height: 276px;">
			                                        		<tbody>
			                                        			<tr role="presentation" class="mceFirst">
			                                        				<td class="mceToolbar mceLeft mceFirst mceLast" role="toolbar">
			                                        					<div aria-labelledby="positionDetail_toolbargroup_voice" role="group" id="positionDetail_toolbargroup" tabindex="-1">
			                                        						<span role="application">
			                                        							<span style="display:none;" class="mceVoiceLabel" id="positionDetail_toolbargroup_voice">工具栏</span>
			                                        							<table align="" cellspacing="0" cellpadding="0" tabindex="-1" role="presentation" class="mceToolbar mceToolbarRow1 Enabled" id="positionDetail_toolbar1" aria-disabled="false" aria-pressed="false">
			                                        								<tbody>
			                                        									<tr>
			                                        										<td class="mceToolbarStart mceToolbarStartButton mceFirst">
			                                        											
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="粗体(Ctrl B)" aria-labelledby="positionDetail_bold_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_bold" href="javascript:;" id="positionDetail_bold" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_bold"></span>
			                                        												<span id="positionDetail_bold_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">粗体(Ctrl B)</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="斜体(Ctrl I)" aria-labelledby="positionDetail_italic_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_italic" href="javascript:;" id="positionDetail_italic" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_italic"></span>
			                                        												<span id="positionDetail_italic_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">斜体(Ctrl I)</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="下划线(Ctrl U)" aria-labelledby="positionDetail_underline_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_underline" href="javascript:;" id="positionDetail_underline" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_underline"></span>
			                                        												<span id="positionDetail_underline_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">下划线(Ctrl U)</span>
			                                        											
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<span tabindex="-1" aria-orientation="vertical" role="separator" class="mceSeparator"></span>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="左对齐" aria-labelledby="positionDetail_justifyleft_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_justifyleft" href="javascript:;" id="positionDetail_justifyleft" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_justifyleft"></span>
			                                        												<span id="positionDetail_justifyleft_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">左对齐</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="居中" aria-labelledby="positionDetail_justifycenter_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_justifycenter" href="javascript:;" id="positionDetail_justifycenter" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_justifycenter"></span>
			                                        												<span id="positionDetail_justifycenter_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">居中</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="右对齐" aria-labelledby="positionDetail_justifyright_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_justifyright" href="javascript:;" id="positionDetail_justifyright" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_justifyright"></span>
			                                        												<span id="positionDetail_justifyright_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">右对齐</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<span tabindex="-1" aria-orientation="vertical" role="separator" class="mceSeparator"></span>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="项目列表" aria-labelledby="positionDetail_bullist_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_bullist" href="javascript:;" id="positionDetail_bullist" role="button" tabindex="-1" aria-pressed="false">
			                                        												<span class="mceIcon mce_bullist"></span>
			                                        												<span id="positionDetail_bullist_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">项目列表</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="编号列表" aria-labelledby="positionDetail_numlist_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_numlist" href="javascript:;" id="positionDetail_numlist" role="button" tabindex="-1" aria-pressed="false">
			                                        												<span class="mceIcon mce_numlist"></span>
			                                        												<span id="positionDetail_numlist_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">编号列表</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<span tabindex="-1" aria-orientation="vertical" role="separator" class="mceSeparator"></span>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="减少缩进" aria-labelledby="positionDetail_outdent_voice" onclick="return false;" onmousedown="return false;" class="mceButton mce_outdent mceButtonDisabled" href="javascript:;" id="positionDetail_outdent" role="button" tabindex="-1" aria-disabled="true">
			                                        												<span class="mceIcon mce_outdent"></span>
			                                        												<span id="positionDetail_outdent_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">减少缩进</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="增加缩进" aria-labelledby="positionDetail_indent_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_indent" href="javascript:;" id="positionDetail_indent" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_indent"></span>
			                                        												<span id="positionDetail_indent_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">增加缩进</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<span tabindex="-1" aria-orientation="vertical" role="separator" class="mceSeparator"></span>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="撤销 (Ctrl Z)" aria-labelledby="positionDetail_undo_voice" onclick="return false;" onmousedown="return false;" class="mceButton mce_undo mceButtonDisabled" href="javascript:;" id="positionDetail_undo" role="button" tabindex="-1" aria-disabled="true">
			                                        												<span class="mceIcon mce_undo"></span>
			                                        												<span id="positionDetail_undo_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">撤销 (Ctrl Z)</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="恢复 (Ctrl Y)" aria-labelledby="positionDetail_redo_voice" onclick="return false;" onmousedown="return false;" class="mceButton mce_redo mceButtonDisabled" href="javascript:;" id="positionDetail_redo" role="button" tabindex="-1" aria-disabled="true">
			                                        												<span class="mceIcon mce_redo"></span>
			                                        												<span id="positionDetail_redo_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">恢复 (Ctrl Y)</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<span tabindex="-1" aria-orientation="vertical" role="separator" class="mceSeparator"></span>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="插入/编辑 超链接" aria-labelledby="positionDetail_link_voice" onclick="return false;" onmousedown="return false;" class="mceButton mce_link mceButtonDisabled" href="javascript:;" id="positionDetail_link" role="button" tabindex="-1" aria-disabled="true">
			                                        												<span class="mceIcon mce_link"></span>
			                                        												<span id="positionDetail_link_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">插入/编辑 超链接</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="取消超链接" aria-labelledby="positionDetail_unlink_voice" onclick="return false;" onmousedown="return false;" class="mceButton mce_unlink mceButtonDisabled" href="javascript:;" id="positionDetail_unlink" role="button" tabindex="-1" aria-disabled="true">
			                                        												<span class="mceIcon mce_unlink"></span>
			                                        												<span id="positionDetail_unlink_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">取消超链接</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<span tabindex="-1" aria-orientation="vertical" role="separator" class="mceSeparator"></span>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="插入水平线" aria-labelledby="positionDetail_hr_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_hr" href="javascript:;" id="positionDetail_hr" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_hr"></span>
			                                        												<span id="positionDetail_hr_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">插入水平线</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="切换全屏模式" aria-labelledby="positionDetail_fullscreen_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_fullscreen" href="javascript:;" id="positionDetail_fullscreen" role="button" tabindex="-1" aria-pressed="false">
			                                        												<span class="mceIcon mce_fullscreen"></span>
			                                        												<span id="positionDetail_fullscreen_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">切换全屏模式</span>
			                                        											</a>
			                                        										</td>
			                                        										<td style="position: relative">
			                                        											<a title="插入/编辑 图片" aria-labelledby="positionDetail_image_voice" onclick="return false;" onmousedown="return false;" class="mceButton mceButtonEnabled mce_image" href="javascript:;" id="positionDetail_image" role="button" tabindex="-1">
			                                        												<span class="mceIcon mce_image"></span>
			                                        												<span id="positionDetail_image_voice" style="display: none;" class="mceVoiceLabel mceIconOnly">插入/编辑 图片</span>
			                                        											</a>
			                                        										</td>
			                                        										<td class="mceToolbarEnd mceToolbarEndButton mceLast">
			                                        											
			                                        										</td>
			                                        									</tr>
			                                        								</tbody>
			                                        							</table>
			                                        						</span>
			                                        					</div>
			                                        					<a onfocus="tinyMCE.getInstanceById('positionDetail').focus();" title="转到工具按钮 - Alt-Q，转到编辑器 - Alt-Z，转到元素路径 - Alt-X。" accesskey="z" ></a>
			                                        				</td>
			                                        			</tr>
			                                        			<tr class="mceLast">
			                                        				<td class="mceIframeContainer mceFirst mceLast">
			                                        					<iframe frameborder="0" id="positionDetail_ifr" src="javascript:&quot;&quot;" allowtransparency="true" title="富文本域按 ALT-F10 定位到工具栏.按 ALT-0 获取帮助。" style="width: 100%; height: 253px; display: block;"></iframe>
			                                        				</td>
			                                        			</tr>
			                                        		</tbody>
			                                        	</table>
			                                        </span> --> 
			                                    </td>
			                                </tr>
			                                <tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>工作地址</td>
			                                	<td>
			                                    	<input type="text" style="width: 560px;height: 46px;" placeholder="请输入详细的工作地址" v-model="job.address" name="positionAddress" class="input_520" id="positionAddress">	
			                                        <!--<input type="hidden" value="" name="positionLng" id="lng">
			                            			<input type="hidden" value="" name="positionLat" id="lat">-->
			                                        <!--<div class="work_place f14">我们将在职位详情页以地图方式精准呈现给用户  <a id="mapPreview" href="javascript:;">预览地图</a></div>-->
			                                    </td>
			                                </tr>
		                            	</tbody>
		                            </table>
		                            
		                            <table>
		                            	<tbody>
			                                <tr>
			                                	<td width="25"></td>
			                                	<td colspan="2">
			                                    	<input type="button" value="预览" id="jobPreview" class="btn_32 fl">
			                                    	<input type="button" @click="postposition" value="发布" id="formSubmit" class="btn_32 fr">
			                                    </td>
			                                </tr>
		                         		</tbody>
		                            </table>
		</form>
		</dd>
		</dl>
	</div><!-- end .content -->

<!------------------------------------- 弹窗lightbox ----------------------------------------->
				<!--联系方式弹窗-->	
				<!--<div style="display:none;">
				        <div style="height:180px;" class="popup" id="telTip">
					        <form id="telForm">
					        	<table width="100%">
					            	<tbody><tr>
					            		<td align="center" class="f18">留个联系方式方便我们联系你吧！</td>
					            	</tr>
					            	<tr>
					                	<td align="center">
											<input type="text" maxlength="49" placeholder="请输入你的手机号码或座机号码" name="tel">
											<span style="display:none;" class="error" id="telError"></span>
										</td>
					                </tr>
					                <tr>
					                	<td align="center">
					                		<input type="submit" value="提交" class="btn">
					                	</td>
					                </tr>
					            </tbody></table>
				            </form>
				        </div>
				</div>-->
<!------------------------------------- end ----------------------------------------->

</template>

<script>
	import jobbox from './jobbox'
	import editor from '../../../editor/editor'
	export default{
		name:'postposition',
		created(){
			document.addEventListener('click',e => {
				let jobbox = document.getElementById("box_job")
				if(jobbox && !jobbox.contains(e.target)){
					this.jobboxshow=false
				}
			})
		},
		components:{
			jobbox,
			editor
		},
		data(){
			return{
				jobboxshow:false,
				experienceboxshow:false,
				degreeboxshow:false,
				jobtypelist:['全职','兼职','实习'],
				experiencelist:['不限','应届毕业生','1年以下','1-3年','3-5年','5-10年'],
				degreelist:['不限','大专','本科','硕士','博士'],
				job:{
					post:null,//工作类别
					name:null,//具体工作名称
					type:null,//兼职，全职或实习
					department:null,
					salarymin:null,
					salarymax:null,
					city:null,
					experience:null,
					degree:null,
					advantage:null,
					detail:null,
					address:null
				}
			}
		},
		methods:{
			postposition(){
				if(this.job){
					this.$axios.post('http://127.0.0.1:3000/position',this.job).then(res => {
						console.log(res)
					}).catch(err => {
						console.log(err)
					})
				}
			},
			getdetail(v){
//				console.log(v)
				this.job.detail = v
//				console.log(this.job.detail)
			},
			getposttype(type){
				this.job.post = type
				this.jobboxshow = false
			},
			getpost(post){
				this.job.name = post.name
				this.getposttype(post.type)
			},
			showjob(){
				console.log(this.job)
			}
		}
	}
</script>

<style>
</style>