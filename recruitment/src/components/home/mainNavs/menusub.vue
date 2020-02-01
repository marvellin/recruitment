<template>
	<div class="menu_sub" v-show="show">
		<!--<div v-for="item in sublist">-->
			<resetbox v-for="(item,index) in sublist" :key="index" :subitem="item"></resetbox>
		<!--</div>-->
	</div>
</template>

<script>
	import resetbox from './resetbox.vue'
	export default{
		name:'menusub',
		props:['sublist','show'],
		components:{resetbox},
	}
</script>

<style>
</style>