<template>
	<div>
		<a target="_blank">
			<h3 title="CCIC">{{company.name}}</h3>
			<div class="comLogo">
				<img :src="company.img" width="190" height="190" alt="CCIC" />
				<ul>
					<li>{{company.field}}</li>
					<li>{{company.city}}，{{company.currentstage}}</li>
				</ul>
			</div>
		</a>
		<a href="h/jobs/148928.html" target="_blank">环境监测工程师</a>
		<a href="h/jobs/148919.html" target="_blank">电学校准工程师</a>
		<a href="h/jobs/148931.html" target="_blank">能源管理项目经理</a>
		<ul class="reset ctags">
			<li>{{company.currentstage}}</li>
			<li>{{company.field}}</li>
			<li v-for="(item,index) in company.labels" :key='index'>{{item}}</li>
		</ul>
	</div>
</template>

<script>
	export default{
		name:'companybox',
		props:['company']
	}
</script>

<style>
</style>