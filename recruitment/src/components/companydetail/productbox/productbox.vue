<template>
	<div>
		<img v-if="product.img" width="380" height="220" :alt="product.name" :src="product.img">
		<img v-else src='../../../../static/images/product_default.png' width="380" height="220" :alt="product.name"/>
		<div class="cp_intro">
			<h3><a target="_blank" href="http://www.weimob.com">{{product.name}} </a></h3>
			<div class="scroll-pane" style="overflow: hidden; padding: 0px; width: 260px;">
				<div class="jspContainer" style="width: 260px; height: 140px;">
					<div class="jspPane" style="padding: 0px; top: 0px; width: 260px;">
					    <div>
					        {{product.info}}
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	export default{
		name:"productbox",
		props:{
			product:{
				type:Object
			}
		}
	}
</script>

<style>
</style>