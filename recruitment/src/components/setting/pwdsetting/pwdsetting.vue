<template>
	<div class="content user_modifyContent">
		<dl class="c_section">
            <dt>
            	<h2><em></em>修改密码</h2>
            </dt>
            <dd>
            	<form id="updatePswForm">
            		<table class="savePassword">
            			<tbody>
	            			<tr  v-if="myEmail">
	            				<td>登录邮箱</td>
	            				<td class="c7">{{myEmail}}</td>
	            			</tr>
	            			<tr>
	            				<td class="label">当前密码</td>
	            				<td>
	            					<input v-model="oldpwd" placeholder="当前密码" v-validate="'required|min:8|max:20|password'" type="password" maxlength="16" id="oldpassword" name="oldpassword" style="background-image: url(style/images/img/0CQnd2Jos49xUAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
	            					<el-alert style="width: auto;height: auto;" :closable="false" :title="errors.first('oldpassword')" type="error" v-show="errors.has('oldpassword')"></el-alert>
	            				</td>            				
	            			</tr>
	            			<tr>
	            				<td class="label">新密码</td>
	            				<td>
	            					<input v-model="newpwd" placeholder="新密码" v-validate="'required|min:8|max:20|password'" type="password" maxlength="16" id="newpassword" name="newpassword" style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
	            					<el-alert style="width: auto;height: auto;" :closable="false" :title="errors.first('newpassword')" type="error" v-show="errors.has('newpassword')"></el-alert>
	            				</td>
	            			</tr>
	            			<tr>
	            				<td class="label">确认密码</td>
	            				<td>
	            					<input v-model="confirpwd" placeholder="确认密码" v-validate="'required|min:8|max:20|password'" type="password" maxlength="16" id="confirmpassword" name="confirmpassword" style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
	            					<el-alert style="width: auto;height: auto;" :closable="false" :title="errors.first('confirmpassword')" type="error" v-show="errors.has('confirmpassword')"></el-alert>
	            					<el-alert style="width: auto;height: auto;" :closable="false" title="请确认两次密码输入相同" type="error" v-show="confirpwd!==newpwd&&!errors.has('confirmpassword')"></el-alert>
	            				</td>
	            			</tr>
	            			<tr>
	            				<td>&nbsp;</td>
	            				<td><input type="submit" @click.prevent="savenewpassword" value="保 存"></td>
	            			</tr>
            			</tbody>
            		</table>
				</form>
			</dd>
        </dl>
	</div>
</template>

<script>
	export default{
		name:"pwdsetting",
		data(){
			return{
				oldpwd:null,
				newpwd:null,
				confirpwd:null,
			}
		},
		computed:{
			myUserId(){
				return this.$store.state.userId()
			},
			myEmail(){
				return this.$store.state.email()
			}
		},
		methods:{
			savenewpassword(){
				this.$validator.validate().then((result) => {
					if (result) {
//					     	console.log(this.$validator)
					      	// 保存新密码
					      	if(this.confirpwd===this.newpwd){
					      		//将新密码提交到后台
					      		this.$axios({
					      			method:'get',
					      			url:'/api/reset',
					      			params:{
					      				userId:this.myUserId,
					      				oldPassword:this.oldpwd,
					      				newPassword:this.newpwd,
					      			}
					      		}).then(res=>{
					      			console.log(res)
					      			if(res.data.code==500){
					      				this.$message({
					      					type:'warn',
					      					message:res.data.msg
					      				})
					      			}
					      			else{
					      				this.$message({
					      					message:res.data.msg
					      				})
					      				/*this.oldpwd = this.newpwd = this.confirpwd = null
					      				this.errors.clear()*/
					      			}
					      		}).catch(err=>{
					      			console.log(err)
					      		})
//					      		console.log(this.newpwd)
					      	}
					      	else{
					      		this.$message({
									type:'warn',
									message:'请确认两次密码输入相同！'
								})
					      	}
					}
					else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善密码！'
							})
					}
			   	}).catch(err => {
			   			console.log(err)
			   			this.$message({
								type:'warn',
								message:'请先完善密码！'
						})
			   	})
			}
		}
	}
</script>

<style>
	.savePassword input[type="password"]{
		width: 422px;
		height: 46px;
	}
</style>