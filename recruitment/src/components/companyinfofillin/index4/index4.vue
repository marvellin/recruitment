<template>
	<div class="content_mid">
		<dl class="c_section c_section_mid">
			<dt>
				<slot name='slot1'></slot>
			</dt>
			<dd>
				<div class="c_text_1">目标明确、前途光明的产品是吸引求职者的制胜法宝哦！</div>
                <img width="668" height="56" class="c_steps" alt="第四步" src="../../../../static/images/step4.png">
                <!--<form method="post" action="http://www.lagou.com/cp/saveCompanyProducts.json" id="productForm">-->
                <form v-if="company">
                    <div id="productDiv">
		                <div class="formWrapper" style="border-bottom: solid 1px rgb(85,85,85);padding-bottom: 20px;" v-for="(product,index) in company.productList" :key="index">
		                    <h3>产品海报</h3>
		                    <span class="fr btn_delete" @click="deleteproduct(index)" v-show="index>0">删除</span>
		                    <div class="new_product mt20">
		                        <div v-show="!product.img" style="height: 220px;" id="productNo0" class="product_upload">
		                            <div style="background-color: rgb(147, 183, 187);width: 325px;height: 84px;">
		                                <span>上传产品图片</span> 
		                                <br>	
		                                                                     尺寸：380*220px  	大小：小于5M
		                        	</div>
		                    	</div>
		                        <div v-if="product.img" id="productShow0" class="product_upload productShow">
			                        <img width="380" height="220" :src="product.img">
			                        <span>更换产品图片<br>380*220px 小于5M</span>
			                    </div>
			                    <input type="file" title="支持jpg、jpeg、gif、png格式，文件小于5M" accept="image/jpeg,image/png,image/jp2,image/gif" @change="setProductImg($event,index)" name="myfiles">
			                </div>
			                <!--<span style="display:none;" id="myfiles0_error" class="error"></span>-->
			                    
		                    <h3>产品名称</h3>
		                    <input type="text" @click="pickcurrentproduct(index)" v-validate="'required|max:20'" style="width: 624px;height: 46px" placeholder="请输入产品名称" v-model="product.name" :name="'产品'+(index+1)+'的名称'">	
		                    <el-alert style="width: 624px;height: 46px;" :closable="false" :title="errors.first('产品'+(index+1)+'的名称')" type="error" v-show="errors.has('产品'+(index+1)+'的名称')"></el-alert>
		                        
		                    <!--<h3>产品地址</h3>
		                    <input type="text" placeholder="请输入产品主页URL或产品下载地址" name="productInfos[0].productUrl" id="address0">-->	
		                        
		                    <h3>产品简介</h3> 
		                    <textarea @click="pickcurrentproduct(index)" v-validate="'required|max:500'" style="width: 624px;height: 275px;" placeholder="请简短描述该产品定位、产品特色、用户群体等" v-model="product.info" maxlength="500" :name="'产品'+(index+1)+'的介绍'"></textarea>	
		                    <div class="word_count">你还可以输入 <span>{{remainingwords(index)}}</span> 字</div>
		                    <el-alert style="width: 624px;height: 46px;" :closable="false" :title="errors.first('产品'+(index+1)+'的介绍')" type="error" v-show="errors.has('产品'+(index+1)+'的介绍')"></el-alert>
		                    <!--<button class="btn_big fr">保存</button>-->
		                </div>
	                </div>
                    <a id="addMember" class="add_member" @click="addproduct" href="javascript:void(0)"><i></i>添加公司产品</a>
                   	<div class="clear"></div>
                   	<input type="submit" @click.prevent="goback" value="上一步" class="btn_big fl">
                    <input type="submit" @click.prevent="goforward" value="下一步" id="step4Submit" class="btn_big fr">
                </form>
			</dd>
		</dl>
	</div>
</template>

<script>
	export default{
		name:"index",
		data(){
			return{
				currentproduct:null,
				company:null
			}
		},
		props:{
			/*company:{
				type:Object,
				required:true,
			},*/
		},
		created(){
			this.dataInit()
		},
		mounted(){
//			console.log('from index4 mounted' + JSON.stringify(this.company))
		},
		methods:{
			getProductImg(index){
				this.$axios({
					method:'get',
					url:'/api/productImg/download',
					params:{
						companyProductId:this.company.productList[index].companyProductId
					},
					responseType:'arraybuffer'
				}).then(res=>{
						let blob = new Blob([res.data])
						if(blob.size>0){
							console.log(blob)
							let url = window.URL.createObjectURL(blob)
							this.company.productList[index].img = url
							console.log(this.company.productList[index].img)
						}
						else{
							this.company.productList[index].img = null
						}
				}).catch(err=>{
					console.log(err)
				})
			},
			setProductImg(e,index){
				if(!this.company.productList[index].companyProductId){
					this.company.productList[index].companyProductId=-1
				}
				var productImg = e.target.files[0]
				var formData = new FormData()
				formData.append('file',productImg)
				formData.append('userId',this.$store.state.userId())
				formData.append('companyProductId',this.company.productList[index].companyProductId)
				this.$axios({
					method:'post',
					url:'/api/productImg/upload',
					data:formData,
					headers:{
						'Content-Type':'multipart/form-data'
					},
					responseType:'arraybuffer'
				}).then(res=>{
					console.log(res)
					let blob = new Blob([res.data])
						if(blob.size>0){
							let url = window.URL.createObjectURL(blob)
							this.company.productList[index].img = url
							console.log(this.company.productList[index].img)
						}
						else{
							this.company.productList[index].img = null
						}
				}).catch(err=>{
					console.log(err)
				})
			},
			pickcurrentproduct(index){
				this.currentproduct = index
			},
			deleteproduct(index){
				if(index >= 0 && index < this.company.productList.length){
					this.$confirm('是否删除这个产品?', '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
			        }).then(() => {
			        	  this.company.productList.splice(index,1)
				          this.$message({
				            type: 'success',
				            message: '删除成功!'
				          });
			        }).catch(() => {
				          this.$message({
				            type: 'info',
				            message: '已取消删除'
				          });          
			        })
				}
			},
			remainingwords(index){
				if(this.company.productList[index].info === undefined || this.company.productList[index].info === null){
					return 500
				}
				else{
					return 500 - this.company.productList[index].info.length
				}
			},
			goforward(){
				this.$validator.validate().then((result) => {
			        if (result) {
			         	this.insert()
						this.$router.push({path:'/companyinfofillin/step5'})
			        }
			        else{
				        this.$message({
							type:'warn',
							message:"请先完善页面信息！"
						})
			        }
			      }).catch(err => {
			      		this.$message({
							type:'warn',
							message:"请先完善页面信息！"
						})
			      		console.log(err)
			      })
			},
			async insert(){
				for ( var i = this.company.productList.length - 1; i >= 0 ; i-- ) {
							await this.$axios({
								method:'post',
								url:'/api/companyProduct/insert',
								data:this.company.productList[i],
								params:{
									companyId:this.company.companyId
								}
							}).then(res => {
								console.log(res)
							}).catch(err => {
								console.log(err)
							})
				}
			},
			goback(){
				this.$router.push({path:'/companyinfofillin/step3'})
			},
			addproduct(){
				this.company.productList.push({
						name:null,
						img:null,
						info:null,
				})
			},
			dataInit(){
				/*if(!this.company.productList || this.company.productList.length === 0){
					this.company.productList.push({
						name:null,
						img:null,
						info:null,
					})
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
					if(this.company.productList==undefined||this.company.productList==null||this.company.productList.length<=0){
						this.company.productList.push(
							{
								name:null,
								img:null,
								info:null,
							}
						)
					}
					else{
						for(var i = this.company.productList.length-1;i>=0;i--){
							this.getProductImg(i)
						}
					}
				}).catch(err => {
					console.log(err)
					this.$router.push({path:'*'})
				})
			},
			getproductimg(e,index){
				this.company.productList[index].filetmp = e.target.files[0]
//				this.uploadimg(productimg,index)
			},
			uploadimg(file,index){
				if(!file){
					return
				}
				var formData = new FormData()
				formData.append("file",file)
				this.$axios({
					method:'post',
					url:'/api/ossupload2preview',
					data:formData,
					headers:{
						'Content-Type':'multipart/form-data'
					},
					responseType:'arraybuffer'
				}).then(res => {
					const blob = new Blob([res.data])
//					console.log('beforeupdate')
					this.company.productList[index].img = URL.createObjectURL(blob)
//					console.log('afterupdate')
					console.log(this.company.productList[index].img)
					this.$message("上传成功!")
				}).catch(err => {
					this.$message("上传失败!")
					console.log(err)
				})
			},
		},
		computed:{
			myUserId(){
				return this.$store.state.userId()
			},
		},
	}
</script>

<style>
	.btn_delete{
		margin-top: -30px;
		background-color: #91CEBE;
		color: white;
		width: 50px;height: 25px;
		text-align: center;
		padding: auto;
	}
	.btn_delete:hover{
		background-color: #019875;
		cursor: pointer;
	}
</style>