<template>
	<div>
		<div v-show="!resume" style="text-align: center;font-weight: 600;line-height:40px;margin: 20px 10px;padding: 20px 10px;">
			您还没有在线简历，请前往编辑您的
			<router-link to="/myresume" style="color: #019875;">在线简历</router-link>
			<div>
				<img width="100px" height="100px" src="../../../../static/images/u=1065457796,2310451731&fm=26&gp=0.jpg"/>
			</div>
		</div>
		<ul v-if="resume" style="list-style: none;" class="reset resumeLists">
		<li class="onlineResume">
		<div class="resumeShow" style="height: 106px;" v-if="resume">
			<router-link title="编辑在线简历" class="resumeImg" to="/myresume">
			    <!--<img src="../../../../../static/images/default_headpic.png">-->
			    <!--<img :src="resume.basicinfo.img">-->
			    <img src="../../../../static/images/default_headpic.png"/>
			</router-link>
			<div class="resumeIntro" v-if="resume">
			    <h3 class="unread">
					<router-link title="编辑在线简历" to="/myresume">
			            {{resume.basicinfo.username}}
			        </router-link>
			        <em></em>
			    </h3>
			    <span class="fr" style="color: #019875;">
			    	<i></i>
			    	默认简历
			    </span>
			    <div v-if="resume.basicinfo"> 
			        {{resume.basicinfo.username}} / {{resume.basicinfo.gender}} / {{resume.basicinfo.degree}} / {{resume.basicinfo.workyear}}
			        <!--{{resume.workExperienceList[0].post}} . {{resume.workExperienceList[0].comname}} <br /> {{resume.educationList[0].degree}} . {{resume.educationList[0].school}}-->
			    </div>
			    <div v-if="resume.workExperienceList&&resume.workExperienceList.length>0">
			    	{{resume.workExperienceList[0].post}} . {{resume.workExperienceList[0].comname}}<!-- {{resume.educationList[0].degree}} . {{resume.educationList[0].school}}-->
			    </div>
			    <div v-if="resume.educationList&&resume.educationList.length>0">
			    	{{resume.educationList[0].degree}} . {{resume.educationList[0].school}}
			    </div>
			</div>
			<div class="links">
				<a @click.prevent="">设为默认简历</a>
			</div>
		</div>
		<div class="contactInfo">
			<span class="c9">电话：</span>{{resume.basicinfo.tel}}   &nbsp;&nbsp;&nbsp;   
			<span class="c9">邮箱：</span><a href="javascript:void(0)">{{resume.basicinfo.email}}</a>
		</div>
		</li>
		</ul>
	</div>
</template>

<script>
	export default{
		name:"online",
		data(){
			return{
				resume:null,
			}
		},
		computed:{
			myPersonId(){
				return this.$store.state.person.personId()
			}
		},
		methods:{
			dataInit(){
				this.$axios({
					method:'get',
					url:'/api/resume/getByPersonId',
					params:{
						personId:this.myPersonId
					}
				}).then(res=>{
					console.log(res)
					this.resume = res.data.object
				}).catch(err=>{
					console.log(err)
				})
			}
		},
		created(){
			this.dataInit()
		}
	}
</script>

<style>
</style>