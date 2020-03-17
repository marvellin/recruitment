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
							                <input type="file" @change="getFile" accept="image/jpg,image/jpeg,image/gif,image/png" title="支持jpg、jpeg、gif、png格式，文件小于5M" name="myfiles" id="myfiles0">
							                <!--<input type="hidden" value="3" name="type" class="type">--> 
							                <!--<input type="hidden" value="images/product_default.png" name="productPicUrl" class="productInfos">-->   
							            </div>
					                    <div class="cp_intro">
					                        <input type="text" placeholder="请输入产品名称" v-model:value="product.name" name="product">	
					                        <!--<input type="text" placeholder="请输入产品网址" value="http://www.weimob.com" name="productUrl">-->	
					                        <textarea placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="500" v-model:value="product.info" class="s_textarea" name="productProfile">{{product.info}}</textarea>	
					                        <div class="word_count fr" v-show="product.info.length==0">总长不超过 <span>500</span> 字</div>
					                        <div class="word_count fr" v-show="product.info.length!=0">还可以输入 <span>{{500-product.info.length}}</span> 字</div>
					                        <div class="clear"></div>
					                        <input type="button" value="保存" class="btn_small" @click="save">
					                        <a class="btn_cancel_s product_delete" @click.prevent="handleItemClick">删除</a>
					                        <!--<input type="hidden" value="11867" class="product_id">-->
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
				                        <!--<h3><a target="_blank" href="http://www.weimob.com">{{product.name}} </a></h3>-->
				                        <h3>{{product.name}}</h3>
					                    <div class="scroll-pane" style="overflow: hidden; padding: 0px; width: 260px;">
					                    	<div class="jspContainer" style="width: 260px; height: 140px;">
					                    		<div class="jspPane" style="padding: 0px; top: 0px; width: 260px;">
					                    			<div>
					                    				<!--发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf发达发生的faf-->
					                    				{{product.info}}
					                    			</div>
					                    		</div>
					                    	</div>
					                    </div>
					                </div>
					                <a title="编辑公司产品" class="c_edit product_edit" href="javascript:void(0)" @click.prevent="edit1()"></a>
					            	<a title="新增公司产品" class="c_add product_add" href="javascript:void(0)" @click.prevent="handleItemInsert"></a>
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
		methods:{
			edit1(){
				this.edit = true
			},
			save(){
				this.edit = false
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