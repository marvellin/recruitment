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
		<div class="resumeShow" style="height: 106px;">
			<router-link title="编辑在线简历" class="resumeImg" to="/myresume">
			    <!--<img src="../../../../../static/images/default_headpic.png">-->
			    <!--<img :src="resume.basicinfo.img">-->
			    <img src="../../../../static/images/default_headpic.png"/>
			</router-link>
			<div class="resumeIntro">
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
			    <div> 
			        {{resume.basicinfo.username}} / {{resume.basicinfo.gender}} / {{resume.basicinfo.degree}} / {{resume.basicinfo.workyear}}<br>
			        {{resume.experiencelist[0].post}} . {{resume.experiencelist[0].comname}} <br /> {{resume.educationlist[0].degree}} . {{resume.educationlist[0].school}}
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
		created(){
			this.$axios({
				method:"get",
				url:"http://127.0.0.1:3000/resume",
				params:{
					
				},
			}).then(res => {
				this.resume = res.data[0]
			}).catch(err => {
				console.log(err)
			})
		}
	}
</script>

<style>
</style>