<template>
	<div class="content_mid">
		<dl class="c_section c_section_mid">
			<dt>
				<slot name='slot1'></slot>
			</dt>
			<dd>
				<div class="c_text_1">背景深、规模大、发展快、氛围好…用优势吸引求职者吧！</div>
                <img width="668" height="56" class="c_steps" alt="第五步" src="../../../../static/images/step5.png">
                <!--<form method="post" action="http://www.lagou.com/c/saveProfile.json" id="infoForm">-->
                <form>
                    <h3>公司介绍</h3> 
                    <textarea style="width: 624px;" placeholder="请分段详细描述公司简介、企业文化等" v-model="company.intro" name="companyProfile" id="companyProfile"></textarea>	
                    <div class="word_count">你还可以输入 <span>{{remainingwords}}</span> 字</div>
                    <div class="clear"></div>
                    <input type="button" @click="goback" value="上一步" class="btn_big fl">
                    <input type="button" @click.prevent="savecompany" id="step5Submit" value="保存，完成" class="btn_big fr">
                </form>
			</dd>
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
//			console.log('enter created1')
			this.dataInit()
		},
		computed:{
			remainingwords(){
				if(this.company.intro){
					return 1000 - this.company.intro.length
				}
				else{
					return 1000
				}
			}
		},
		methods:{
			goback(){
				this.$router.push({path:'/companyinfofillin/step4'})
			},
			dataInit(){
//				console.log('enter created2')
				if(!this.company.intro){
//					console.log('enter created3')
					this.company.intro = ""
				}
			},
			savecompany(){
				//提交数据到后台保存并跳转至成功页面
				this.$router.push({path:'/companyinfofillin/success'})
			}
		},
		mounted(){
			console.log('from index5 mounted' + JSON.stringify(this.company))
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