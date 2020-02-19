<template>
	<div>
		<div id="body">
			<headert :navlist='2' :isCompanylist='true'></headert>
			<div id="container">
				<sidebar>
					<div class="subscribe_side mt20" slot='slot1'>
						    <div class="f14">想收到更多更好的简历？</div>
						    <div class="f18 mb10">就用招聘加速助手 </div>
						    <div>咨询：<a class="f16" href="javascript:void(0)">1021478667@qq.com</a></div>
						    <div class="f18 ti2em">15813359257</div>
					</div>
					<div class="subscribe_side mt20" slot='slot2'>
						   <div class="f14">加入互联网HR交流群</div>
						   <div class="f18 mb10">跟同行聊聊</div>
						   <div class="f24">111101111</div>
					</div>
				</sidebar>
        		
		        <router-view/>

				<div class="clear"></div>
			    <totop></totop>
			</div>
		</div>
		<footert></footert>
	</div>
</template>

<script>
	import headert from '../../header/header'
	import footert from '../../footer/footer'
	import totop from '../../totop/totop'
	import sidebar from '../sidebar/sidebar'
	export default{
		name:'postjob',
		created(){},
		components:{
			headert,
			footert,
			totop,
			sidebar,
		},
		data(){
			return{
				
			}
		},
		methods:{
			
		}
	}
</script>

<style>
</style>