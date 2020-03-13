<template>
	<div class="content_mid">
		<dl class="c_section c_section_mid">
			<dt>
				<slot name='slot1'></slot>
			</dt>
			<dd></dd>
		</dl>
	</div>
</template>

<script>
	export default{
		name:"index",
		props:{
			company:{
				type:Object,
				required:true
			}
		},
		watch:{
			/*company:{
				handler(newcompany,oldcompany){
					this.$emit("update:company",newcompany)
				},
				immediate:true,
				deep:true
			}*/
		}
	}
</script>

<style>
</style>