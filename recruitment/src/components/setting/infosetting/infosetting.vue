<template>
	<div class="content user_modifyContent">
		<dl class="c_section">
            <dt>
            	<h2><em></em>个人信息</h2>
            </dt>
            <dd>
            	<div class="basicEdit">
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
								        				</ul>
								          			</div>  
								      			</td>
								    		</tr>
								    		<tr>
										      	<td valign="top">
										        	<span class="redstar">*</span>
										      	</td> 
								      			<td colspan="3">
								          			<input type="text" v-validate="'required|min:11|max:11|tel'" placeholder="请输入手机号码" v-model="basicinfotmp.tel" style="width: 410px;" name="tel" id="tel">
								          			<el-alert :closable="false" :title="errors.first('tel')" type="error" v-show="errors.has('tel')"></el-alert>
								      
								      			</td>
								   			</tr>
								   			<tr>
								      			<td valign="top">
								        			<span class="redstar">*</span>
								      			</td> 
								      			<td colspan="3">
								          			<input type="text" v-validate="'required|email'" placeholder="请输入邮箱" v-model="basicinfotmp.email" style="width: 410px;" name="email" id="email">
								          			<el-alert :closable="false" :title="errors.first('email')" type="error" v-show="errors.has('email')"></el-alert>
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
											        	</ul>
								          			</div>  
								      			</td>
								    		</tr>
								    		<tr>
								      			<td></td> 
								      			<td colspan="3">
								          			<input type="submit" value="保 存" class="btn_profile_save" @click.prevent="savebasic">
								          			<!--<a class="btn_profile_cancel" @click.prevent="canceleditbasic">取 消</a>-->
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
		            		</div>
			</dd>
        </dl>
	</div>
</template>

<script>
	export default{
		name:"infosetting",
		data(){
			return{
				basicinfotmp:null,
				degreelist:null,
				workyearlist:null,
				currentstatelist:null,
				degreelistshow:false,
				workyearlistshow:false,
				currentstatelistshow:false
			}
		},
		created(){
			this.getdatas()
			this.dataInit()
		},
		methods:{
			pickdegree(item){
				this.basicinfotmp.degree = item
				this.degreelistshow = false
			},
			pickworkyear(item){
				this.basicinfotmp.workyear = item
				this.workyearlistshow = false
			},
			pickcurrentstate(item){
				this.basicinfotmp.currentstate = item
				this.currentstatelistshow = false
			},
			getresumeimg(e){
				
			},
			dataInit(){
				this.basicinfotmp = {
					username:'person',
						tel:'15813359',
						email:'1021478@qq.com',
						gender:'女',
						degree:'大专',
						workyear:'3年',
						currentstate:'我是应届毕业生',
						img:'../../../../static/images/default_headpic.png'
				}
			},
			getdatas(){
				this.$axios({
					method:"get",
					url:"/static/data/currentstatelist.json"
				}).then(res => {
					this.currentstatelist = res.data.currentstatelist
				})
				this.$axios({
					method:"get",
					url:"/static/data/degreelist.json"
				}).then(res => {
					this.degreelist = res.data.degreelist
				})
				this.workyearlist = ['应届毕业生','1年','2年','3年','4年','5年','6年','7年','8年','9年','10年','10年以上']
			}
		}
	}
</script>

<style>
</style>