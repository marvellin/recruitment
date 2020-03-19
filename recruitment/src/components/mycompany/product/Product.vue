<template>
	<div class="product_wrap">
		
		<!--产品编辑-->
		<dl id="newProduct" class="newProduct" :class="[edit?'':'dn']">
					            <dt>
					            	<h2><em></em>公司产品</h2>
					            </dt>
					            <dd>
					                <form method="post" class="productForm">
					                    <div class="new_product"> 	
							                <div class="product_upload dn productNo">
							                    <div>
							                        <span>上传产品图片</span> 
							                        <br>	
							                                                               尺寸：380*220px  	大小：小于5M              
							                    </div>
							                </div>
							                <div class="product_upload productShow">
							                    <img width="380" height="240" :src="product.img">
								                <span>更换产品图片<br>380*220px 小于5M</span>
								            </div>
							                <input type="file" @change="getFile" accept="image/jpg,image/jpeg,image/gif,image/png" title="支持jpg、jpeg、gif、png格式，文件小于5M" name="myfiles" :id="index"><!--:id="'myfiles0'+index"-->
							            </div>
					                    <div class="cp_intro">
					                        <input :data-vv-scope="productscope(index)" v-validate="'required|max:20'" type="text" placeholder="请输入产品名称" v-model:value="product.name" :name="productname(index)">	
					                        <el-alert style="width: 240px;height: 30px;" :closable="false" :title="errors.first(productscope(index)+'.'+productname(index))" type="error" v-show="errors.has(productscope(index)+'.'+productname(index))"></el-alert>
					                        
					                        <textarea :data-vv-scope="productscope(index)" v-validate="'required|max:500'" placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="500" v-model:value="product.info" class="s_textarea" :name="productintro(index)">{{product.info}}</textarea>	
					                        <div class="word_count fr" v-show="product.info.length==0">总长不超过 <span>500</span> 字</div>
					                        <div class="word_count fr" v-show="product.info.length!=0">还可以输入 <span>{{500-product.info.length}}</span> 字</div>
					                        <el-alert style="width: 240px;height: 30px;" :closable="false" :title="errors.first(productscope(index)+'.'+productintro(index))" type="error" v-show="errors.has(productscope(index)+'.'+productintro(index))"></el-alert>
					                        
					                        <div class="clear"></div>
					                        <input type="button" value="保存" class="btn_small" @click="save(index)">
					                        <a v-if="index!==0" class="btn_cancel_s product_delete" @click.prevent="handleItemClick">删除</a>
					                    </div>
									</form>
					            </dd>
					        </dl>
					          
		<!--有产品-->
		<dl class="c_product" :class="[edit?'dn':'']">
					            <dt>
					                <h2><em></em>公司产品</h2>
					            </dt>
					            <dd style="width: 680px;">
					                <img width="380" height="220" :alt="product.name" :src="product.img">
				                    <div class="cp_intro">
				                        <h3>{{product.name}}</h3>
					                    <div class="scroll-pane" style="overflow: hidden; padding: 0px; width: 260px;">
					                    	<div class="jspContainer" style="width: 260px; height: 140px;">
					                    		<div class="jspPane" style="padding: 0px; top: 0px; width: 260px;">
					                    			<div>
					                    				{{product.info}}
					                    			</div>
					                    		</div>
					                    	</div>
					                    </div>
					                </div>
					                <a title="编辑公司产品" class="c_edit product_edit" href="javascript:void(0)" @click.prevent="edit1()"></a>
					            	<a v-show="index===0" title="新增公司产品" class="c_add product_add" href="javascript:void(0)" @click.prevent="handleItemInsert"></a>
					            </dd>
					        </dl>
	</div>
</template>

<script>
	export default{
		name:'product',
		props:['index','product'],
		data(){
			return{
				edit:false,
				/*product:{
					name:'',
					info:'',
					img:'../../../../static/images/product_default.png'
				}*/
			}
		},
		/*computed:{
			productname(index){
				return '产品'+(index+1)+'的名称'
			},
			productintro(index){
				return '产品'+(index+1)+'的介绍'
			}
		},*/
		methods:{
			productscope(index){
				return 'product'+index
			},
			productname(index){
				return '产品'+(index+1)+'的名称'
			},
			productintro(index){
				return '产品'+(index+1)+'的介绍'
			},
			edit1(){
				this.edit = true
			},
			save(index){
				var validateScope = 'product'+index
				this.$validator.validate(validateScope + '.*').then((result) => {
					if (result) {
					      	// 保存产品数据并关闭编辑页面
					      	this.edit = false
					}
					else{
//					     	console.log(this.$validator)
					     	this.$message({
								type:'warn',
								message:'请先完善产品信息！'
							})
					}
			   	}).catch(err => {
			   		console.log(err)
			   	})
			},
			getFile(e){
				let _this = this
				var files = e.target.files[0]
				if(!e || !window.FileReader) return
				let reader = new FileReader()
				reader.readAsDataURL(files)//这里是关键一步，转换就在这里
				reader.onloadend = function(){
					_this.product.img = this.result
				}
			},
			handleItemClick(){
				this.$emit("delete",this.index)
			},
			handleItemInsert(){
				this.$emit("insert")
			}
		}
	}
</script>

<style>
	
</style>