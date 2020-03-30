<template>
	<div class="content_mid">
		<dl class="c_section c_section_mid">
			<dt>
				<slot name='slot1'></slot>
			</dt>
			<dd>
				<div class="c_text_1">背景深、规模大、发展快、氛围好…用优势吸引求职者吧！</div>
                <img width="668" height="56" class="c_steps" alt="第五步" src="../../../../static/images/step5.png">
                <!--<form method="post" action="http://www.lagou.com/c/saveProfile.json" id="infoForm">-->
                <form v-if="company">
                    <h3>公司介绍</h3> 
                    <textarea v-validate="'required|max:1000'" maxlength="1000" style="width: 624px;" placeholder="请分段详细描述公司简介、企业文化等" v-model="company.intro" name="companyProfile" id="companyProfile"></textarea>	
                    <div class="word_count">你还可以输入 <span>{{remainingwords}}</span> 字</div>
                    <el-alert style="width: 624px;height: 46px;" :closable="false" :title="errors.first('companyProfile')" type="error" v-show="errors.has('companyProfile')"></el-alert>
                    <div class="clear"></div>
                    <input type="button" @click="goback" value="上一步" class="btn_big fl">
                    <input type="button" @click.prevent="savecompany" id="step5Submit" value="保存，完成" class="btn_big fr">
                </form>
			</dd>
		</dl>
	</div>
</template>

<script>
	export default{
		name:"index",
		props:{
			/*company:{
				type:Object,
				required:true
			}*/
		},
		data(){
			return{
				company:null
			}
		},
		created(){
			this.dataInit()
		},
		computed:{
			myUserId(){
				return this.$store.state.userId()
			},
			remainingwords(){
				if(this.company.intro){
					return 1000 - this.company.intro.length
				}
				else{
					return 1000
				}
			}
		},
		methods:{
			goback(){
				this.$router.push({path:'/companyinfofillin/step4'})
			},
			dataInit(){
				/*if(!this.company.intro){
					this.company.intro = ""
				}*/
				this.$axios({
					method:'get',
					url:'/api/company/getByUserId',
					params:{
						userId:this.myUserId
					}
				}).then(res => {
					console.log(res)
					this.company = res.data.object
				}).catch(err => {
					console.log(err)
					this.$router.push({path:'*'})
				})
			},
			savecompany(){
				//提交数据到后台保存并跳转至成功页面
				this.$validator.validate().then((result) => {
			        if (result) {
			        	//把company数据提交到后台，并且保存成功后跳转到success页面
			        	this.$axios({
			        		method:'post',
			        		url:'/api/company/update',
			        		data:this.company,
			        		headers:{
			        			'Content-Type':'application/json'
			        		}
			        	}).then(res => {
			        		console.log(res)
			        		this.$router.push({path:'/companyinfofillin/success',query:{companyId:this.company.companyId}})
			        	}).catch(err => {
			        		console.log(err)
			        	})
			        }
			        else{
				        this.$message({
							type:'warn',
							message:"请先完善页面信息！"
						})
			        }
			    }).catch(err => {
			      		this.$message({
							type:'warn',
							message:"请先完善页面信息！"
						})
			      		console.log(err)
			    })
			}
		},
	}
</script>

<style>
</style>