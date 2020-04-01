<template>
	<div class="content_mid">
		<dl class="c_section c_section_mid">
			<dt>
				<slot name='slot1'></slot>
			</dt>
			<dd>
				<div class="c_text_1">展示强劲的管理团队，让求职者跟随而来吧！</div>
                <img width="668" height="56" class="c_steps" alt="第三步" src="../../../../static/images/step3.png">
                    
                <!--<form method="post" action="http://www.lagou.com/cl/saveLeaderInfos.json" id="memberForm">-->
                <form v-if="company">
                    <div id="memberDiv">
		                <div class="formWrapper">
		                    <!--<input type="hidden" value="25927" name="leaderInfos[0].companyId">-->
		                    <div class="new_portrait">
		                        <!--<div class="portrait_upload" v-if="!company.companyMember.img" id="portraitNo0">
		                            <span>上传负责人头像</span>
		                        </div>-->
		                        <div class="portraitShow" id="portraitShow0">
			                        <img v-if="company.companyMember&&company.companyMember.img" width="120" height="120" :src="company.companyMember.img">
			                        <img v-if="!company.companyMember||!company.companyMember.img" width="120" height="120" src="../../../../static/images/leader_default.png"/>
			                        <span>上传负责人头像</span>
			                    </div>
			                    <!--<input type="file" accept="image/jpeg,image/png,image/jp2,image/gif" @change="getcomimg" value="" title="支持jpg、jpeg、gif、png格式，文件小于5M" onchange="img_check(this,'http://www.lagou.com/c/upload.json',120,120,5,'myfiles0','myfiles0_error','portraitNo0','portraitShow0','type0','leaderInfos0');" name="myfiles" id="myfiles0" class="myfiles">-->
			                    <input type="file" accept="image/jpeg,image/png,image/jp2,image/gif" @change="setMemberImg" title="支持jpg、jpeg、gif、png格式，文件小于5M" name="myfiles" id="myfiles0" class="myfiles">
		                        <em>
								         尺寸：120*120px <br> 	
								         大小：小于5M
		                        </em>
		                        <!--<span style="display:none;" id="myfiles0_error" class="error"></span>-->
		                    </div>
		                        
		                        
		                    <h3>负责人姓名</h3>
		                    <input type="text" v-validate="'required|membername|max:20'" v-model="company.companyMember.name" style="width: 416px;height: 46px;" placeholder="请输入负责人姓名" name="membername" id="name0" class="s_input1 valid">	
		                    <el-alert style="width: 416px;height: 46px;" :closable="false" :title="errors.first('membername')" type="error" v-show="errors.has('membername')"></el-alert>
		                        
		                    <h3>当前职位</h3>
		                    <input type="text" v-validate="'required|nosymbol|max:20'" v-model="company.companyMember.post" style="width: 416px;height: 46px;" placeholder="请输入负责人当前职位，如：创始人兼CEO" name="memberposition" id="position0" class="s_input1 valid">	
		                    <el-alert style="width: 416px;height: 46px;" :closable="false" :title="errors.first('memberposition')" type="error" v-show="errors.has('memberposition')"></el-alert>
		                        
		                    <!--<h3>新浪微博</h3>
		                    <input type="text" placeholder="请输入创始人新浪微博地址" name="leaderInfos[0].weibo" id="weibo0">	-->
		                        
		                    <h3>负责人简介</h3> 
		                    <textarea v-validate="'required|max:500'" v-model="company.companyMember.intro"  placeholder="请输入该负责人的个人简介等，建议按照时间倒序分条展示" maxlength="1000" name="memberintro" id="description0"></textarea>	
		                    <el-alert style="height: 46px;width: 600px;" :closable="false" :title="errors.first('memberintro')" type="error" v-show="errors.has('memberintro')"></el-alert>
		                    <div class="word_count">你还可以输入 <span>{{remainingwords}}</span> 字</div>
		                </div>
	                </div>
                    	<!--<a id="addMember" class="add_member" href="javascript:void(0)"><i></i>继续添加创始团队</a>-->
                   	<div class="clear"></div>
					<input type="button" @click="goback" value="上一步" id="step2Submit" class="btn_big fl">
					<input type="submit" @click.prevent="goforward" value="下一步" id="step3Submit" class="btn_big fr">
                    <!--<a class="btn_cancel fr" href="http://www.lagou.com/c/product.html">跳过</a>-->
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
		computed:{
			myUserId(){
				return this.$store.state.userId()
			},
			remainingwords(){
				if(this.company.companyMember.intro){
					return 500 - this.company.companyMember.intro.length
				}
				else{
					return 500
				}
			}
		},
		data(){
			return{
				company:null
			}
		},
		mounted(){
//			console.log('from index3 mounted' + JSON.stringify(this.company))
		},
		created(){
			this.dataInit()
		},
		methods:{
			getMemberImg(){
				this.$axios({
					method:'get',
					url:'/api/memberImg/download',
					params:{
						companyMemberId:this.company.companyMember.companyMemberId
					},
					responseType:'arraybuffer'
				}).then(res=>{
						let blob = new Blob([res.data])
						if(blob.size>0){
							console.log(blob)
							let url = window.URL.createObjectURL(blob)
							this.company.companyMember.img = url
							console.log(this.company.companyMember.img)
						}
						else{
							this.company.companyMember.img = null
						}
				}).catch(err=>{
					console.log(err)
				})
			},
			setMemberImg(e){
				if(!this.company.companyMember.companyMemberId){
					this.company.companyMember.companyMemberId = -1
				}
				var memberImg = e.target.files[0]
				var formData = new FormData()
				formData.append('file',memberImg)
				formData.append('userId',this.$store.state.userId())
				formData.append('companyMemberId',this.company.companyMember.companyMemberId)
				this.$axios({
					method:'post',
					url:'/api/memberImg/upload',
					data:formData,
					headers:{
						'Content-Type':'multipart/form-data'
					},
					responseType:'arraybuffer'
				}).then(res=>{
					console.log(res)
					let blob = new Blob([res.data])
						if(blob.size>0){
							let url = window.URL.createObjectURL(blob)
							this.company.img = url
							console.log(this.company.img)
							this.$message({
								type:'warn',
								message:'上传成功！'
							})
						}
						else{
							this.company.img = null
						}
				}).catch(err=>{
					console.log(err)
				})
//				this.uploadimg(memberimg)
			},
			uploadimg(file){
				if(!file){
					return
				}
				var formData = new FormData()
				formData.append("file",file)
				this.$axios({
					method:'post',
					url:'/api/ossupload2preview',
					data:formData,
					headers:{
						'Content-Type':'multipart/form-data'
					},
					responseType:'arraybuffer'
				}).then(res => {
					const blob = new Blob([res.data])
//					console.log('beforeupdate')
					this.company.companyMember.img = URL.createObjectURL(blob)
//					console.log('afterupdate')
					console.log(this.company.companyMember.img)
					this.$message("上传成功!")
				}).catch(err => {
					this.$message("上传失败!")
					console.log(err)
				})
			},
			goforward(){
				this.$validator.validate().then((result) => {
			        if (result) {
			        	this.$axios({
			        		method:'post',
			        		url:'/api/companyMember/insert',
			        		data:this.company.companyMember,
			        		params:{
			        			companyId:this.company.companyId
			        		},
			        		headers:{
			        			'Content-Type':'application/json'
			        		}
			        	}).then(res => {
			        		this.$router.push({path:'/companyinfofillin/step4'})
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
			},
			goback(){
				this.$router.push({path:'/companyinfofillin/step2'})
			},
			dataInit(){
				/*if(!this.company.companyMember || this.company.companyMember == {}){
					this.company.companyMember = {
						name:null,
						img:null,
						post:null,
						intro:null
					}
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
					
					if(this.company.companyMember==undefined||this.company.companyMember==null||this.company.companyMember.name){
						this.company.companyMember={
							name:null,
							img:null,
							post:null,
							intro:null
						}
					}
					else{
						this.getMemberImg()
					}
				}).catch(err => {
					console.log(err)
					this.$router.push({path:'*'})
				})
			}
		},
	}
</script>

<style>
</style>