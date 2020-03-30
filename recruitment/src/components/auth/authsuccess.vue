<template>
	<div>
		<div id="body">
			<headert :navlist="2" :isCompany="true"></headert>
			<div id="container">
				<div class="content_mid">
		        	<dl style="width: 680px;" class="c_section c_section_mid">
		        		<dt>
		                    <h2><em></em>申请公司认证</h2>
		                </dt>
		                <dd style="width: 680px;" class="c_certify"> 
		                	<h4>公司认证已提交，请等待审核</h4>
							<div class="f16 mb20">
								收到资料后我们将在24小时内进行人工审核，<!--并将审核结果发送至你的邮箱，-->
								请耐心等待O(∩_∩)O~
							</div>
							<div style="550px" class="certify_notice">
								<ul style="width: 520px;">
									<li style="width: 520px;" class="lista">若通过审核   <span>[ 您将在公司详情页的简称右侧查看到【认证徽章】点亮 ]</span></li>
									<li style="width: 520px;" class="listb">若未通过审核   <span> [ 我们将写清楚未通过审核的原因，您可以整理好所需资料重新提交审核 ]</span></li>
								</ul>
							</div>
							<div class="breakdotted"></div>
		                   	<router-link class="greenlink" :to="{path:'/management/postposition',query:{companyId:myCompanyId}}">发布新职位</router-link>
		                    <router-link class="greenlink" :to="{path:'/mycompany',query:{companyId:myCompanyId}}"> 进入我的公司主页</router-link>
		                </dd>
		            </dl>
		       	</div>
       			<div class="clear"></div>
       			<totop></totop>
			</div>
		</div>
		<footert></footert>
	</div>
</template>

<script>
	import headert from '../header/header'
	import footert from '../footer/footer'
	import totop from '../totop/totop'
	export default{
		name:"authsuccess",
		components:{
			headert,
			footert ,
			totop,
		},
		computed:{
			myCompanyId(){
				return this.$store.state.company.companyId()
			}
		},
		created(){
//			console.log(this.$store.state.company.companyId())
		}
	}
</script>

<style>
</style>