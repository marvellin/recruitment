<template>
	<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1>
                    <em></em>
                    	待定简历  <span v-if="resume2positionlist">（共{{resume2positionlist.length}}份）
                    </span>                        
                </h1>
            </dt>
            <dd>
                <form v-if="resume2positionlist" action="canInterviewResumes.html" method="get" id="filterForm">
	                <div class="filter_actions">
		                <label class="checkbox">
		                    <input type="checkbox" @click="checkall" v-model="allcheck">
		                    <i :style="{'display':allcheck?'inline':'none'}"></i>
		                </label>
		                <span>全选</span>
		                <a id="resumeRefuseAll" @click.prevent="inform" href="javascript:void(0);">通知面试</a>
		                <a id="resumeRefuseAll" href="javascript:void(0);" @click.prevent="unSuitable(-1)">不合适</a>
		            </div><!-- end .filter_actions -->
                    <ul class="reset resumeLists">
		                <li v-if="item.resume" class="onlineResume" v-for="(item,index) in resume2positionlist" :key='item.deliveryId'>
			                <label class="checkbox">
			                    <input type="checkbox" :value="item.deliveryId" v-model="checkmodel">
			                    <i :style="{'display':showlabel(item.deliveryId)?'inline':'none'}"></i>
			                </label>
			                <resumebox :resume='item.resume' :time='item.deliverytime' :position='item.position'>
			                	<a class="resume_notice" @click.prevent="informperson(item.deliveryId)" href="javascript:void(0)" slot='slot1'>通知面试</a>
			    				<a class="resume_refuse" href="javascript:void(0)" slot='slot2' @click.prevent="unSuitable(item.deliveryId)">不合适</a>	
			                </resumebox>
			            </li>
		            </ul><!-- end .resumeLists -->
		        </form>
		        
		        <form v-if="!resume2positionlist||resume2positionlist.length==0">
			    	<div style="text-align: center;font-weight: 600;line-height:40px;margin: 20px 10px;padding: 20px 10px;">
						您还没有待定简历！
						<a style="position: relative;cursor:pointer" href="javascript:void(0);">
							<!--<span>请上传您的简历附件（不多于3个）</span>-->
							<!--<input type="file" @change="getresumefile" style="{display:block;position:absolute;top:0;left:0;width:219px;height:19px;font-size:100px;opacity:0;filter:alpha(opacity=0);cursor:pointer}" accept="application/msword,application/pdf,application/vnd.ms-powerpoint,application/vnd.ms-works,text/plain"/>-->
						</a>
						<div>
							<img width="150px" height="150px" src="../../../../../static/images/u=1065457796,2310451731&fm=26&gp=0.jpg"/>
						</div>
					</div>
			    </form>
            </dd>
        </dl><!-- end .company_center_content -->
    </div>
</template>

<script>
	import resumebox from '../resumebox/resumebox'
	export default{
		name:'undeterminedresume',
		components:{
			resumebox
		},
		data(){
			return{
				resume2positionlist:[],
				checkmodel:[],
				allcheck:false
			}
		},
		methods:{
			dataInit(){
				this.$axios({
					method:'get',
					url:'/api/delivery/getListByPositionIdListStatus2',
					params:{
						companyId:this.myCompanyId
					}
				}).then(res=>{
					console.log(res)
					this.resume2positionlist = res.data.object
				}).catch(err=>{
					console.log(err)
				})
			},
			checkall(){
				if(this.allcheck){
					this.checkmodel = []
				}else{
					this.resume2positionlist.forEach((item,index) => {
						if(this.checkmodel.indexOf(item.deliveryId) === -1){
							this.checkmodel.push(item.deliveryId)
						}
					})
				}
			},
			unSuitable(index){
				var deliveryIdList = new Array()
				if(index<0){
					deliveryIdList = this.checkmodel
				}
				else{
					deliveryIdList.push(index)
				}
				this.$axios({
					method:'get',
					url:'/api/delivery/toUnsuitable',
					params:{
						deliveryIdList:deliveryIdList+''
					}
				}).then(res=>{
					console.log(res)
					this.dataInit()
				}).catch(err=>{
					console.log(err)
				})
			},
			informperson(item){
				var list = new Array()
				list.push(item)
				this.$emit("informperson",list)
			},
			inform(){
				let informlist = []
				if(this.checkmodel){
					for(let i = 0; i < this.checkmodel.length; i++){
						let index = this.checkmodel[i]
						informlist.push(this.resume2positionlist[index])
					}
				}
				this.$emit("inform",this.checkmodel)
			},
			showlabel(index){
				if(this.checkmodel.indexOf(index) > -1){
					return true
				}else{
					return false
				}
			}
		},
		created(){
			//获取resume2positionlist
			this.dataInit()
			/*this.$axios.get('/static/data/resume2positionlist.json').then(res => {
				this.resume2positionlist = res.data.resume2positionlist
			});*/
		},
		computed:{
			myCompanyId(){
				return this.$store.state.company.companyId()
			}
		},
		watch:{
			checkmodel(){
				if(this.checkmodel.length === this.resume2positionlist.length){
					this.allcheck = true
				}
				else{
					this.allcheck = false
				}
			}
		}
	}
</script>

<style>
</style>