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
						<router-link to="" target="_blank" style="color: #fff;">投个简历</router-link>
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
			this.companyid = this.$route.query.id
			this.getcurrentlist()
		},
		data(){
			return{
				companyid:null,
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
					this.$axios.get('http://127.0.0.1:3000/company',{params:{id:this.companyid}}).then(res => {
						this.positions = res.data[0].positions
						this.currentlist = this.positions.slice(
							(this.currentpage - 1) * this.limit,
							this.currentpage * this.limit
						)
					});
				}
			}
		}
	}
</script>

<style>
</style>