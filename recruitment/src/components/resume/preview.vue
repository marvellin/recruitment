<template>
	<!--<div>-->
	<div id="previewWrapper" v-if="resume !== null && resume !== undefined"><!--v-if="resume !== null && resume !== undefined"-->
        <div class="preview_header">
            <h1 title="jason的简历">{{resume.resumename}}</h1>
            <a title="返回" @click.prevent="goback" class="inline cboxElement">返回</a>
        </div><!--end .preview_header-->
		
        <div class="preview_content">
            <div class="profile_box" id="basicInfo">
                <h2>基本信息</h2>
                <div class="basicShow" v-if="resume.basicinfo">
                    <span>
                    	{{resume.basicinfo.username}} | {{resume.basicinfo.gender}}<br>
            			{{resume.basicinfo.degree}} | {{resume.basicinfo.workyear}}<br>
            			{{resume.basicinfo.tel}} | {{resume.basicinfo.email}}<br>
            		</span>
           			<div class="m_portrait">
                    	<div></div>
                    	<img v-if="resume.basicinfo.img" width="120" height="120" :alt="resume.basicinfo.username" :src="resume.basicinfo.img">
                    	<img v-else width="120" height="120" :alt="resume.basicinfo.username" src="../../../static/images/default_headpic.png">
                    </div>
                </div><!--end .basicShow-->
            </div><!--end #basicInfo-->
			
			<div class="profile_box" id="expectJob">
	            <h2>期望工作</h2>
	            <div class="expectShow" v-if="resume.expectJob">
	            {{resume.expectJob.city}}，{{resume.expectJob.type}}，{{resume.expectJob.salary}}，{{resume.expectJob.post}}
	            </div><!--end .expectShow-->
	        </div><!--end #expectJob-->
						
			<div class="profile_box" id="workExperience">
	            <h2>工作经历</h2>
	            <div class="experienceShow" v-if="resume.workExperienceList.length !== 0">
	                <ul class="wlist clearfix">
	                  	<li class="clear" v-for="(item,index) in resume.workExperienceList" :key='index'>
            				<span style="margin-left: 10px;font-size: 20px;" class="c9">{{item.startym}} —— {{item.endym}}</span>
	           				<div>
	           					<!--<img width="56" height="56" alt="上海辉硕科技有限公司" src="style/images/logo_default.png">-->
	           					<h3 style="margin-left: 10px;">{{item.post}} </h3>
	           					<h4 style="margin-left: 10px;">{{item.comname}}</h4>
	           				</div>
	           			</li>
	           		</ul>
	            </div><!--end .experienceShow-->
	        </div><!--end #workExperience-->
			
			<div class="profile_box" id="projectExperience">
	            <h2>项目经验</h2>
	            <div class="projectShow" v-if="resume.projectExperienceList.length !== 0">
	                <ul class="plist clearfix">
	                  	<li class="noborder" v-for="(item,index) in resume.projectExperienceList" :key='index'>
		            		<div class="projectList" style="border-bottom: solid 0.5px rgb(229, 229, 229);">
		            			<span class="c9" style="font-size: 20px;">
			            			{{item.startym}} —— {{item.endym}}
			            		</span>
			            		<div class="f16" style="margin: 5px 0;">
			            			{{item.proname}}，{{item.post}}
			            		</div>
			            		<div class="dl1">
			            			{{item.intro}}
			            		</div>
			            	</div>
	            		</li>
	            	</ul>
	            </div><!--end .projectShow-->
	        </div><!--end #projectExperience-->
						
			<div class="profile_box" id="educationalBackground">
	            <h2>教育背景</h2>
	            <div class="educationalShow" v-if="resume.educationList.length !== 0">
	                <ul class="elist clearfix">
	                  	<li class="clear" v-for="(item,index) in resume.educationList" :key='index'>
            				<span class="c9" style="font-size: 20px;">{{item.startyear}} —— {{item.endyear}}</span>
            				<div style="padding-left: 0;">
            					<h3>{{item.school}}</h3>
            					<h4>{{item.profession}}，{{item.degree}}，{{item.rank}}</h4>
            				</div>
            			</li>
            		</ul>
	            </div><!--end .educationalShow-->
	        </div><!--end #educationalBackground-->
						
			<div class="profile_box" id="selfDescription">
	            <h2>自我描述</h2>
	            <div class="descriptionShow" v-if="resume.selfdescription">
	            	{{resume.selfdescription}}
	            </div><!--end .descriptionShow-->
	        </div><!--end #selfDescription-->
			
		</div><!--end .preview_content-->
  	</div>
</template>

<script>
	export default{
		name:'preview',
//		props:['resume'],
		data(){
			return{
				resume:null,
				resumeId:-1,
			}
		},
		mounted(){
			
		},
		created(){
			this.resumeId = this.$route.query.resumeId
			console.log(this.$route)
			if(this.$route.query.resumeId!=undefined&&this.$route.query.resumeId!=null){
				this.resumeId = this.$route.query.resumeId
			}
			this.dataInit()
		},
		methods:{
			getCompanyImg(){
				this.$axios({
					method:'get',
					url:'/api/personImg/download',
					params:{
						personDetailId:this.resume.basicinfo.personDetailId
					},
					responseType:'arraybuffer'
				}).then(res=>{
						let blob = new Blob([res.data])
						console.log(blob)
						if(blob.size>0){
							console.log(blob)
							let url = window.URL.createObjectURL(blob)
							this.resume.basicinfo.img = url
							console.log(this.resume.basicinfo.img)
						}
						else{
							this.resume.basicinfo.img = null
						}
				}).catch(err=>{
					console.log(err)
				})
			},
			goback(){
				this.$router.go(-1)
			},
			dataInit(){
				this.$axios({
					method:'get',
					url:'/api/resume/get',
					params:{
						resumeId:this.resumeId
					}
				}).then(res=>{
					console.log(res)
					if(res.data.code==500){
						this.$router.push({
							path:'*'
						})
						this.$message({
							type:"warn",
							message:res.data.msg
						})
					}
					else{
						this.resume = res.data.object
						this.getCompanyImg()
					}
				}).catch(err=>{
					console.log(err)
				})
			}
		}
	}
</script>

<style>
</style>