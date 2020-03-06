<template>
	<div style="background-color: #fafafa;margin-top: -20px;">
		<ul style="padding: 20px 20px;" class="reset my_jobs">
			<li v-for="(item,index) in positions" :key="index" style="position: relative;">
				<div>
					<h3>
					    <!--<a target="_blank" title="随便写" href="">随便写</a>--> 
					    <router-link target="_blank" title="" to="">{{item.name}}</router-link>
					    <span>[{{item.city}}]</span>
					</h3>
					<!--<slot name="slot1"></slot>-->
					<div class="apply" style="width: 80px;text-align: center;top: 0;">
						<router-link to="" target="_blank" style="color: #fff;">投个简历</router-link>
					</div>
					<div>{{item.type}} / {{item.salarymin}}k-{{item.salarymax}}k / {{item.experience}} / {{item.degree}}及以上</div>
					<div class="c9">发布时间： {{time}}</div>
					<!--<div class="links">
					    <slot name="slot2"></slot>                     
					    <slot name="slot3"></slot>
					</div>-->
				</div>
			</li>
		</ul>
	</div>
</template>

<script>
//	import positionbox from '../../mycompany/management/positionbox/positionbox'
	export default{
		name:"company_position",
		created(){
			this.companyid = this.$route.query.id
			this.$axios.get("http://127.0.0.1:3000/company",{params:{id:this.companyid}})
			.then((res) => {
				this.positions = res.data[0].positions
				console.log(this.positions)
			})
			.catch((err) => {
				console.log(err)
			})
		},
		data(){
			return{
				companyid:null,
				positions:null
			}
		}
	}
</script>

<style>
</style>