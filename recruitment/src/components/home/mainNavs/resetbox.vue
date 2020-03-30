<template>
	<div>
		<dl class="reset">
			<dt>
				<router-link to="">{{subitem.type}}</router-link>
			</dt>
			<dd>
				<router-link v-for="item in subitem.joblist" :key="item.name" :to="{path:'/positionlist',query:{positionName:item.name}}" class="curr">{{item.name}}</router-link>
			</dd>
		</dl>
	</div>
</template>

<script>
	export default{
		name:'resetbox',
		props:['subitem']
	}
</script>

<style>
</style>