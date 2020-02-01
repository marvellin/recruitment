<template>
	<div class="menu_main">
		<h2>{{main.type}}<span></span></h2>
		<div v-for="job in main.joblist">
			<router-link :to="{path:job.path}">
				{{job.name}}
			</router-link>
		</div>
	</div>
</template>

<script>
	export default{
		name:'menumain',
		props:['main']
	}
</script>

<style>
</style>