<template>
	<div>
		<div class="resumeShow">
			<a title="预览在线简历" target="_blank" class="resumeImg" href="javascript:void(0)">
			    <!--<img src="../../../../../static/images/default_headpic.png">-->
			    <img v-if="resume.basicinfo.img" :src="resume.basicinfo.img">
			    <img v-else src="../../../../../static/images/default_headpic.png"/>
			</a>
			<div class="resumeIntro">
			    <h3 class="unread">
					<a target="_blank" :title="'预览'+resume.basicinfo.username+'的简历'" href="javascript:void(0)">
			            {{resume.basicinfo.username}}的简历
			        </a>
			        <em></em>
			    </h3> 
			    <span class="fr">投递时间：{{time}}</span>
			    <div> 
			        {{resume.basicinfo.username}} / {{resume.basicinfo.gender}} / {{resume.basicinfo.degree}} / {{resume.basicinfo.workyear}}<br>
			        {{resume.workExperienceList[0].post}} . {{resume.workExperienceList[0].comname}} | {{resume.educationList[0].degree}} . {{resume.educationList[0].schoole}}
			    </div>
			    <div class="jdpublisher">
					<span>
				        应聘职位：<a :title="position.name" target="_blank" href="javascript:void(0)">{{position.name}}</a>
				    </span>
			    </div>
			</div>
			<div class="links">
			    <slot name='slot1'></slot>
			    <slot name='slot2'></slot>
			</div>
		</div>
		<div class="contactInfo">
			<span class="c9">电话：</span>{{resume.basicinfo.tel}}   &nbsp;&nbsp;&nbsp;   
			<span class="c9">邮箱：</span><a href="javascript:void(0)">{{resume.basicinfo.email}}</a>
		</div>
	</div>
</template>

<script>
	export default{
		name:'resumebox',
		props:{
			resume:{
				type:Object
			},
			position:{
				type:Object
			},
			time:{}
		}
	}
</script>

<style>
</style>