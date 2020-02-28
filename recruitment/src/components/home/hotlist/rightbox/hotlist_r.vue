<template>
	<div class="hot_pos_r">
		<slot name="slot1"></slot>
		<div class="mb10 recompany">
			<router-link to="" target="_blank">{{company.name}}</router-link>
		</div>
		<span><em class="c7">领域：</em>{{company.field}}</span>
		<span><em class="c7">创始人：</em>{{company.founder}}</span>
		<br />
		<span><em class="c7">阶段：</em>{{company.level}}</span>
		<span><em class="c7">规模：</em>{{company.scale}}</span>
		<ul class="companyTags reset">
			<li>{{company.tags.tag1}}</li>
			<li>{{company.tags.tag2}}</li>
			<li>{{company.tags.tag3}}</li>
		</ul>
	</div>
</template>

<script>
	export default{
		name:'hot_pos_r',
		props:['company']
	}
</script>

<style>
</style>