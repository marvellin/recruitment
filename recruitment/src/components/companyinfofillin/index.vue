<template>
	<div>
	<div id="body">
		<headert :navlist='2' :isCompany='true'></headert>
		<div id="container">
			<router-view>
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
//				company:{},
			}
		},
		created(){
			/*this.$axios({
				method:'get',
				url:'/api/company/getByUserId',
				params:{
					userId:this.myUserId
				}
			}).then(res => {
				console.log(res)
				this.company = res.data.object
			}).catch(err => {
				console.log(err)
			})*/
//			this.dataInit()
		},
		computed:{
			myUserId(){
				return this.$store.state.userId()
			}
		},
		methods:{
			dataInit(){
				if(!this.company){
					this.company = {
						companyDetail:{
							fullname:null,
							shortname:null,
							feature:null,
							city:null,
							field:null,
							scale:null,
							comurl:null,
							scale:null,
							img:'../../../../static/images/logo_default.png',
	//						img:null,
							labelList:[]
						},
						productList:[],
						intro:"",
						positionList:[],
						companyStage:{},
						companyMember:{
							name:null,
							img:null,
							post:null,
							intro:null
						},
						reportList:[]
					}
				}
			}
			/*companyinit(){
				this.company = {
					companyDetail:{},
					productList:[],
					intro:"",
					positionList:[],
					companyStage:{},
					companyMember:{},
					reportList:[]
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