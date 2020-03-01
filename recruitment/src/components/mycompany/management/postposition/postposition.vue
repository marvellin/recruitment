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
			                                        </ul>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>月薪范围</td>
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
			                                	<td style="position: relative;">
			                                    	<input type="text" @click.stop="cityboxshow=true" readonly="readonly" style="width: 380px;height: 46px;" placeholder="请输入工作城市，如：北京" v-model="job.city" name="workAddress" id="workAddress">
			                                    	<dd style="top:-400px;position: absolute;background-color: white;border: solid #019875 2px;overflow: hidden;z-index: 110;" id="box_expectCity" class="searchlist_expectCity" :style="{'display':cityboxshow?'block':'none'}">
									            		<span class="bot"></span>
									            		<span class="top"></span>
										    			<dl>
											    			<dt>ABCDEF</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list1" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>GHIJ</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list2" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>KLMN</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list3" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>OPQR</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list4" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>STUV</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list5" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>WXYZ</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list6" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
										    		</dd>
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
	</div>

</template>

<script>
	import jobbox from './jobbox'
	import editor from '../../../editor/editor'
	export default{
		name:'postposition',
		created(){
			document.addEventListener('click',e => {
				let jobbox = document.getElementById("box_expectCity")
				if(jobbox && !jobbox.contains(e.target)){
					this.cityboxshow=false
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
				cityboxshow:false,
				experienceboxshow:false,
				degreeboxshow:false,
				jobtypelist:['全职','兼职','实习'],
				citylist:{
					hotcities:['北京','上海','广州','深圳','成都','杭州','武汉','南京'],
					list1:['北京','长春','成都','重庆','长沙','常州','东莞','大连','佛山','福州'],
					list2:['贵阳','广州','哈尔滨','合肥','海口','杭州','惠州','金华','济南','嘉兴'],
					list3:['昆明','廊坊','宁波','南昌','南京','南宁','南通'],
					list4:['青岛','泉州'],
					list5:['上海','石家庄','绍兴','沈阳','深圳','苏州','天津','太原','台州'],
					list6:['武汉','无锡','温州','西安','厦门','烟台','珠海','中山','郑州']
				},
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
			},
			pickcity(city){
				this.job.city = city
				this.cityboxshow = false
			}
		}
	}
</script>

<style>
</style>