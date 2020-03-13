<template>
	<div>
	<div id="body">
		<headert :navlist='2' :isCompany='true'></headert>
		<div id="container">
			<router-view :company="company">
				<h2 slot="slot1"><em></em>填写公司信息</h2>
			</router-view>
			<div class="clear"></div>
			<totop></totop>
		</div>
	</div>
	<footert></footert>
	</div>
</template>

<script>
	import footert from '../footer/footer'
	import headert from '../header/header'
	import totop from '../totop/totop'
	export default{
		name:"companyinfofillin",
		components:{
			footert,
			headert,
			totop
		},
		data(){
			return{
				company:null,
			}
		},
		created(){
			this.company = {}
			/*this.companyinit()
			console.log("this is company from index" + this.company)*/
		},
		methods:{
			/*companyinit(){
				this.company = {
					companydetail:{},
					products:[],
					intro:"",
					positions:[],
					stage:{},
					member:{},
					repolist:[]
				}
			}*/
		},
		watch:{
			/*company:{
				handler(newcompany,oldcompany){
					console.log('from index' + JSON.stringify(this.company))
				},
				immediate:true,
				deep:true
			}*/
		}
	}
</script>

<style>
</style>