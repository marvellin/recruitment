<template>
	<div>
	<div id="body">
		<headert :navlist='0' :isCompany='true'></headert>
		<div id="container">
			<div id="sidebar"><!--finish-->
				
				<mainNavs></mainNavs>
				<router-link class="subscribe" to="/subscribe" target="_blank">订阅职位</router-link>
			</div><!--end of sidebar-->
			<div class="content">
				
				<searchbox></searchbox>
				
				<dl class="hotSearch">
					<dt @click="clearUser">热门搜索：</dt>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'Java'}}">Java</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'PHP'}}">PHP</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'Android'}}">Android</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'IOS'}}">IOS</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'前端'}}">前端</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'产品经理'}}">产品经理</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'UI'}}">UI</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'运营'}}">运营</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'BD'}}">BD</router-link>
					</dd>
					<dd>
						<router-link :to="{path:'/positionlist',query:{positionName:'实习'}}">实习</router-link>
					</dd>	
				</dl>
				
				<homebanner></homebanner>
				
				<thumbs></thumbs>
				
				<ul class="reset hotabbing">
					<!--<li :class="[hottabbingShow?'current':'']" @click="hotabbingClick1">热门职位</li>-->
					<li class="current">最新职位</li>
				</ul>
				
				
				<hotlist :hottabbingShow='hottabbingShow'></hotlist>
				
				<div class="clear"></div>
				<div id="linkbox">
					<dl>
						<dt>友情链接</dt>
						<dd>
							<a href="http://www.zhuqu.com/" target="_blank">住趣家居网</a><span>|</span>
			        		<a href="http://www.woshipm.com/" target="_blank">人人都是产品经理</a> <span>|</span>
			        		<a href="http://zaodula.com/" target="_blank">互联网er的早读课</a><span>|</span>
			                <a href="http://lieyunwang.com/" target="_blank">猎云网</a><span>|</span>
			        		<a href="http://www.ucloud.cn/" target="_blank">UCloud</a><span>|</span>
			          		<a href="http://www.iconfans.com/" target="_blank">iconfans</a><span>|</span>
			          		<a href="http://www.html5dw.com/" target="_blank">html5梦工厂</a><span>|</span>
			          		<a href="http://www.sykong.com/" target="_blank">手游那点事</a> <span>|</span>
			          		<a href="http://www.php100.com/" target="_blank">php100</a> <span>|</span>
			          		<a href="http://www.uehtml.com/" target="_blank">uehtml</a> <span>|</span>
			          		<a href="http://www.w3cplus.com/" target="_blank">W3CPlus</a> <span>|</span>
			          		<a href="http://www.boxui.com/" target="_blank">盒子UI</a> <span>|</span>
			          		<a href="http://www.uimaker.com/" target="_blank">uimaker</a> <span>|</span>
			          		<a href="http://www.yixieshi.com/" target="_blank">互联网的一些事</a> <span>|</span>
			          		<a href="http://www.chuanke.com/" target="_blank">传课网</a> <span>|</span>
			          		<a href="http://www.eoe.cn/" target="_blank">安卓开发</a> <span>|</span>
			          		<a href="http://www.eoeandroid.com/" target="_blank">安卓开发论坛</a> <span>|</span>
			          		<a href="http://hao.360.cn/" target="_blank" >360安全网址导航</a> <span>|</span>
			          		<a href="http://se.360.cn/" target="_blank" >360安全浏览器</a> <span>|</span>
			          		<a href="http://www.hao123.com/" target="_blank" >hao123上网导航</a> <span>|</span>
			          		<a href="http://www.ycpai.com" target="_blank" >互联网创业</a><span>|</span>
			          		<a href="http://www.zhongchou.cn" target="_blank" >众筹网</a><span>|</span>
			          		<a href="http://www.marklol.com/" target="_blank" >马克互联网</a><span>|</span>
			          		<a href="http://www.chaohuhr.com/" target="_blank" >巢湖英才网</a><span>|</span>
			          		
			          		<a href="http://www.zhubajie.com/" target="_blank" >创意服务外包</a><span>|</span>
			          		<a href="http://www.thinkphp.cn/" target="_blank" >thinkphp</a><span>|</span>
			          		<a href="http://www.chuangxinpai.com/" target="_blank" >创新派</a><span>|</span>

			          		<a href="http://w3cshare.com/" target="_blank" >W3Cshare</a><span>|</span>
			          		<a href="http://www.518lunwen.cn/" target="_blank" >论文发表网</a><span>|</span>
			          		<a href="http://www.199it.com" target="_blank" >199it</a><span>|</span>

			          		<a href="http://www.shichangbu.com" target="_blank" >市场部网</a><span>|</span>
			          		<a href="http://www.meitu.com/" target="_blank" >美图公司</a><span>|</span>
			          		<a href="https://www.teambition.com/" target="_blank" >Teambition</a><span>|</span>
			          		<a href="http://oupeng.com/" target="_blank" >欧朋浏览器</a><span>|</span>
			          		<a href="http://iwebad.com/" target="_blank">网络广告人社区</a><span>|</span>
			          		<a href="h/af/flink.html" target="_blank" class="more">更多</a><span>|</span>
						</dd>
					</dl>
				</div>
			</div><!--end of content-->
			<div class="clear"></div>
			<a id="backtop" title="回到顶部" style="display: inline;" rel="nofollow" @click="toTop"></a>
		</div><!--end of container-->
	</div><!--end of body-->
	<!--<div id="footer">
		<div class="wrapper">
		</div>
	</div>-->
	<footert></footert>
	</div>
</template>

<script>
//	import lightbox from './lightbox/lightbox.vue'
	import hotlist from './hotlist/hotlist.vue'
	import mainNavs from './mainNavs/mainNavs.vue'
	import searchbox from './searchbox/searchbox.vue'
	import homebanner from './homebanner/homebanner.vue'
	import thumbs from './thumbs/thumbs.vue'
	import headert from '../header/header'
	import footert from '../footer/footer'
	
	export default{
		name:'home',
		created(){
//			this.$store.dispatch('userLogin',{loginEmail:"1021478631@qq.com",loginPassword:"root",router:this.$router})
//			this.$store.commit('person/setPerson',110)
			/*console.log(this.obj)
			this.obj.a = {tt:1,dd:2}
			/*this.$axios.get('/static/data/companylist.json').then((res) => {
				this.companylist = res.data.companylist
				console.log(this.companylist[0].name)
			})*/
		},
		components:{
			hotlist,
			mainNavs,
			searchbox,
			homebanner,
			thumbs,
			headert,
			footert
		},
		data(){
			return{
				hottabbingShow:true,
				navlist:[
					{
						name:'公司',
						path:'/mycompany'
					},
					{
						name:'论坛',
						path:''
					},
					{
						name:'我的简历',
						path:'/myresume'
					},
					{
						name:'发布职位',
						path:''
					},
				],
			}
		},
		methods:{
			clearUser(){
//				this.$store.commit("clear")
			},
			hotabbingClick1(){
				this.hottabbingShow = true
//				console.log(this.hottabbingShow)
			},
			hotabbingClick2(){
				this.hottabbingShow = false
//				console.log(this.hottabbingShow)
			},
			toTop(){
				body.scrollIntoView({behavior:'smooth'})
			}
		}
	}
</script>

<style>
	
</style>