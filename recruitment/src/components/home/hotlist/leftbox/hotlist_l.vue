<template>
	<div class="hot_pos_l">
		<div class="mb10">
			<router-link :to="{path:'/positiondetail',query:{positionId:job.positionId}}" target="_blank">{{job.name}}</router-link>
				&nbsp;
			<span class="c9">[{{job.address}}]</span>
		</div>
		<span><em class="c7">月薪：</em>{{job.salarymin}}K-{{job.salarymax}}K</span>
		<span><em class="c7">经验：</em>{{job.experience}}</span>
		<span><em class="c7">最低学历：</em>{{job.degree}}</span>
		<br />
		<span><em class="c7">职位诱惑：</em>{{job.advantage}}</span>
		<br />
		<span>{{job.releaseTime}}发布</span>
	</div>
</template>

<script>
	export default{
		name:'hot_pos_l',
		props:['job'],
		mounted(){
//			console.log(this.job)
		}
	}
</script>

<style>
	
</style>