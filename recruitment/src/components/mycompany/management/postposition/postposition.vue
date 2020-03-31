<template>   		
	<div class="content">
		<dl class="company_center_content">
		    <dt>
		        <h1>
		            <em></em>
		                               发布新职位
		        </h1>
		    </dt>
		<dd>
		<form action="http://www.lagou.com/corpPosition/preview.html" method="post" id="jobForm">
		                            <table class="btm">
		                            	<tbody>
			                            	<tr>
			                                	<td width="25"><span class="redstar">*</span></td>
			                                	<td width="85">职位类别</td>
			                                	<td @mouseleave="jobboxshow=false">
			                                    	<!--<input type="hidden" id="positionType" value="" name="positionType">-->
			                                        <input v-validate="'required'" name="posttype" @click.stop="jobboxshow=true" :class="[jobboxshow?'selectrFocus':'']" type="text" readonly="readonly" style="width: 380px;height: 46px;" placeholder="请选择职位类别" :value="job.post" id="select_category" class="selectr selectr_380">      
			                                        <el-alert style="width: 380px;height: 30px;" :closable="false" :title="errors.first('posttype')" type="error" v-show="errors.has('posttype')"></el-alert>
			                                        <jobbox name="jobbox" :jobboxshow='jobboxshow' @getposttype='getposttype' @getpost='getpost'></jobbox>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>职位名称</td>
			                                	<td>
			                                    	<input v-validate="'required'" type="text" style="width: 380px;height: 46px;" placeholder="请输入职位名称，如：产品经理" v-model="job.name" name="positionName" id="positionName">
			                                    	<el-alert style="width: 380px;height: 30px;" :closable="false" :title="errors.first('positionName')" type="error" v-show="errors.has('positionName')"></el-alert>
                                                </td>
			                                </tr>
			                            	<tr>
			                                	<td></td>
			                                	<td>所属部门</td>
			                                	<td>
			                                    	<input v-validate="'required'" type="text" style="width: 380px;height: 46px;" placeholder="请输入所属部门" v-model="job.department" name="department" id="department">	
			                                    	<el-alert style="width: 380px;height: 30px;" :closable="false" :title="errors.first('department')" type="error" v-show="errors.has('department')"></el-alert>
			                                    </td>
			                                </tr>
		                            	</tbody>
		                            </table>
		                            
		                            <table class="btm">
		                            	<tbody>
		                            		<tr>
			                                	<td width="25"><span class="redstar">*</span></td>
			                                	<td width="85">工作性质</td>
			                                	<td>
			                                    	<ul class="profile_radio clearfix reset">
			                                    		<li style="width: 46px;height: 46px;" v-for="(item,index) in jobtypelist" :key='index' :class="[item==job.type?'current':'']" @click="job.type=item">
			                                    			{{item}}<em></em>
			                                    			<input type="radio" name="jobNature" :value="item"/>
			                                    		</li>
			                                        </ul>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>月薪范围</td>
			                                	<td>
			                                		<!--<div style="text-align: center;">只能填写整数，如:9</div>-->
			                                		<div style="height: 80px;">
			                                			<input v-validate="'required|numeric|between:0,1000'" type="text" style="width: 365px;height: 46px;" placeholder="最低月薪" v-model="job.salarymin" id="salaryMin" name="salaryMin">K
			                                    		<el-alert style="width: 365px;height: 30px;" :closable="false" :title="errors.first('salaryMin')" type="error" v-show="errors.has('salaryMin')"></el-alert>
			                                    	</div>
			                                    	<div style="height: 80px;">
			                                    		<input @blur="checksalary" v-validate="'required|numeric|between:0,1000'" type="text" style="width: 365px;height: 46px;" placeholder="最高月薪" v-model="job.salarymax" id="salaryMax" name="salaryMax">K
			                                    		<el-alert style="width: 365px;height: 30px;" :closable="false" :title="errors.first('salaryMax')" type="error" v-show="errors.has('salaryMax')&&!hassalaryError"></el-alert>
			                                    		<el-alert style="width: 365px;height: 30px;" :closable="false" title="最高月薪不能低于最低月薪" type="error" v-show="hassalaryError"></el-alert>
			                                    	</div>
			                                    	<!--<div class="salary_range" style="height: 90px;">
			                                            <div>
			                                                <input v-validate="'required|numeric|between:0,1000'" type="text" style="width: 146px;height: 46px;margin-top: 0px;" placeholder="最低月薪" v-model="job.salarymin" id="salaryMin" name="salaryMin">
			                                                <span>k</span>
			                                                <div style="width: 146px;height: 36px;display: none;" v-show="!errors.has('salaryMin')"></div>
			                                                <el-alert style="width: 146px;height: 36px;" id="salarymaxalert" :closable="false" :title="errors.first('salaryMin')" type="error" v-show="errors.has('salaryMin')"></el-alert>
			                                            </div>
			                                          
			                                            <div>
			                                                <input @blur="checksalary" v-validate="'required|numeric|between:0,1000'" type="text" style="width: 146px;height: 46px;margin-top: 0px;" placeholder="最高月薪" v-model="job.salarymax" id="salaryMax" name="salaryMax"> 
			                                                <span>k</span>
			                                                <div style="width: 146px;height: 36px;display: none;" v-show="!errors.has('salaryMax')"></div>
			                                                <el-alert style="width: 146px;height: 36px;" id="salaryminalert" :closable="false" :title="errors.first('salaryMax')" type="error" v-show="errors.has('salaryMax')&&!hassalaryError"></el-alert>
			                                                <el-alert style="width: 146px;height: 36px;" id="salaryminalert" :closable="false" title="最高月薪不能低于最低月薪" type="error" v-show="hassalaryError"></el-alert>
			                                            </div>
			                                        </div>-->
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>工作城市</td>
			                                	<td style="position: relative;">
			                                    	<input v-validate="'required'" type="text" @click.stop="cityboxshow=true" readonly="readonly" style="width: 380px;height: 46px;" placeholder="请输入工作城市，如：北京" v-model="job.city" name="workAddress" id="workAddress">
			                                    	<el-alert style="width: 380px;height: 30px;" :closable="false" :title="errors.first('workAddress')" type="error" v-show="errors.has('workAddress')"></el-alert>
			                                    	<dd style="top:-400px;position: absolute;background-color: white;border: solid #019875 2px;overflow: hidden;z-index: 110;" id="box_expectCity" class="searchlist_expectCity" :style="{'display':cityboxshow?'block':'none'}">
									            		<span class="bot"></span>
									            		<span class="top"></span>
										    			<dl>
											    			<dt>ABCDEF</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list1" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>GHIJ</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list2" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>KLMN</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list3" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>OPQR</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list4" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>STUV</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list5" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
											    	  	<dl>
											    			<dt>WXYZ</dt>
											    			<dd>
											    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list6" :key="index">
											    					{{item}}
											    				</span>
											     			</dd>
											    	  	</dl>
										    		</dd>
			                                    </td>
			                                </tr>
		                            	</tbody>
		                            </table>
		
		                            <table class="btm">
		                            	<tbody>
		                            		<tr>
			                                	<td width="25"><span class="redstar">*</span></td>
			                                	<td width="85">工作经验</td>
			                                	<td @mouseleave="experienceboxshow=false">
			                                    	<!--<input type="hidden" id="experience" value="" name="workYear">-->
			                                        <input name='workexperience' v-validate="'required'" type="text" :class="[experienceboxshow?'selectrFocus':'']" @click="experienceboxshow=true" style="width: 380px;height: 46px;" readonly="readonly" placeholder="请选择工作经验" :value="job.experience" id="select_experience" class="selectr selectr_380">                                      
			                                        <el-alert style="width: 380px;height: 30px;" :closable="false" :title="errors.first('workexperience')" type="error" v-show="errors.has('workexperience')"></el-alert>
			                                        <div class="boxUpDown boxUpDown_380" style="width: 380px;" id="box_experience" :style="{'display':experienceboxshow?'block':'none'}">
			                                            <ul>
			                                            	<li v-for="(item,index) in experiencelist" :key='index' @click="job.experience=item;experienceboxshow=false">
			                                            		{{item}}
			                                            	</li>
			                                                <!--<li>
			                                                    	不限
			                                                </li>
			                                        	 	<li>
			                                                                                                                                                  应届毕业生
			                                                </li>
			                                        	 	<li>
			                                                        1年以下
			                                                </li>
			                                        	 	<li>
			                                                        1-3年
			                                                </li>
			                                        	 	<li>
			                                                        3-5年
			                                                </li>
			                                        	 	<li>
			                                                        5-10年
			                                                </li>
			                                        	 	<li>
			                                                        10年以上
			                                                </li>-->
			                                        	</ul>
			                                    	</div>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>学历要求</td>
			                                    <!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
			                                	<td @mouseleave="degreeboxshow=false">
			                                    	<!--<input type="hidden" id="education" value="" name="education">-->
			                                        <input name="select_education" v-validate="'required'" type="text" style="width: 380px;height: 46px;" @click="degreeboxshow=true" :class="[degreeboxshow?'selectrFocus':'']" readonly placeholder="请选择学历要求" :value="job.degree" id="select_education" class="selectr selectr_380">                                      
			                                        <el-alert style="width: 380px;height: 30px;" :closable="false" :title="errors.first('select_education')" type="error" v-show="errors.has('select_education')"></el-alert>
			                                        <div style="width: 380px;" class="boxUpDown boxUpDown_380" id="box_education" :style="{'display':degreeboxshow?'block':'none'}">
			                                            <ul>
			                                            	<li v-for="(item,index) in degreelist" :key='index' @click="job.degree=item;degreeboxshow=false">
			                                            		{{item}}
			                                            	</li>
			                                                <!--<li>
			                                                        	不限
			                                                </li>
			                                        	 	<li>
			                                                        	大专
			                                                </li>
			                                        	 	<li>
			                                                        	本科
			                                                </li>
			                                        	 	<li>
			                                                       	 	硕士
			                                                </li>
			                                        	 	<li>
			                                                       		 博士
			                                                </li>-->
			                                        	</ul>
			                                    	</div>
			                                    </td>
			                                </tr>
		                            	</tbody>
		                            </table>
		                           
		                            <table class="btm">
		                            	<tbody>
		                            		<tr>
			                                	<td width="25"><span class="redstar">*</span></td>
			                                	<td width="85">职位诱惑</td>
			                                	<td>
			                                    	<input v-validate="'required|max:20'" type="text" style="width: 560px;height: 46px;" placeholder="20字描述该职位的吸引力，如：福利待遇、发展前景等" v-model="job.advantage" name="positionAdvantage" class="input_520" id="positionAdvantage">
			                                    	<el-alert style="width: 520px;height: 30px;" :closable="false" :title="errors.first('positionAdvantage')" type="error" v-show="errors.has('positionAdvantage')"></el-alert>
			                                    </td>
			                                </tr>
			                            	<tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>职位描述</td>
			                                	<td>
			                                    	<span class="c9 f14">(建议分条描述工作职责等。请勿输入公司邮箱、联系电话及其他外链)</span>
			                                    	
			                                    	<editor @getcontent="getdetail"></editor>
			                                    	
			                                    	<span>
			                                    		<el-alert style="width: 520px;height: 30px;" :closable="false" title="职位描述是必须的." type="error" v-show="hasdetailError"></el-alert>
			                                    		<!--<el-alert style="width: 520px;height: 30px;" :closable="false" :title="errors.first('jobdetail')" type="error" :v-show="errors.has('jobdetail')"></el-alert>-->
			                                    	</span>
			                                   </td>
			                                    <!--<el-alert style="width: 649px;height: 30px;" :closable="false" title="职位描述是必须的." type="error" v-show="hasdetailError"></el-alert>-->
			                                </tr>
			                                <tr>
			                                	<td><span class="redstar">*</span></td>
			                                	<td>工作地址</td>
			                                	<td>
			                                    	<input v-validate="'required|max:50'" type="text" style="width: 560px;height: 46px;" placeholder="请输入详细的工作地址" v-model="job.address" name="positionAddress" class="input_520" id="positionAddress">	
			                                    	<el-alert style="width: 520px;height: 30px;" :closable="false" :title="errors.first('positionAddress')" type="error" v-show="errors.has('positionAddress')"></el-alert>
			                                    </td>
			                                </tr>
		                            	</tbody>
		                            </table>
		                            
		                            <table>
		                            	<tbody>
			                                <tr>
			                                	<!--<td width="25"></td>-->
			                                	<td colspan="3" align="center">
			                                    	<!--<input type="button" value="预览" id="jobPreview" class="btn_32 fl">-->
			                                    	<input type="button" @click="postposition" value="发布" id="formSubmit" class="btn_32">
			                                    </td>
			                                </tr>
		                         		</tbody>
		                            </table>
		</form>
		</dd>
		</dl>
	</div>

</template>

<script>
	import jobbox from './jobbox'
	import editor from '../../../editor/editor'
	export default{
		name:'postposition',
		created(){
			document.addEventListener('click',e => {
				let jobbox = document.getElementById("box_expectCity")
				if(jobbox && !jobbox.contains(e.target)){
					this.cityboxshow=false
				}
			})
		},
		components:{
			jobbox,
			editor
		},
		data(){
			return{
				hassalaryError:false,
				hasdetailError:false,
				jobboxshow:false,
				cityboxshow:false,
				experienceboxshow:false,
				degreeboxshow:false,
				jobtypelist:['全职','兼职','实习'],
				citylist:{
					hotcities:['北京','上海','广州','深圳','成都','杭州','武汉','南京'],
					list1:['北京','长春','成都','重庆','长沙','常州','东莞','大连','佛山','福州'],
					list2:['贵阳','广州','哈尔滨','合肥','海口','杭州','惠州','金华','济南','嘉兴'],
					list3:['昆明','廊坊','宁波','南昌','南京','南宁','南通'],
					list4:['青岛','泉州'],
					list5:['上海','石家庄','绍兴','沈阳','深圳','苏州','天津','太原','台州'],
					list6:['武汉','无锡','温州','西安','厦门','烟台','珠海','中山','郑州']
				},
				experiencelist:['不限','应届毕业生','1年以下','1-3年','3-5年','5-10年'],
				degreelist:['不限','大专','本科','硕士','博士'],
				job:{
					post:null,//工作类别
					name:null,//具体工作名称
					type:'全职',//兼职、全职或实习，默认为全职
					department:null,
					salarymin:null,
					salarymax:null,
					city:null,
					experience:null,
					degree:null,
					advantage:null,
					detail:null,
					address:null
				}
			}
		},
		computed:{
			getjobdetail(){
				return this.job.detail
			},
			myCompanyId(){
				return this.$store.state.company.companyId()
			}
		},
		watch:{
			getjobdetail:{
				handler(){
					if(this.job.detail === null || this.job.detail === ''){
						this.hasdetailError = true
						return
					}
					this.hasdetailError = false
				}
			}
		},
		methods:{
			checksalary(){
				if(this.job.salarymax === undefined || this.job.salarymax === null || this.job.salarymax === ''){
					this.hassalaryError = false
					return
				}
				else{
					this.hassalaryError = this.job.salarymin > this.job.salarymax
				}
			},
			postposition(){
				console.log(this.job)
				var me = this
				this.$validator.validate().then((result) => {
			        if (result) {
			        	//判断detail是否为空
			        	if(this.job.detail === undefined || this.job.detail === null || this.job.detail === ''){
			        		//为空时报错且不提交数据
			        		this.hasdetailError = true
			        		this.$message({
			        			message:"职位描述不能为空！"
			        		})
			        		return
			        	}
			        	else{
			        		//不为空时，提交职位数据到后台，提交成功则跳转到发布成功界面
				        	/*this.$axios.post('http://127.0.0.1:3000/position',this.job).then(res => {
								this.$router.push({path:'/management/success'})
							}).catch(err => {
								console.log(err)
							})*/
							this.$axios({
								method:'post',
								url:'/api/position/insert',
								data:this.job,
								params:{
									companyId:me.myCompanyId
								},
								headers:{
									'Content-Type':'application/json'
								},
							}).then(res=>{
								if(res.data.code==200){
									this.$router.push({path:'/management/success'})
								}
							}).catch(err=>{
								console.log(err)
							})
			        	}
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
				/*if(this.job){
					this.$axios.post('http://127.0.0.1:3000/position',this.job).then(res => {
						console.log(res)
						this.$router.push({path:'/management/success'})
					}).catch(err => {
						console.log(err)
					})
				}*/
			},
			getdetail(v){
//				console.log(v)
				this.job.detail = v
//				console.log(this.job.detail)
			},
			getposttype(type){
				this.job.post = type
				this.jobboxshow = false
			},
			getpost(post){
				this.job.name = post.name
				this.getposttype(post.type)
			},
			showjob(){
				console.log(this.job)
			},
			pickcity(city){
				this.job.city = city
				this.cityboxshow = false
			}
		}
	}
</script>

<style>
	#salarymaxalert{
		width: 146px;
		padding: 0;
	}
	#salarymaxalert .el-alert__content{
		line-height: 36px;
		height: 36px;
		width: 146px;
		text-align: center;
	}
	#salarymaxalert .el-alert__content span{
		height: 36px;
		line-height: 36px;
		font-size: 12px;
		
	}
	#salaryminalert{
		width: 146px;
		padding: 0;
	}
	#salaryminalert .el-alert__content{
		line-height: 36px;
		height: 36px;
		width: 146px;
		text-align: center;
	}
	#salaryminalert .el-alert__content span{
		height: 36px;
		line-height: 36px;
		font-size: 12px;
		
	}
	/*.el-alert{
		width: 146px;
		height: 46px;
		padding: 0;
		font-size: 10px;
	}
	.salary_range div{
		width: 146px;
	}*/
</style>