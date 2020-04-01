<template>
	<div style="background-color: #fafafa;margin-top: -20px;">
		<ul style="padding: 20px 20px;" class="reset my_jobs">
			<li v-for="(item,index) in currentlist" :key="index" style="position: relative;">
				<div>
					<h3>
					    <router-link target="_blank" title="" to="">{{item.name}}</router-link>
					    <span>[{{item.city}}]</span>
					</h3>
					<div class="apply" style="width: 80px;text-align: center;top: 0;">
						<a @click.prevent="delivery(item.positionId)" target="_blank" style="color: #fff;">投个简历</a>
					</div>
					<div>{{item.type}} / {{item.salarymin}}k-{{item.salarymax}}k / {{item.experience}} / {{item.degree}}及以上</div>
					<div class="c9">发布时间： {{item.deliverytime}}</div>
				</div>
			</li>
		</ul>
		<pagination @change="change" style="margin-left: 30%;" :total="gettotalpage" :limit="limit" :currentpage="currentpage"></pagination>
	</div>
</template>

<script>
	import pagination from '../../pagination/pagination'
	export default{
		name:"company_position",
		components:{
			pagination
		},
		created(){
//			console.log(this.$route)
			this.companyId = this.$route.query.companyId
//			console.log(this.companyId)
			this.getcurrentlist()
		},
		data(){
			return{
				companyId:null,
				positions:null,
				currentlist:null,
				limit:8,
				currentpage:1
			}
		},
		computed:{
			gettotalpage(){
				if(this.positions){
					return Math.ceil(this.positions.length / this.limit)
				}
				else{
					return 0
				}
			}
		},
		methods:{
			delivery(positionId){
				var myPersonId = this.$store.state.person.personId()
				if(!this.$store.state.isLogined()){
					this.$router.push({
						path:'/login'
					})
					this.$message({
						type:'warn',
						message:"请先登陆！"
					})
				}
				if(eval(this.$store.state.isCompany())){
					this.$message({
						type:'warn',
						message:'您无法投递简历！'
					})
				}
				else if(!eval(this.$store.state.isCompany()) && myPersonId){
					this.$axios({
						method:'get',
						url:'/api/delivery/insert',
						params:{
							positionId:positionId,
							personId:myPersonId
						}
					}).then(res => {
						console.log(res)
						if(res.data.code == 500){
							this.$message({
								type:'warn',
								message:res.data.msg
							})
						}
						else if(res.data.code == 200){
							this.$message({
								type:'info',
								message:'您已成功投递该职位！'
							})
						}
					}).catch(err => {
						console.log(err)
					})
				}
			},
			change(index){
				this.currentpage = index
				this.getcurrentlist()
			},
			getcurrentlist(){
				if(this.positions){
					this.currentlist = this.positions.slice(
						(this.currentpage - 1) * this.limit,
						this.currentpage * this.limit
					)
				}
				else{
					/*this.$axios.get('http://127.0.0.1:3000/company',{params:{id:this.companyid}}).then(res => {
						this.positions = res.data[0].positions
						this.currentlist = this.positions.slice(
							(this.currentpage - 1) * this.limit,
							this.currentpage * this.limit
						)
					});*/
					this.$axios({
						method:'get',
						url:'/api/position/getByCompanyId',
						params:{
							companyId:this.companyId
						}
					}).then(res => {
						console.log(res)
						this.positions = res.data.object
						this.currentlist = this.positions.slice(
							(this.currentpage - 1) * this.limit,
							this.currentpage * this.limit
						)
					}).catch(err => {
						console.log(err)
					})
						}
					}
		}
	}
</script>

<style>
</style>