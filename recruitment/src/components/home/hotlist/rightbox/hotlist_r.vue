<template>
	<div class="hot_pos_r" v-if="company">
		<slot name="slot1"></slot>
		<div class="mb10 recompany">
			<a @click.prevent="toCompanyDetail(company.companyId)" target="_blank">{{company.companyDetail.shortname}}</a>
		</div>
		<span v-if="company.companyDetail.field"><em class="c7">领域：</em>{{company.companyDetail.field}}</span>
		<span v-if="company.companyMember.name"><em class="c7">负责人人：</em>{{company.companyMember.name}}</span>
		<br />
		<span v-if="company.companyStage.currentstage"><em class="c7">阶段：</em>{{company.companyStage.currentstage}}</span>
		<span v-if="company.companyDetail.scale"><em class="c7">规模：</em>{{company.companyDetail.scale}}</span>
		<ul class="companyTags reset" v-if="company.companyDetail.labelList">
			<li v-for="(item,index) in company.companyDetail.labelList" :key="index">
				{{item.label}}
			</li>
			<!--<li>{{company.tags.tag1}}</li>
			<li>{{company.tags.tag2}}</li>
			<li>{{company.tags.tag3}}</li>-->
		</ul>
	</div>
</template>

<script>
	export default{
		name:'hot_pos_r',
		props:['companyId'],
		created(){
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
		data(){
			return{
				company:null
			}
		},
		methods:{
			toCompanyDetail(companyId){
				this.$router.push({
					name:'companydetail',
					query:{
						companyId:companyId
					}
				})
			}
		}
	}
</script>

<style>
</style>