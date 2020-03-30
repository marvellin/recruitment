<template>
	<div class="content_mid">
		<dl class="c_section c_section_mid">
			<dt>
				<slot name='slot1'></slot>
			</dt>
			<dd id="step2Form" v-if="company">
				<div class="c_text_1">简短明了的标签信息让求职者更加方便检索，更快找到你们！</div>
	            <img width="668" height="56" class="c_steps" alt="第二步" src="../../../../static/images/step2.png">
	                    
	            <h3>已添加标签（不多于10个）</h3>
	            <ul v-if="company.companyDetail.labelList&&company.companyDetail.labelList.length>0" class="reset" id="labels">
	            	<li v-for="(item,index) in company.companyDetail.labelList" :key="index">
	            		<span>{{item.label}}</span>
	            		<i @click="deletelabel(index)"></i>
	            	</li>
	            </ul>
	            <input type="text" v-validate="'max:6'" v-model="customlabel" placeholder="请输入自定义标签" style="width: 514px;height: 46px;" name="label" id="label">	
	            <input type="button" @click="pastelabel" value="贴上" id="add_label">
	            <el-alert style="width: 514px;height: 46px;" :closable="false" :title="errors.first('label')" type="error" v-show="errors.has('label')"></el-alert>
	            <div class="clear"></div>
	            <div id="box_labels" v-if="labelslist">
	            	<dl v-for="(item,index1) in labelslist" :key='index1'>
	            		<dt>{{item.type}}</dt>
	            		<dd>
	            			<ul class="reset">
	            				<li :class="{'selected':haslabel(label)}" v-for="(label,index2) in item.list" @click="picklabel(label)" :key="index2">
	            					{{label}}
	            				</li>
	            			</ul>
	            		</dd>
	            	</dl>
	                <!--<dl>
	                    <dt>薪酬激励</dt>
	                    <dd>
	                        <ul class="reset">
	                                		                                    <li>年终分红</li>
	                                    	                                    <li>绩效奖金</li>
	                                    	                                    <li>股票期权</li>
	                                    	                                    <li>专项奖金</li>
	                                    	                                    <li>年底双薪</li>
	                        </ul>
	                    </dd>
	                </dl>
	                <dl>
	                    <dt>员工福利</dt>
	                    <dd>
	                        <ul class="reset">
	                                		                                    <li>五险一金</li>
	                                    	                                    <li>通讯津贴</li>
	                                    	                                    <li>交通补助</li>
	                                    	                                    <li>带薪年假</li>
	                        </ul>
	                    </dd>
	                </dl>
	                <dl>
	                    <dt>员工关怀</dt>
	                    <dd>
	                        <ul class="reset">
	                                		                                    <li>免费班车</li>
	                                    	                                    <li>节日礼物</li>
	                                    	                                    <li>年度旅游</li>
	                                    	                                    <li>弹性工作</li>
	                                    	                                    <li>定期体检</li>
	                                    	                                    <li>午餐补助</li>
	                        </ul>
	                    </dd>
	                </dl>
	                <dl>
	                    <dt>其他</dt>
	                    <dd>
	                        <ul class="reset">
	                                		                                    <li>岗位晋升</li>
	                                    	                                    <li>技能培训</li>
	                                    	                                    <li>管理规范</li>
	                                    	                                    <li>扁平管理</li>
	                                    	                                    <li>领导好</li>
	                                    	                                    <li>美女多</li>
	                                    	                                    <li>帅哥多</li>
	                        </ul>
	                    </dd>
	                </dl>-->
	            </div>	
	            <input type="button" @click="goback" value="上一步" id="step2Submit" class="btn_big fl">
	            <input type="button" @click="goforward" value="下一步" id="step2Submit" class="btn_big fr">
	            <!--<a class="btn_cancel fr" href="http://www.lagou.com/c/founder.html">跳过</a>-->
            </dd>
		</dl>
	</div>
</template>

<script>
	export default{
		name:"index",
//		inject:['reload'],
		data(){
			return{
				labelslist:null,
				customlabel:null,
				company:null
			}
		},
		props:{
			/*company:{
				type:Object,
				required:true
			}*/
		},
		created(){
			this.getdatas()
			this.dataInit()
		},
		mounted(){
//			console.log('from index2 mounted' + JSON.stringify(this.company))
		},
		methods:{
			pastelabel(){
//				console.log(this.$validator)
				if(this.company.companyDetail.labelList.length >= 10){
					this.$message({
						type:'info',
						message:'已选择10个标签，无法再添加新的标签！'
					})
					this.customlabel = null
				}
				else if(this.customlabel != undefined && this.customlabel != null && this.company.companyDetail.labelList.length < 10 && !this.$validator.errors.has('label')){
					//提交标签信息到后台保存
//					this.company.companyDetail.labelList.push(this.customlabel)
					var companyLabel = {
						label:this.customlabel
					}
					this.$axios({
						method:'post',
						url:'/api/companyLabel/insert',
						data:companyLabel,
						params:{
							companyDetailId:this.company.companyDetail.companyDetailId
						},
						headers:{
							'Content_Type':'application/json'
						}
					}).then(res => {
						console.log(res)
						this.dataInit()
						this.customlabel = null
					}).catch(err => {
						console.log(err)
					})
					
				}
				else if(this.$validator.errors.has('label')){
					this.$message({
						type:'warn',
						message:'标签超过限定字数！'
					})
				}
			},
			deletelabel(index){
				if(index >= 0 && index < this.company.companyDetail.labelList.length){
					this.$confirm('是否删除这个标签?', '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
			        }).then(() => {
//			        	  this.company.companyDetail.labelList.splice(index,1)
						  this.$axios({
						  	method:'get',
						  	url:'/api/companyLabel/delete',
						  	params:{
						  		companyLabelId:this.company.companyDetail.labelList[index].companyLabelId
						  	}
						  }).then(res => {
						  	console.log(res)
						  	this.dataInit()
						  	this.$message({
					            type: 'success',
					            message: '删除成功!'
					          })
						  }).catch(err => {
						  	console.log(err)
						  })
			        }).catch(() => {
				          this.$message({
				            type: 'info',
				            message: '已取消删除'
				          });          
			        })
				}
			},
			picklabel(label){
				if(this.company.companyDetail.labelList.length < 10){
//					this.company.companyDetail.labelList.push(label)
					var companyLabel = {
						label:label
					}
					this.$axios({
						method:'post',
						url:'/api/companyLabel/insert',
						data:companyLabel,
						params:{
							companyDetailId:this.company.companyDetail.companyDetailId
						},
						headers:{
							'Content_Type':'application/json'
						}
					}).then(res => {
						console.log(res)
						this.dataInit()
					}).catch(err => {
						console.log(err)
					})
				}
				else{
					this.$message({
						type:'info',
						message:'已选择10个标签，无法再添加新的标签！'
					})
				}
			},
			haslabel(label){
				if(this.company.companyDetail.labelList.indexOf(label) > -1){
					return true
				}
				return false
			},
			dataInit(){
				/*if(this.company.companyDetail.labelList === undefined || this.company.companyDetail.labelList === null || !(this.company.companyDetail.labelList instanceof Array)){
					this.company.companyDetail.labelList = []
				}*/
				this.$axios({
					method:'get',
					url:'/api/company/getByUserId',
					params:{
						userId:this.myUserId
					}
				}).then(res => {
					console.log(res)
					this.company = res.data.object
				}).catch(err => {
					console.log(err)
					this.$router.push({path:'*'})
				})
			},
			getdatas(){
				this.$axios.get('/static/data/labels.json')
				.then(res => {
					this.labelslist = res.data.labels
				}).catch(err => {
					console.log(err)
				})
			},
			goforward(){
				if(this.company.companyDetail.labelList.length <= 0){
					this.$confirm('还未添加任何公司标签，是否跳过?', '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
			        }).then(() => {
			        	  this.$router.push({path:'/companyinfofillin/step3'})
			        }).catch(() => {
				                   
			        })
				}
				else{
					this.$router.push({path:'/companyinfofillin/step3'})
				}
			},
			goback(){
				this.$router.push({path:'/companyinfofillin/step1'})
			}
		},
		computed:{
			myUserId(){
				return this.$store.state.userId()
			}
		},
	}
</script>

<style>
</style>