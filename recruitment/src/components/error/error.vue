<template>
	<div>
		<div id="body">
			<headert></headert>
			<div id="container" style="min-height: 500px;">
				<div style="display:block;width: 100%;height: 500px;margin: auto auto;">
					<span style="text-align: center;display: block;margin: auto;">找不到页面！</span>
					<img style="display: block;margin: auto;" src="../../../static/css/img/noresult.png" width="300px" height="300px"/>
				</div>
			</div>
		</div>
		<footert></footert>
	</div>
</template>

<script>
	import headert from '../header/header'
	import footert from '../footer/footer'
	export default{
		name:'errorPage',
		components:{
			headert,
			footert
		}
	}
</script>

<style>
</style>