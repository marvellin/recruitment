<template>
	<div id="login_bg">
			<div class="login_wrapper">
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
							<li @click="onEmp" :class="[emp?'current':'']">
								招人
								<input type="radio" value="1" name="type"/>
								<em v-show="emp"></em>
							</li>
						</ul>
						<input style="width: 306px;height: 42px;" type="text" id="email" name="email" tabindex="1" placeholder="请输入常用邮箱地址"/>
						<span class="error" style="display: none;" id="beError"></span>
						<input style="width: 306px;height: 42px;" type="password" id="password" name="password" tabindex="2" placeholder="请输入密码"/>
						<!--<label class="fl registerJianJu" for="checkbox">
							<input type="checkbox" id="checkbox" name="checkbox" checked class="checkbox valid"/>
							我已阅读并同意
							<router-link to="" target="_blank">《用户协议》</router-link>
						</label>-->
						<input type="submit" id="submitLogin" value="注     册"></input>
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
				job:false,
				emp:false
			}
		},
		methods:{
			onJob(){
				this.job = true
				this.emp = false
			},
			onEmp(){
				this.emp = true
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