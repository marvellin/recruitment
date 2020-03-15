<template>
	<div>
	<div style="" id="stepTip">
       	<a></a>
       	<img width="803" height="59" src="../../../../static/images/tiponce.jpg">
    </div>
	<div class="content_mid">
		<dl class="c_section c_section_mid">
			<dt>
				<slot name='slot1'></slot>
			</dt>
			<dd>
				<div class="c_text_1">基本信息为必填项，是求职者加速了解公司的窗口，认真填写吧！</div>
	            <img width="668" height="56" class="c_steps" alt="第一步" src="../../../../static/images/step1.png">
				<form id="stepForm">
	                    <h3>公司全称</h3>
	                    <input type="text" placeholder="请输入公司全称，如:广州市第一巴士股份有限公司" v-model="company.comdetail.fullname" name="name" id="name" class="valid">
	                    
	                    <h3>公司简称</h3> <!--非必填-->
	                    <input type="text" placeholder="请输入公司简称，如:广州一巴" v-model="company.comdetail.shortname" name="name" id="name" class="valid">	
	                    
	                    <h3>公司LOGO</h3> <!--非必填改必填-->
	                   	<div class="c_logo c_logo_pos">
	                    	<!--<a title="上传公司LOGO" class="inline cboxElement">-->
		                        <!--<div v-if="company.comdetail.img==undefined||company.comdetail.img==null" id="logoNo">
		                        	<input type="file" accept="image/jpeg,image/png,image/jp2,image/gif" @change="getimg">
		                    		<span>上传公司LOGO</span> <br>
							                            尺寸：190*190px  <br>
							                            大小：小于5M
								</div>-->
								<div id="logoShow">
									<img width="190" height="190" alt="公司logo" :src="company.comdetail.img">
	                        		<span style="width: 190px;height: 60px;">
	                        			<input type="file" accept="image/jpeg,image/png,image/jp2,image/gif" @change="getimg">
	                        			上传公司LOGO<br>190px*190px 小于5M
	                        		</span>
		                        </div>
							<!--</a>-->  
	                    </div>
	                    
	                    <h3>公司网址</h3>
	                    <input type="text" placeholder="请输入公司网址全链接，如:https://baidu.com" v-model="company.comdetail.comurl" name="website" id="website">	
	                    
	                    <h3>所在城市</h3>
	                    <div @mouseleave="cityboxshow=false">
	                    	<input @click.stop="cityboxshow=true" type="text" readonly="readonly" v-model="company.comdetail.city" placeholder="请选择公司所在城市，如:北京" name="city" id="city">	
	                    	<div v-if="citylist" class="boxUpDown_s boxUpDown_596 infobox" id="box_expectCity" style="width: 625px;position: absolute;background-color: #F1F1F1;" :style="{'display':cityboxshow?'block':'none'}">
		                        <dl>
										        			<dt>热门城市</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.hotcities" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>ABCDEF</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list1" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>GHIJ</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list2" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>KLMN</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list3" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>OPQR</dt>
										        			<dd>
										        				<span v-for="(item,index) in citylist.list4" :key='index' @click="pickcity(item)">
										        					{{item}}
										        				</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>STUV</dt>
										        			<dd><span v-for="(item,index) in citylist.list5" :key='index' @click="pickcity(item)">
										        				{{item}}
										        			</span>
											        		</dd>
										        	  	</dl>
										        		<dl>
										        			<dt>WXYZ</dt>
										        			<dd><span v-for="(item,index) in citylist.list6" :key='index' @click="pickcity(item)">
										        				{{item}}
										        			</span>
											        		</dd>
										        	  	</dl>
		                	</div>
	                    </div>
	                    
	                    <h3>行业领域</h3>
	                    <div @mouseleave="fieldboxshow=false">
		                    <input type="text" v-model="company.comdetail.field" placeholder="请选择行业领域" name="select_industry" id="select_industry" class="select" @click.stop="fieldboxshow=true">
		                    <div class="infobox" style="width: 625px;" id="box_industry" :style="{'display':fieldboxshow?'block':'none'}">
		                        <ul class="reset">
		                        	<li v-for="(item,index) in fieldlist" :key="index" @click="company.comdetail.field=item;fieldboxshow=false">
		                        		{{item}}
		                        	</li>
		                        </ul>
		                    </div>	
	                    </div>
	                    
	                    <h3>公司规模</h3>
	                    <div @mouseleave="scaleboxshow=false">
		                    <input @click.stop="scaleboxshow=true" v-model="company.comdetail.scale" type="text" readonly="readonly" placeholder="请选择公司规模" id="select_scale" class="select">
		                    <div class="infobox" style="width: 625px;" id="box_scale" :style="{'display':scaleboxshow?'block':'none'}">
		                        <ul class="reset">
		                        	<li v-for="(item,index) in scalelist" :key="index" @click="company.comdetail.scale=item;scaleboxshow=false">
		                        		{{item}}
		                        	</li>
		                        </ul>
		                    </div>	
	                    </div>
	                    
	                    <!--<h3>发展阶段</h3> 
	                    <div>
		                    <ul class="s_radio clearfix s_radio_ex">
		                    	<li v-for="(item,index) in stagelist" :key="index" @click="stage.currentstage=item">
		                    		{{item}}
		                    	</li>
		                        		                        	<li>未融资</li>
		                        		                        	<li>天使轮</li>
		                        		                        	<li>A轮</li>
		                        		                        	<li>B轮</li>
		                        		                        	<li>C轮</li>
		                        		                        	<li>D轮及以上</li>
		                        		                        	<li>上市公司</li>
		                    </ul>
	                    </div>-->
	                    
	                    <h3>最新融资情况</h3>
	                    <ul @mouseleave="stageboxshow=false" id="stagesList" class="reset infobox">
	                    	<li>
			                    <input @click.stop="stageboxshow=true" type="button" v-if="!company.stage.currentstage" value="请选择融资阶段" class="select_short select_invest">
			                    <input @click.stop="stageboxshow=true" type="button" v-if="company.stage.currentstage" v-model="company.stage.currentstage" class="select_short select_invest">
								<div style="width: 228px;" class="box_invest" :style="{'display':stageboxshow?'block':'none'}">
			                        <ul class="reset">
			                   			<li v-for="(item,index) in stagelist" :key="index" @click="company.stage.currentstage=item;stageboxshow=false">
				                    		{{item}}
				                    	</li>
				                    </ul>
			                    </div>
			                    <input type="text" v-model="company.stage.org" style="width: 384px;" placeholder="请输入投资机构，如:真格基金" name="stageorg">
	                    	</li>
	                    </ul>
	                    
	                    <h3>一句话介绍</h3> 
	                    <input type="text" v-model="company.comdetail.feature" placeholder="一句话概括公司亮点，如公司愿景、领导团队等，限50字" maxlength="50" name="temptation" id="temptation">	
	                    <span style="display:none;" class="error" id="beError"></span>
	                    <input type="submit" @click.prevent="goforward" value="下一步" id="stepBtn" class="btn_big fr">
	            </form>
			</dd>
		</dl>
	</div>
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
		data(){
			return{
				comdetail:null,
				stage:null,
				fieldlist:null,
				scalelist:null,
				stagelist:null,
				citylist:null,
				fieldboxshow:false,
				scaleboxshow:false,
				stageboxshow:false,
				cityboxshow:false
			}
		},
		created(){
			this.dataInit()
			this.getdatas()
			this.addlisteners()
		},
		mounted(){
			console.log('from index1 mounted' + JSON.stringify(this.company))
		},
		methods:{
			pickcity(city){
				this.company.comdetail.city = city
				this.cityboxshow = false
			},
			goforward(){
				this.$router.push({path:'/companyinfofillin/step2'})
			},
			getimg(e){
				var _this = this
				var files = e.target.files[0]
				/*
				 * 上传失败不应该有预览图，预览图应该由后台上传成功后回传
				 * if(!e || !window.FileReader || !files) return
				let reader = new FileReader()
				reader.readAsDataURL(files)//这里是关键一步，转换就在这里
				reader.onload = function(){
					_this.company.comdetail.img = this.result
				}
				console.log('in getimg ' + _this.company.comdetail.img)*/
				this.uploadimg(files)
			},
			uploadimg(file){
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
					this.company.comdetail.img = URL.createObjectURL(blob)
//					console.log('afterupdate')
//					console.log(this.company.comdetail.img)
					this.$message("上传成功!")
				}).catch(err => {
					this.$message("上传失败!")
					console.log(err)
				})
			},
			dataInit(){
				if(!this.company.comdetail || this.company.comdetail == {}){
					this.company.comdetail = {
						fullname:null,
						shortname:null,
						feature:null,
						city:null,
						field:null,
						scale:null,
						comurl:null,
						scale:null,
						img:'../../../../static/images/logo_default.png',
//						img:null,
						labels:[]
					}
				}
				if(!this.company.stage || this.company.stage == {}){
					this.company.stage = {
						currentstage:null,
						org:null
					}
				}
			},
			getdatas(){
				this.$axios.get("/static/data/fieldlist.json")
				.then(res => {
					this.fieldlist = res.data.fieldlist
				})
				.catch(err => {
					console.log(err)
				})
				this.$axios.get("/static/data/scalelist.json")
				.then(res => {
					this.scalelist = res.data.scalelist
				})
				.catch(err => {
					console.log(err)
				})
				this.$axios.get("/static/data/stagelist.json")
				.then(res => {
					this.stagelist = res.data.stagelist
				})
				.catch(err => {
					console.log(err)
				})
				this.$axios.get("/static/data/citylist.json")
				.then(res => {
					this.citylist = res.data.citylist
				})
				.catch(err => {
					console.log(err)
				})
			},
			addlisteners(){
				document.addEventListener('click',e => {
					let citybox = document.getElementById('box_expectCity')
					let scalebox = document.getElementById('box_scale')
					let fieldbox = document.getElementById('box_industry')
					let stagebox = document.getElementById('stagesList')
					if(citybox && !citybox.contains(e.target)){
						this.cityboxshow=false
					}
					if(scalebox && !scalebox.contains(e.target)){
						this.scaleboxshow=false
					}
					if(fieldbox && !fieldbox.contains(e.target)){
						this.fieldboxshow=false
					}
					if(stagebox && !stagebox.contains(e.target)){
						this.stageboxshow=false
					}
				})
			}
		},
		watch:{
			/*company:{
				handler(newcompany,oldcompany){
					console.log(this.company.comdetail.img)
				},
//				immediate:true,
				deep:true
			}*/
		}
	}
</script>

<style>
	#stepForm input[type="text"]{
		height: 46px;
		width: 625px;
	}
</style>