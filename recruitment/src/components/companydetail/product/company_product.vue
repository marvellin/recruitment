<template>
	<div id="Product">
		<div v-for="(item,index) in products" :key="index" class="product_wrap">
			<dl class="c_product">
				<!--<dt>
					<h2><em></em>公司产品</h2>
				</dt>-->
				<dd style="width: 680px;">
					<productbox :product="item"></productbox>
				</dd>
			</dl>
		</div>
	</div>
</template>

<script>
	import productbox from '../productbox/productbox'
	export default{
		name:"company_product",
		components:{
			productbox
		},
		data(){
			return{
//				products:null,
				companyid:null,
				products:null,
			}
		},
//		props:['id'],
		created(){
			this.companyid = this.$route.query.id
			this.$axios.get("http://127.0.0.1:3000/company",{params:{id:this.companyid}})
			.then((res) => {
				this.products = res.data[0].products
			})
			.catch((err) => {
				console.log(err)
			})
		}
	}
</script>

<style>
</style>