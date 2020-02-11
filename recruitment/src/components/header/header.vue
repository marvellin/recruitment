<template>
	<div id="header">
			<div class="wrapper">
				<router-link class="logo" to="/home">
					<img width="229" height="60" alt="全国招聘第一站" src="../../../build/logo.png"/>
				</router-link>
				<ul id="navheader" class="reset">
					<!--<li :class="[currentnav==='/home'?'current':'']">
						<router-link to="/home">首页</router-link>
					</li>-->
					<li v-for="(item,index) in localnavlist" :class="[getpath===item.path?'current':'']">
						<router-link :to="item.path">{{item.name}}</router-link>
					</li>
					<li v-for="(item,index) in varnavlist" :class="[getpath===item.path?'current':'']">
						<router-link :to="item.path">{{item.name}}</router-link>
					</li>
					<!--<li class="current">
						<router-link to="/mycompany">公司</router-link>
					</li>
					<li>
						<router-link to="/forumHome" target="_blank">论坛</router-link>
					</li>
					<li>
						<router-link to="/resumesHome">简历管理</router-link>
					</li>
					<li>
						<router-link to="/postHome">发布职位</router-link>
					</li>-->
				</ul>
				<ul v-if="!isLogined&&isCompany" class="loginTop">
					<li>
						<router-link to="/login">登陆</router-link>
					</li>
					<li>|</li>
					<li>
						<router-link to='/register'>注册</router-link>
					</li>
				</ul>
				<dl v-if="isCompany" class="collapsible_menu" style="width: 165px;" :class="collapsibleshow?'expend':''" @mouseenter="entercollapsible" @mouseleave="leavecollapsible">
					<dt>
						<span>test&nbsp;</span>
						<span class="red dn" id="noticeDot-1"></span>
						<i></i>
					</dt>
					<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我发布的职位</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我收到的简历</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}" class="btm"><router-link to="">我的公司主页</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我要找工作</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">账号设置</router-link></dd>
					<dd :style="{'display':collapsibleshow?'block':'none'}" class="logout"><router-link to="">退出</router-link></dd>
				</dl>
				<dl v-if="!isCompany" class="collapsible_menu" style="width: 165px;" :class="collapsibleshow?'expend':''" @mouseenter="entercollapsible" @mouseleave="leavecollapsible">
						<dt>
							<span>person&nbsp;</span>
							<span class="red dn" id="noticeDot-1"></span>
							<i></i>
						</dt>
						<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我的简历</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我的收藏</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}" class="btm"><router-link to="">我的订阅</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">我要招人</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}"><router-link to="">账号设置</router-link></dd>
						<dd :style="{'display':collapsibleshow?'block':'none'}" class="logout"><router-link to="">退出</router-link></dd>
					</dl>
			</div>
		</div>
</template>

<script>
	export default{
		name:'headert',
		props:{
			navlist:{},
//			currentnav:{},
			isCompany:{//用于决定用户类型
				type:Boolean,
				default:false
			}
		},
		computed:{
			getpath(){
				return this.$route.path
			},
			isLogined(){
				return false
			}
		},
		created(){
			console.log(this.currentnav)
			console.log(this.isCompany)
			console.log(this.navlist)
			console.log(this.$route)
			if(this.navlist == '0'){//代表首页
				this.varnavlist = [{path:'/myresume',name:'我的简历'},{path:'',name:'发布职位'}]
			}
			else if(this.navlist == '1'){//代表个人用户页面
				this.varnavlist = [{path:'/myresume',name:'我的简历'}]
			}
			else if(this.navlist == '2'){//代表公司用户
				this.varnavlist = [{path:'',name:'简历管理'},{path:'',name:'发布职位'}]
			}
			console.log(this.varnavlist)
		},
		mounted(){
		},
		data(){
			return{
				collapsibleshow:false,
				varnavlist:null,
				localnavlist:[
					{
						path:'/home',
						name:'首页'
					},
					{
						path:'/mycompany',
						name:'公司'
					},
					{
						path:'',
						name:'论坛'
					},
				]
			}
		},
		methods:{
			entercollapsible(){
				this.collapsibleshow = true
			},
			leavecollapsible(){
				this.collapsibleshow = false
			}
		}
	}
</script>

<style>
</style>