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
		created(){
//			this.company.title = {title:'this is index2'}
		},
		mounted(){
			console.log('from index2' + JSON.stringify(this.company))
		},
		watch:{
			/*company:{
				handler(newcompany,oldcompany){
//					this.$emit("update:company",newcompany)
					console.log('from index2' + JSON.stringify(this.company))
				},
				immediate:true,
				deep:true
			}*/
		}
	}
</script>

<style>
</style>