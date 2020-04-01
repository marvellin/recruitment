<template>
	<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1>
                    <em></em>
                                                     有效职位
                    <span>
                    	（共<i style="color:#fff;font-style:normal" id="positionNumber">{{position2resumelist.length}}</i>个）
                    </span>                        
                </h1>
            </dt>
            <dd>
                <form id="searchForm" v-if="position2resumelist">
			        <ul class="reset my_jobs">
				        <li v-for="(item,index) in position2resumelist" :key='index'>
				        	<positionbox :position='item'>
				        		<!--<span class="receivedResumeNo" slot="slot1">
								    <a href="unHandleResumes.html?positionId=149594">应聘简历（{{item.resume.length}}）</a>
								</span>-->
								<a class="job_offline" @click.prevent="offline(item)" href="javascript:void(0)" slot="slot2">下线</a> 
				        	</positionbox>
		                </li>
	                </ul>
			    </form>
			    
			    <form v-if="!position2resumelist||position2resumelist.length==0">
			    	<div style="text-align: center;font-weight: 600;line-height:40px;margin: 20px 10px;padding: 20px 10px;">
						您没有发布职位，
						<router-link style="position: relative;cursor:pointer" to="/management/postposition">
							<span>前往发布职位！</span>
							<!--<input type="file" @change="getresumefile" style="{display:block;position:absolute;top:0;left:0;width:219px;height:19px;font-size:100px;opacity:0;filter:alpha(opacity=0);cursor:pointer}" accept="application/msword,application/pdf,application/vnd.ms-powerpoint,application/vnd.ms-works,text/plain"/>-->
						</router-link>
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
		name:'validposition',
		components:{positionbox},
		data(){
			return{
				position2resumelist:[],
			}
		},
		computed:{
			myCompanyId(){
				return this.$store.state.company.companyId()
			}
		},
		methods:{
			offline(item){
				this.$axios({
					method:'get',
					url:'/api/position/toOffline',
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
					url:'/api/position/getOnlineByCompanyId',
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