<template>
	<div>
		<div id="body">
			<headert :navlist="2" :isCompany="true"></headert>
			<div id="container">
				<input type="file" @change="uploadImgWithPreview" accept="image/jpeg,image/png,image/jp2,image/gif"/>
				<img :src="imgurl" width="190px" height="190px"/>
				<div class="content_mid">
		        	<dl class="c_section c_section_mid">
		        		<dt>
		                    <h2 @click="download"><em></em>申请公司认证</h2>
		                </dt>
		                <dd class="c_certify"> 
		                	<h4>申请公司认证的标准</h4>
		                    <ul class="c_certify_list">
		                    	<li class="list1">公司主页<span>[ 网站处于正常运行状态，且必须具有备案号 ]</span></li>
		                        <li class="list2">公司名称<span>[ 简称应为企业/产品简称，不可使用简易修饰性词语 ]</span></li>
		                        <li class="list3">公司logo<span>[ 必须真实有效的体现公司形象 ]</span></li>
		                        <li class="list4">
		                        	公司的营业执照
				                <div class="list4_child">
				                    	<span>*</span>
				                    	<div>
				                    		4.1请提供有效年检期内的《企业法人营业执照》副本<br>
				                    		4.2为保证信息安全，审核执照不提供预览功能，请谅解<br>
				                    		4.3该营业执照只用作公司认证使用，请放心上传
				                    	</div>
				                    </div>
		                        </li>
		                    </ul>
		                   	<div class="business_license">
		                        <div class="license_upload">
		                            <div style="background-color: rgb(147, 183, 187);">
		                                <span>上传公司营业执照副本</span> 
		                                <br>	
		                                支持jpg、png、gif、pdf格式，文件不超过10M
		                            </div>
		                        </div>
		                        <input type="file" accept="application/pdf,image/jpeg,image/png,image/gif" name="businessLicenes" id="businessLicenes" @change="getimg">
		                        <!--<input type="hidden" value="0" name="type" id="type">-->  
		                    </div>
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
		name:"auth",
		components:{
			headert,
			footert ,
			totop,
		},
		data(){
			return{
				img:null,
				filedtos:[],
				imgurl:null,
			}
		},
		methods:{
			getimg(e){
				this.img = e.target.files[0]
				this.uploadImg(this.img)
			},
			uploadImgWithPreview(e){
				let file = e.target.files[0]
				if(!file){
					return
				}
				var _this = this
				var formData = new FormData()
				formData.append("file",file)
				_this.$axios({
					method:'post',
					url:'/api/ossupload2preview',
					data:formData,
					headers:{
						'Content-Type':'multipart/form-data'
					},
					responseType:'arraybuffer'
				}).then(res => {
					const blob = new Blob([res.data])
					this.imgurl = URL.createObjectURL(blob)
				}).catch(err => {
					console.log(err)
				})
			},
			uploadImg(file){
				if(!file){
					return
				}
				var _this = this
				var formData = new FormData()
				formData.append("file",file)
				_this.$axios.post("/api/ossupload",formData)
				.then((res) => {
					this.filedtos.push(res.data)
					if(res.status === 200){
						this.$router.push({name:'authsuccess'})
					}
				})
				.catch((err) => {
					this.$message("上传失败！请重新尝试")
				})
			},
			download(){
				this.$axios({
					method:'post',
					url:'api/ossdownload',
					data:this.filedtos[0],
					headers: {
        				'Content-Type': 'application/json'
    				},	
					responseType:'arraybuffer'
				}).then((res) => {
					const blob = new Blob([res.data])
		            const fileName = this.filedtos[0].oldFileName
		            if ('download' in document.createElement('a')) { // 非IE下载
		              const elink = document.createElement('a')
		              elink.download = fileName
		              elink.style.display = 'none'
		              elink.href = URL.createObjectURL(blob)
		              document.body.appendChild(elink)
		              elink.click()
		              URL.revokeObjectURL(elink.href) // 释放URL 对象
		              document.body.removeChild(elink)
		            } else { // IE10+下载
		              navigator.msSaveBlob(blob, fileName)
		          }
				}).catch(err => {
					this.$message("下载文件失败！请重新尝试。")
				})
			},
		}
	}
</script>

<style>
</style>