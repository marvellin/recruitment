<template>
	<div id="body">
		<headert :navlist='navlist' :currentnav=""></headert>
	</div>
</template>

<script>
	import footert from '../footer/footer'
	import headert from '../header/header'
	export default{
		name:'companylist',
		components:{
			footert,
			headert
		},
		data(){
			return{
				
			}
		},
		methods:{
			
		}
	}
</script>

<style>
</style>