<template>
	<div>
		<div id="body">
			<headert :navlist='2' :isCompany='true'></headert>
			<div id="container">
				<sidebar>
					<div class="subscribe_side mt20" slot='slot1'>
						    <div class="f14">想收到更多更好的简历？</div>
						    <div class="f18 mb10">就用招聘加速助手 </div>
						    <div>咨询：<a class="f16" href="javascript:void(0)">1021478667@qq.com</a></div>
						    <div class="f18 ti2em">15813359257</div>
					</div>
					<div class="subscribe_side mt20" slot='slot2'>
						   <div class="f14">加入互联网HR交流群</div>
						   <div class="f18 mb10">跟同行聊聊</div>
						   <div class="f24">111101111</div>
					</div>
				</sidebar>
        		
		        <router-view @informperson="informperson" @inform="showcolorbox"/>

				<div class="clear"></div>
			    <totop></totop>
			</div>
		</div>
		<footert></footert>
		<colorbox id="colorbox" v-if="feedbackdetail" :show="colorboxshow" title="面试信息" @closebox="closecolorbox">
			<div slot="slot1">
				<form id="interviewform" style="font-size: 15px;font-weight: 550;">
					<table>
					<tbody>
					<tr>
					    <td><span class="redstar">*</span></td>
					    <td>时间</td>
					    <td>
					    	<div style="width: 450px;height: 60px;">
					    		<Date-picker @on-open-change="checktime" :options="datepickeroptions" placement="bottom" @on-change="getinterviewtime" id="datepicker" style="width: 450px;height: 70px;" type="datetime" format="yyyy-MM-dd HH:mm" placeholder="请选择面试时间"></Date-picker>
					    		<!--<el-alert style="width: 450px;height: 36px;" :closable="false" title="面试时间是必须的." type="error" v-show="hasinterviewtimeError"></el-alert>-->
					    	</div>
					    	<el-alert style="width: 450px;height: 36px;" :closable="false" title="面试时间是必须的." type="error" v-show="hasinterviewtimeError"></el-alert>
		                </td>
					</tr>
					<tr>
					    <td><span class="redstar">*</span></td>
					    <td>地点</td>
					    <td>
					    	<input type="text" v-validate="'required'" v-model="feedbackdetail.address" style="width: 450px;height: 40px;" placeholder="请输入具体面试地点" name="interviewaddress" id="interviewaddress">
					    	<el-alert style="width: 450px;height: 36px;" :closable="false" :title="errors.first('interviewaddress')" type="error" v-show="errors.has('interviewaddress')"></el-alert>
		                </td>
					</tr>
					<tr>
					    <td><span class="redstar">*</span></td>
					    <td>电话</td>
					    <td>
					    	<input v-validate="'required|min:11|max:11|tel'" type="text" v-model="feedbackdetail.tel" style="width: 450px;height: 40px;" placeholder="请输入HR联系方式" name="hrtel" id="hrtel">
					    	<el-alert style="width: 450px;height: 36px;" :closable="false" :title="errors.first('hrtel')" type="error" v-show="errors.has('hrtel')"></el-alert>
		                </td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<Button @click="inform">通知面试</Button>
						</td>
					</tr>
					</tbody>
					</table>
				</form>
			</div>
		</colorbox>
	</div>
</template>

<script>
	import headert from '../../header/header'
	import footert from '../../footer/footer'
	import totop from '../../totop/totop'
	import sidebar from './sidebar/sidebar'
	import colorbox from '../../colorbox/colorbox'
	export default{
		name:'postjob',
		created(){
			
		},
		components:{
			headert,
			footert,
			totop,
			sidebar,
			colorbox
		},
		data(){
			return{
				hasinterviewtimeError:false,
				feedbackdetail:null,
				colorboxshow:false,
				seekers:null,
				datepickeroptions:{
					disabledDate (date) {
                        return date && date.valueOf() < Date.now() - 86400000;
//						return date && date.valueOf() < Date.now()
                    }
				}
			}
		},
		methods:{
			checktime(e){
//				console.log(e)
				if(e === false){
					if(this.feedbackdetail.time === undefined || this.feedbackdetail.time === null || this.feedbackdetail.time === ''){
						this.hasinterviewtimeError = true
						return
					}
				}
				this.hasinterviewtimeError = false
			},
			inform(){
				this.$validator.validate().then((result) => {
			        if (result) {
			        	//判断面试事件是否报错
			        	if(!this.hasinterviewtimeError){
			        		//如不报错，则根据seekers的idlist访问后台并提交保存面试数据，并关闭colorbox
			        		this.colorboxshow = false
			        		//打印面试信息
			        		console.log(this.feedbackdetail)
			        		//打印通知的求职者
			        		console.log(this.seekers)
			        	}
			        	else{
			        		//提示报错并停留在colorbox，并且不提交数据
			        		this.$message({
								type:'warn',
								message:"请先面试时间信息！"
							})
			        	}
			        }
			        else{
				        this.$message({
							type:'warn',
							message:"请先完善面试信息！"
						})
			        }
			      }).catch(err => {
			      		this.$message({
							type:'warn',
							message:"请先完善面试信息！"
						})
			      		console.log(err)
			      })
				//通过idlist访问后台
				/*console.log('面试信息')
				console.log(this.feedbackdetail)
				console.log('求职者')
				console.log(this.seekers)*/
				
				/*//关闭colorbox
				this.colorboxshow = false*/
			},
			informperson(person){
				this.seekers = person
				this.feedbackdetail = {
					address:null,
					tel:null,
					time:null
				}
				this.colorboxshow = true
			},
			showcolorbox(list){
				this.seekers = list
				this.feedbackdetail = {
					address:null,
					tel:null,
					time:null
				}
				this.colorboxshow = true
			},
			closecolorbox(){
				this.colorboxshow = false
			},
			getinterviewtime(e){
				console.log("entertime")
				this.feedbackdetail.time = e
			}
		}
	}
</script>

<style>
	#datepicker .ivu-input{
		width: 450px;
		height: 40px;
	}
	#datepicker .ivu-input-wrapper{
		margin-top: 10px;
	}
	#datepicker .ivu-icon{
		padding-top: 6px;
	}
	#colorbox{
		overflow: visible;
	}
	#interviewform td{
		width: 50px;
		padding: 10px 0;
		margin-right: 10px;
		line-height: 50px;
	}
	#interviewform table{
		width: 100%;
	}
	#interviewform td .redstar{
		float: right;
		width: 30px;
		margin:8px 0 0 0 ;
	}
	#interviewform input{
		margin: 0 0;
	}
</style>