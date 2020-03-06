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
		<pagination @change="change" style="margin-left: 30%;" :total="gettotalpage" :limit="limit" :currentpage="currentpage"></pagination>
	</div>
</template>

<script>
	import productbox from '../productbox/productbox'
	import pagination from '../../pagination/pagination'
	export default{
		name:"company_product",
		components:{
			productbox,
			pagination
		},
		data(){
			return{
//				products:null,
				companyid:null,
				products:null,
				currentlist:null,
				limit:3,
				currentpage:1
			}
		},
		computed:{
			gettotalpage(){
				if(this.products){
					return Math.ceil(this.products.length / this.limit)
				}
				else{
					return 0
				}
			}
		},
		methods:{
			change(index){
//				console.log(pagparam)
				this.currentpage = index
				this.getcurrentlist()
			},
			getcurrentlist(){
				if(this.products){
					this.currentlist = this.products.slice(
						(this.currentpage - 1) * this.limit,
						this.currentpage * this.limit
					)
				}
				else{
					this.$axios.get('http://127.0.0.1:3000/company',{params:{id:this.companyid}}).then(res => {
						this.products = res.data[0].products
						this.currentlist = this.products.slice(
							(this.currentpage - 1) * this.limit,
							this.currentpage * this.limit
						)
					});
				}
			}
		},
		created(){
			this.companyid = this.$route.query.id
			this.getcurrentlist()
			/*this.$axios.get("http://127.0.0.1:3000/company",{params:{id:this.companyid}})
			.then((res) => {
				this.products = res.data[0].products
			})
			.catch((err) => {
				console.log(err)
			})*/
		}
	}
</script>

<style>
</style>