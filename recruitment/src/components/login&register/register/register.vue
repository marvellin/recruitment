<template>
	<div id="login_bg">
			<div class="login_wrapper" style="padding-top: 10px;">
				<div class="login_header">
					<!--<router-link to="">
						<img src="../../../../static/css/img/welcom2.png" width="300" height="75" alt="全国招聘第一站"/>
					</router-link>-->
					<div id="cloud_s" :style="{'margin-left':spx}"><img src="../../../../static/images/cloud_s.png" width="81" height="52" alt="cloud"></div>
					<div id="cloud_m" :style="{'margin-left':mpx}"><img src="../../../../static/images/cloud_m.png" width="136" height="95"  alt="cloud"></div>
				</div>
				<div class="login_box">
					<form id="loginForm" action="">
						<ul class="register_radio clearfix">
							<li @click="onJob" :class="[job?'current':'']">
								找工作
								<input type="radio" value="0" name="type"/>
								<em v-show="job"></em>
							</li>
							<li @click="onEmp" :class="[!job?'current':'']">
								招人
								<input type="radio" value="1" name="type"/>
								<em v-show="!job"></em>
							</li>
						</ul>
						<input style="width: 306px;height: 42px;margin-bottom: 0;margin-top: 10px;" v-validate="'required|email'" v-model="register.email" type="text" id="email" name="loginemail" tabindex="1" placeholder="请输入常用邮箱地址"/>
						<el-alert style="width: 306px;height: 42px;" :closable="false" :title="errors.first('loginemail')" type="error" v-show="errors.has('loginemail')"></el-alert>

						<input style="width: 306px;height: 42px;margin-bottom: 0;margin-top: 10px;" v-validate="'required|min:8|max:20|password'" v-model="register.password" type="password" id="password" name="password" tabindex="2" placeholder="请输入密码"/>
						<el-alert style="width: 306px;height: 42px;" :closable="false" :title="errors.first('password')" type="error" v-show="errors.has('password')"></el-alert>

						<input style="width: 306px;height: 42px;margin-bottom: 0;margin-top: 10px;font-size: 16px;" @blur="checkpassword" v-validate="'required|min:8|max:20|password'" v-model="confirmpassword" type="password" id="confirmpassword" name="confirmpassword" tabindex="3" placeholder="请确认密码"/>
						<el-alert style="width: 306px;height: 42px;" :closable="false" :title="errors.first('confirmpassword')" type="error" v-show="errors.has('confirmpassword')&&passwordIssame"></el-alert>
						<el-alert style="width: 306px;height: 42px;" :closable="false" title="请确认两次密码输入相同" type="error" v-show="!passwordIssame"></el-alert>
						<!--<label class="fl registerJianJu" for="checkbox">
							<input type="checkbox" id="checkbox" name="checkbox" checked class="checkbox valid"/>
							我已阅读并同意
							<router-link to="" target="_blank">《用户协议》</router-link>
						</label>-->
						<input style="margin-top: 10px;" type="submit" id="submitLogin" @click.prevent="userregister" value="注     册"></input>
					</form>
					<div class="login_right">
						<div>已有账号</div>
						<router-link to="/login" style="margin-bottom:150px;" class="registor_now">直接登陆</router-link>
						<div></div>
						<router-link to="/home">返回首页</router-link>
					</div>
				</div>
				<div class="login_box_btm"></div>
			</div>
		</div>
</template>

<script>
	export default{
		name:'register',
		data(){
			return{
				spx:'0px',
				mpx:'0px',
				timer:'',
				job:true,
//				emp:false
				confirmpassword:null,
				register:{
					email:null,
					password:null
				},
				passwordIssame:true
			}
		},
		methods:{
			userregister(){
				this.$validator.validate().then((result) => {
			        if (result) {
			          if(this.passwordIssame){
			          	//根据用户类别，提交注册数据给后台，并在成功注册后跳转至完善用户信息页面（还没有写个人用户信息完善页面，暂时跳到登录页面）
			          	if(this.job){
			          		//提交个人用户注册信息到后台，返回成功则跳转
			          		this.$router.push({path:'/login'})
			          	}
			          	else{
			          		//提交公司用户注册信息到后台，返回成功则跳转
			          		this.$router.push({path:'/companyinfofillin'})
			          		this.$message({
			          			message:'请完善公司信息！'
			          		})
			          	}
			          }
			          else{
			          	this.$message({
							type:'warn',
							message:"请确认两次密码输入相同！"
						})
			          }
			        }
			        else{
				        this.$message({
							type:'warn',
							message:"请先完善注册信息！"
						})
			        }
			      }).catch(err => {
			      		this.$message({
							type:'warn',
							message:"请先完善注册信息！"
						})
			      		console.log(err)
			      })
			},
			checkpassword(){
				this.passwordIssame = this.confirmpassword === this.register.password
			},
			onJob(){
				this.job = true
//				this.emp = false
			},
			onEmp(){
//				this.emp = true
				this.job = false
			}
		},
		mounted(){
				let _this = this
				let i = 0
				let j = 0
				let tmp = -1
				_this.timer = setInterval(function(){
					if(i == 0 || i == 30){
						tmp = -tmp
					}
					i += tmp
					j -= tmp
					_this.mpx = i + 'px'
					_this.spx = j + 'px'
				},100)
		},
		beforeDestroy(){
			let _this = this
			clearInterval(_this.timer)
			_this.timer = null
			console.log("清除完毕")
		}
	}
</script>

<style>
	/*#login_bg{
		height: 100vh;
	}*/
</style>