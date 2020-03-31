<template>
	<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1>
                    <em></em>
                    	已通知面试简历  <span>（共{{resume2positionlist.length}}份）
                    </span>                        
                </h1>
            </dt>
            <dd>
                <form action="canInterviewResumes.html" method="get" id="filterForm">
	                <div class="filter_actions">
		                <label class="checkbox">
		                    <input type="checkbox" @click="checkall" v-model="allcheck">
		                    <i :style="{'display':allcheck?'inline':'none'}"></i>
		                </label>
		                <span>全选</span>
		                <!--<a id="resumeRefuseAll" href="javascript:void(0);">待定</a>-->
		                <a id="resumeRefuseAll" @click.stop="deleteDelivery(-1)" href="javascript:void(0);">删除</a>
		                <a id="resumeRefuseAll" href="javascript:void(0);" @click.prevent="toUnsuit(-1)">不合适</a>
		            </div><!-- end .filter_actions -->
                    <ul class="reset resumeLists">
		                <li class="onlineResume" v-for="(item,index) in resume2positionlist" :key='item.deliveryId'>
			                <label class="checkbox">
			                    <input type="checkbox" :value="item.deliveryId" v-model="checkmodel">
			                    <i :style="{'display':showlabel(item.deliveryId)?'inline':'none'}"></i>
			                </label>
			                <resumebox :resume='item.resume' :time='item.deliverytime' :position='item.position'>
			                	<!--<a class="resume_notice" href="javascript:void(0)" slot='slot1'>待定</a>-->
			                	<a class="resume_notice" @click.stop="deleteDelivery(item.deliveryId)" href="javascript:void(0)" slot='slot1'>删除</a>
			    				<a class="resume_refuse" href="javascript:void(0)" slot='slot2' @click.prevent="toUnsuit(item.deliveryId)">不合适</a>	
			                </resumebox>
			            </li>
		            </ul><!-- end .resumeLists -->
		        </form>
            </dd>
        </dl><!-- end .company_center_content -->
    </div>
</template>

<script>
	import resumebox from '../resumebox/resumebox'
	export default{
		name:'notifiedresume',
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
			deleteDelivery(index){
				var deliveryIdList = new Array()
				if(index < 0){
					deliveryIdList = this.checkmodel
				}
				else{
					deliveryIdList.push(index)
				}
				this.$axios({
					method:'get',
					url:'/api/delivery/updateListByCompany',
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
			toUnsuit(index){
				var deliveryIdList = new Array()
				if(index < 0){
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
			dataInit(){
				this.$axios({
					method:'get',
					url:'/api/delivery/getListByPositionIdListStatus3&Inteview',
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