<template>
	<div>
		<a id="backtop" title="回到顶部" rel="nofollow" @click.prevent="toTop" style="display: inline;"></a>
	</div>
</template>

<script>
	export default{
		name:'totop',
		methods:{
			toTop(){
				body.scrollIntoView({behavior:'smooth'})
//				console.log('from totop')
			},
		}
	}
</script>

<style>
</style>