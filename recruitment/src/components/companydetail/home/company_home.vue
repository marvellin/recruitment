<template>
	<div class="home_wrap" v-if="company">
		<div id="Profile">
			<div class="profile_wrap">
				<dl class="c_section" style="min-height: 167px;">
					<dt>
						<h2><em></em>公司介绍</h2>
					</dt>
					<dd>
						<div class="c_intro">{{company.intro}}</div>
					</dd>
				</dl>
			</div>
		</div>
		<div id="Reported">
			<dl class="c_section c_reported" style="min-height: 167px;">
				<dt>
				    <h2>
				        <em></em>
				        公司新闻报道
					</h2>
				</dt>
			    <dd>
		            <ul class="reset" style="color: #555;">
		                <li v-for="(item,index) in company.repolist" :key="index">
		                    <a class="article" :title="item.repotitle" target="_blank" :href="item.repolink">{{item.repotitle}}</a>
				        </li>
		            </ul>
			    </dd>
			</dl><!-- end .c_reported -->
		</div>
	</div>
</template>

<script>
	export default{
		name:"company_home",
		data(){
			return{
				companyid:null,
				company:null
			}
		},
		created(){
			this.companyid = this.$route.query.id
			this.$axios.get("http://127.0.0.1:3000/company",{params:{
				id:this.companyid
			}})
			.then((res) => {
				this.company = res.data[0]
			})
			.catch((err) => {
				console.log(err)
			})
		}
	}
</script>

<style>
	.home_wrap{
		
	}
</style>