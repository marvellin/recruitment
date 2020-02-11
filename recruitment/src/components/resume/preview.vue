<template>
	<!--<div>-->
	<div id="previewWrapper" v-if="resume !== null && resume !== undefined"><!--v-if="resume !== null && resume !== undefined"-->
        <div class="preview_header">
            <h1 title="jason的简历">{{resume.name}}</h1>
            <!--<a title="返回" @click.prevent="goback" class="inline cboxElement">返回</a>-->
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
                    	<img width="120" height="120" alt="jason" :src="resume.basicinfo.img">
                    </div>
                </div><!--end .basicShow-->
            </div><!--end #basicInfo-->
			
			<div class="profile_box" id="expectJob">
	            <h2>期望工作</h2>
	            <div class="expectShow" v-if="resume.expectjob">
	            {{resume.expectjob.city}}，{{resume.expectjob.type}}，{{resume.expectjob.salary}}，{{resume.expectjob.post}}
	            </div><!--end .expectShow-->
	        </div><!--end #expectJob-->
						
			<div class="profile_box" id="workExperience">
	            <h2>工作经历</h2>
	            <div class="experienceShow" v-if="resume.experiencelist.length !== 0">
	                <ul class="wlist clearfix">
	                  	<li class="clear" v-for="(item,index) in resume.experiencelist" :key='index'>
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
	            <div class="projectShow" v-if="resume.projectlist.length !== 0">
	                <ul class="plist clearfix">
	                  	<li class="noborder" v-for="(item,index) in resume.projectlist" :key='index'>
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
	            <div class="educationalShow" v-if="resume.educationlist.length !== 0">
	                <ul class="elist clearfix">
	                  	<li class="clear" v-for="(item,index) in resume.educationlist" :key='index'>
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
						
			<!--<div class="profile_box" id="worksShow">
	            <h2>作品展示</h2>
	            <div class="workShow">
	                <ul class="slist clearfix">
	                  	<li class="noborder">
            				<div class="workList c7">
	            				<div class="f16">网址：<a target="_blank" href="http://www.weimob.com">http://www.weimob.com</a></div>
	            				<p>产品 </p>
	            			</div>
            			</li>
            		</ul>
	            </div>
	        </div>-->
		</div><!--end .preview_content-->
  	</div>
  	<!--{{this.$route.params.resumetmp}}-->
  	<!--</div>-->
</template>

<script>
	export default{
		name:'preview',
//		props:['resume'],
		data(){
			return{
				resume:null
			}
		},
		mounted(){
			
		},
		created(){
//			console.log(this.$route.params.resume)
			this.resume = JSON.parse(sessionStorage.getItem('myresume'))
			sessionStorage.removeItem('myresume')
		},
		methods:{
			/*goback(){
				this.$router.go(-1)
			}*/
		}
	}
</script>

<style>
</style>