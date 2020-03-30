<template>
	<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1>
                    <em></em>
                                                     已下线职位                     
                </h1>
            </dt>
            <dd>
                <form id="searchForm" v-if="position2resumelist">
			        <ul class="reset my_jobs">
				        <li v-for="(item,index) in position2resumelist" :key='index'>
				        	<positionbox :position='item'>
								<a class="job_offline" @click="online(item)" href="javascript:void(0)" slot="slot2">上线</a> 
								<a class="job_del" @click="deletePosition(item)" href="javascript:void(0)" slot="slot3">删除</a>
				        	</positionbox>
		                </li>
	                </ul>
			    </form>
		    </dd>
        </dl>
    </div>
</template>

<script>
	import positionbox from '../positionbox/positionbox'
	export default{
		name:'expiredposition',
		components:{
			positionbox
		},
		data(){
			return{
				position2resumelist:null,
			}
		},
		computed:{
			myCompanyId(){
				return this.$store.state.company.companyId()
			}
		},
		methods:{
			online(item){
				this.$axios({
					method:'get',
					url:'/api/position/toOnline',
					params:{
						positionId:item.positionId
					}
				}).then(res=>{
					console.log(res)
					this.dataInit()
				}).catch(err=>{
					console.log(err)
				})
			},
			deletePosition(item){
				this.$axios({
					method:'get',
					url:'/api/position/delete',
					params:{
						positionId:item.positionId
					}
				}).then(res=>{
					console.log(res)
					this.dataInit()
				}).catch(err=>{
					console.log(err)
				})
			},
			dataInit(){
				this.$axios({
					method:'get',
					url:'/api/position/getOfflineByCompanyId',
					params:{
						companyId:this.myCompanyId
					}
				}).then(res=>{
					console.log(res)
					this.position2resumelist = res.data.object
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