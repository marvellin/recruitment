<template>
		<div class="d_item">
		    <h2 :title="position.name">
			    <router-link target="_blank" to="/positiondetail">
			        <em>{{position.name}}</em> 
			        <span>（{{position.salarymin}}k-{{position.salarymax}}k）</span>
			    </router-link>
			</h2>
			<a class="fr" @click.prevent="deletedelivery">删除</a>
		    <div class="clear"></div>
			<a v-if="company" title="公司名称" class="d_jobname" target="_blank" href="http://www.lagou.com/c/25927.html">
			    {{company.companyDetail.shortname}}<span>[{{company.companyDetail.city}}]</span> 
			</a>
			<span class="d_time" v-if="status>=2">反馈时间：{{feedback.feedbacktime}}</span>
			<div class="clear"></div>
			<!--<div class="d_resume">
			           使用简历：
			    <span>
			           在线简历
		        </span>
			</div>-->
			<span class="d_time fl">投递时间：{{deliverytime}}</span>
			<a v-if="status==2" class="btn_showprogress" @click.prevent="showstatusbox" href="javascript:;">
			    <!--<span>反馈结果：</span>-->
			         已查看
			    <i :class="[show?'transform':'']"></i>
			</a>
			<a v-if="status==1" class="btn_showprogress" href="javascript:;">
			    <!--<span>反馈结果：</span>-->
			    	已投递
			    <!--<i :class="[show?'transform':'']"></i>-->
			</a>
			<a v-if="status==3" class="btn_showprogress" @click.prevent="showstatusbox" href="javascript:;">
			    <span>反馈结果：</span>
			    	{{feedback.feedback}}
			    <i :class="[show?'transform':'']"></i>
			</a>
		</div>
</template>

<script>
	export default{
		name:"deliverybox",
		props:{
			delivery:{type:Object},
			status:{},
			show:{
				type:Boolean
			},
			position:{type:Object},
			companyId:{type:Number},
			deliverytime:{},
//			feedbacktime:{},
			feedback:{type:Object}
		},
		data(){
			return{
				company:null,
			}
		},
		created(){
//			console.log(this.status)
			this.$axios({
				method:'get',
				url:'/api/company/get',
				params:{
					companyId:this.companyId
				}
			}).then(res => {
				console.log(res)
				this.company = res.data.object
			}).catch(err => {
				console.log(err)
			})
		},
		methods:{
			deletedelivery(){
				this.$axios({
					method:'get',
					url:'/api/delivery/updateByPerson',
					params:{
						deliveryId:this.delivery.deliveryId
					}
				}).then(res => {
					console.log(res)
					this.$emit("refresh",'')
//					this.$emit('refresh',this.$route.query.type)
				}).catch(err => {
					console.log(err)
				})
			},
			showstatusbox(){
//				console.log(this.status)
				this.$emit("showbox",'')
			}
		}
	}
</script>

<style>
</style>