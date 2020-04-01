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
			    
			    <form v-if="!position2resumelist||position2resumelist.length==0">
			    	<div style="text-align: center;font-weight: 600;line-height:40px;margin: 20px 10px;padding: 20px 10px;">
						您没有下线职位！
						<a style="position: relative;cursor:pointer" href="javascript:void(0);">
							<!--<span>请上传您的简历附件（不多于3个）</span>-->
							<!--<input type="file" @change="getresumefile" style="{display:block;position:absolute;top:0;left:0;width:219px;height:19px;font-size:100px;opacity:0;filter:alpha(opacity=0);cursor:pointer}" accept="application/msword,application/pdf,application/vnd.ms-powerpoint,application/vnd.ms-works,text/plain"/>-->
						</a>
						<div>
							<img width="150px" height="150px" src="../../../../../static/images/u=1065457796,2310451731&fm=26&gp=0.jpg"/>
						</div>
					</div>
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