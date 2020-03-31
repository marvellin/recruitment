<template>
	<div>
		<div id="body">
			<headert></headert>
			<div id="container">
				<!--<div class="content user_modifyContent">-->
					<dl class="c_section">
			            <dt>
			            	<h2><em></em>完善个人信息</h2>
			            </dt>
			            <dd>
			            	<div class="basicEdit">
					            			<form id="profileForm" v-if="basicinfotmp">
											  	<table>
											    	<tbody>
											    		<tr>
											      			<td valign="top">
											        			<span class="redstar">*</span>
											      			</td> 
											      			<td>
											        			<input v-validate="'required|username'" data-vv-scope="basicinfo" type="text" placeholder="姓名" v-model="basicinfotmp.username" name="username_s" id="name">
											        			<!--<el-alert style="width: 190px;height: 46px;" :closable="false" :title="errors.first('basicinfo.username_s')" type="error" v-show="errors.has('basicinfo.username_s')"></el-alert>-->
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
											    			<td></td>
											    			<td colspan="3">
											    				<el-alert style="width: auto;height: auto;" :closable="false" :title="errors.first('basicinfo.username_s')" type="error" v-show="errors.has('basicinfo.username_s')"></el-alert>
											    			</td>
											    		</tr>
											    		<tr>
														    <td valign="top">
														      	<span class="redstar">*</span>
														    </td> 
											     			<td @mouseleave="degreelistshow=false">
														        <input v-validate="'required'" data-vv-scope="basicinfo" type="text" readonly="readonly" placeholder="最高学历" :value="basicinfotmp.degree" name="degreemax" @click="degreelistshow=true" id="select_topDegree" class="profile_select_190 profile_select_normal">
														        <el-alert style="width: 190px;height: 46px;" :closable="false" :title="errors.first('basicinfo.degreemax')" type="error" v-show="errors.has('basicinfo.degreemax')"></el-alert>
														        
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
														        <input v-validate="'required'" data-vv-scope="basicinfo" type="text" readonly="readonly" placeholder="工作经验" :value="basicinfotmp.workyear" id="select_workyear" name="select_workyear" @click="workyearlistshow=true" class="profile_select_190 profile_select_normal">
														        <el-alert style="width: 190px;height: 46px;" :closable="false" :title="errors.first('basicinfo.select_workyear')" type="error" v-show="errors.has('basicinfo.select_workyear')"></el-alert>
														        
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
											          			<input data-vv-scope="basicinfo" type="text" v-validate="'required|min:11|max:11|tel'" placeholder="请输入手机号码" v-model="basicinfotmp.tel" style="width: 410px;" name="tel" id="tel">
											          			<el-alert :closable="false" :title="errors.first('basicinfo.tel')" type="error" v-show="errors.has('basicinfo.tel')"></el-alert>
											      
											      			</td>
											   			</tr>
											   			<tr>
											      			<td valign="top">
											        			<span class="redstar">*</span>
											      			</td> 
											      			<td colspan="3">
											          			<input data-vv-scope="basicinfo" type="text" v-validate="'required|email'" placeholder="请输入邮箱" v-model="basicinfotmp.email" style="width: 410px;" name="email" id="email">
											          			<el-alert :closable="false" :title="errors.first('basicinfo.email')" type="error" v-show="errors.has('basicinfo.email')"></el-alert>
											      			</td>
											    		</tr>
											    		<tr>
											      			<td valign="top"> </td> 
											      			<td colspan="3" @mouseleave="currentstatelistshow=false">
											          			<!--<input type="hidden" id="currentState" value="" name="currentState">-->
											          			<input style="width: 410px;" v-validate="'required'" data-vv-scope="basicinfo" type="text" readonly="readonly" placeholder="目前状态" @click="currentstatelistshow=true" :value="basicinfotmp.currentstate" id="select_currentState" name="select_currentState" class="profile_select_410 profile_select_normal">
											          			<el-alert style="width: 190px;height: 46px;" :closable="false" :title="errors.first('basicinfo.select_currentState')" type="error" v-show="errors.has('basicinfo.select_currentState')"></el-alert>
											          			
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
											          			<input type="submit" value="保 存" class="btn_profile_save fr" @click.prevent="savebasic">
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
											    	<img v-if="basicinfotmp&&basicinfotmp.img" width="120" height="120" :src="basicinfotmp.img">
											    	<img v-else width="120" height="120" src="../../../static/images/default_headpic.png">
											    	<span>更换头像</span>
											  	</div>
											  	<input type="file" accept="image/jpeg,image/png,image/jp2,image/gif" title="支持jpg、jpeg、gif、png格式，文件小于5M" @change="getresumeimg" name="headPic" id="headPic" class="myfiles">
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
				<!--</div>-->
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
		name:"infosetting",
		components:{
			headert,
			footert,
			totop
		},
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
		computed:{
			myPersonId(){
				return this.$store.state.person.personId()
			}
		},
		created(){
			this.getdatas()
			this.dataInit()
		},
		methods:{
			savebasic(){
				var validateScope = 'basicinfo'
				this.$validator.validate(validateScope + '.*').then((result) => {
					if (result) {
//					     	console.log(this.$validator)
					      	// 保存个人基本信息
					      	if(this.basicinfotmp){
					      		//把basicinfo数据根据用户id提交到后台保存
					      		this.$axios({
					      			method:'post',
					      			url:'/api/personDetail/update',
					      			data:this.basicinfotmp,
					      			headers:{
					      				'Content-Type':'application/json'
					      			}
					      		}).then(res=>{
					      			console.log(res)
					      			if(res.data.code==500){
					      				this.$message({
					      					type:"warn",
					      					message:res.data.msg		
					      				})
					      			}
					      			else{
					      				this.$message({
					      					message:'保存成功！'		
					      				})
					      				this.dataInit()
					      			}
					      		}).catch(err=>{
					      			console.log(err)
					      		})
					      		console.log(this.basicinfotmp)
					      	}
					      	else{
					      		this.$message({
									type:'warn',
									message:'请先完善个人基本信息！'
								})
					      	}
					}
					else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善个人基本信息！'
							})
					}
			   	}).catch(err => {
			   			console.log(err)
			   			this.$message({
								type:'warn',
								message:'请先完善个人基本信息！'
						})
			   	})
			},
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
				let _this = this
				var files = e.target.files[0]
				if(!e || !window.FileReader) return
				let reader = new FileReader()
				reader.readAsDataURL(files)
				reader.onloadend = function(){
					_this.basicinfotmp.img = this.result
				}
			},
			dataInit(){
				//从后台获取basicinfo数据赋给basicinfotmp，这里模拟最终获取数据并展示出来
				this.$axios({
					method:'get',
					url:'/api/personDetail/getByPersonId',
					params:{
						personId:this.myPersonId
					}
				}).then(res=>{
					console.log(res)
					this.basicinfotmp = res.data.object
					if(this.basicinfotmp.gender==null){
						this.basicinfotmp.gender='男'
					}
					if(this.basicinfotmp.email==null){
						this.basicinfotmp.email = this.$store.state.email()
					}
					if(this.basicinfotmp.currenttate==null){
						this.basicinfotmp.currenttate='我是应届毕业生'
					}
				}).catch(err=>{
					console.log(err)
				})
				/*this.basicinfotmp = {
						username:'person',
						tel:'15813359',
						email:'1021478@qq.com',
						gender:'女',
						degree:'大专',
						workyear:'3年',
						currentstate:'我是应届毕业生',
						img:'../../../../static/images/default_headpic.png'
				}*/
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