<template>
	<div>
		<a target="_blank">
			<h3 title="CCIC">{{company.companyDetail.shortname}}</h3>
			<div class="comLogo">
				<img v-if="company.img" :src="company.img" width="190" height="190" alt="CCIC"/>
				<img v-if="!company.img" src="../../../static/images/logo_default.png" width="190" height="190" alt="CCIC"/>
				<ul>
					<li>{{company.companyDetail.field}}</li>
					<li>{{company.companyDetail.city}}，{{company.companyStage.currentstage}}</li>
				</ul>
			</div>
		</a>
		<a @click="toPosition(index)" v-for="(item,index) in company.positionList.slice(0,3)" :key="item.positionId">
			{{item.name}}
		</a>
		<!--<a href="h/jobs/148928.html" target="_blank">环境监测工程师</a>
		<a href="h/jobs/148919.html" target="_blank">电学校准工程师</a>
		<a href="h/jobs/148931.html" target="_blank">能源管理项目经理</a>-->
		<ul class="reset ctags">
			<li>{{company.companyStage.currentstage}}</li>
			<li>{{company.companyDetail.field}}</li>
			<li v-for="(item,index) in company.companyDetail.labelList" v-if="item.label" :key='index'>{{item.label}}</li>
		</ul>
	</div>
</template>

<script>
	export default{
		name:'companybox',
		props:['company'],
		methods:{
			toPosition(index){
				var me = this
				this.$router.push({
					path:'/positiondetail',
					query:me.company.positionList[index].positionId
				})
			},
			isEmpty(){
				if(this.company.companyDetail==null||this.company.companyStage==null||this.company.companyDetail.labelList.length<=0){
					return true
				}
				else{
					return false;
				}
			},
			getCompanyImg(){
				this.$axios({
					method:'get',
					url:'/api/companyImg/download',
					params:{
						companyDetailId:this.company.companyDetail.companyDetailId
					},
					responseType:'arraybuffer'
				}).then(res=>{
						let blob = new Blob([res.data])
						if(blob.size>0){
							let url = window.URL.createObjectURL(blob)
							this.company.img = url
							console.log(this.company.img)
						}
						else{
							this.company.img = null
						}
				}).catch(err=>{
					console.log(err)
				})
			}
		},
		created(){
			this.getCompanyImg()
		}
	}
</script>

<style>
</style>