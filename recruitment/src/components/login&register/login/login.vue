<template>
		<div id="login_bg">
			<div class="login_wrapper">
				<div class="login_header">
					<!--<router-link to="">
						<img src="../../../../static/css/img/welcom2.png" width="300" height="75" alt="全国招聘第一站"/>
					</router-link>-->
					<div id="cloud_s" :style="{'margin-left':spx}"><img src="../../../../static/images/cloud_s.png" width="81" height="52" alt="cloud"></div>
					<div id="cloud_m" :style="{'margin-left':mpx}" @click='add'><img src="../../../../static/images/cloud_m.png" width="136" height="95"  alt="cloud"></div>
				</div>
				<div class="login_box">
					<form id="loginForm" action="">
						<input type="text" v-validate="'required|email'" style="width: 316px;height: 42px;margin-bottom: 0;" id="email" name="loginemail" v-model="login.email" tabindex="1" placeholder="请输入登陆邮箱地址"/>
						<el-alert style="width: 316px;height: 42px;" :closable="false" :title="errors.first('loginemail')" type="error" v-show="errors.has('loginemail')"></el-alert>
						<input type="password" v-validate="'required|min:8|max:20|password'" style="width: 316px;height: 42px;margin: 20px 0 0 0;" id="password" name="password" v-model="login.password" tabindex="2" placeholder="请输入密码"/>
						<el-alert style="width: 316px;height: 42px;" :closable="false" :title="errors.first('password')" type="error" v-show="errors.has('password')"></el-alert>
						<!--<span class="error" style="display: none;" id="beError"></span>-->
						<label class="fl" for="remember" style="margin-top: 10px;">
							<input type="checkbox" id="remember" value="" checked="checked" name="autoLogin"/>
							记住我
						</label>
						<router-link to="" class="fr" target="_blank" style="margin-top: 10px;">
							忘记密码？
						</router-link>
						<a @click.prevent="userlogin" style="color: #fff;" class="submitLogin" title="登陆">
							登&nbsp; &nbsp;陆
						</a>
					</form>
					<div class="login_right">
						<div>还没有账号？</div>
						<router-link to="/register" style="margin-bottom:80px;" class="registor_now">立即注册</router-link>
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
		name:'login',
		data(){
			return{
				spx:'0px',
				mpx:'0px',
				timer:'',
				login:{
					password:null,
					email:null
				}
			}
		},
		methods:{
			add(){
				this.mpx = (this.m++) + 'px' 
			},
			userlogin(){
				this.$validator.validate().then((result) => {
			        if (result) {
			        	//提交登陆数据到后台进行验证登陆，登陆成功则跳转至首页
			          this.$router.push({path:'/home'})
			        }
			        else{
				        this.$message({
							type:'warn',
							message:"请先完善登陆信息！"
						})
			        }
			      }).catch(err => {
			      		this.$message({
							type:'warn',
							message:"请先完善登陆信息！"
						})
			      		console.log(err)
			      })
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