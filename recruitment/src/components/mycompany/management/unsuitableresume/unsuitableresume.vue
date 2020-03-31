<template>
	<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1 @click='show'>
                    <em></em>
                        	不适合简历 
                        	<span>
                        		（共{{resume2positionlist.length}}份）
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
		                <!--<a id="resumeRefuseAll" href="javascript:void(0);">通知面试</a>-->
		                <a id="resumeRefuseAll" @click.stop="deleteDelivery(-1)" href="javascript:void(0);">删除</a>
		            </div><!-- end .filter_actions -->
                    <ul class="reset resumeLists">
		                <li class="onlineResume" v-for="(item,index) in resume2positionlist" :key='item.deliveryId'>
			                <label class="checkbox">
			                    <input type="checkbox" :value="item.deliveryId" v-model="checkmodel">
			                    <i :style="{'display':showlabel(item.deliveryId)?'inline':'none'}"></i>
			                </label>
			                <resumebox :resume='item.resume' :time='item.deliverytime' :position='item.position'>
			                	<!--<a class="resume_notice" href="javascript:void(0)" slot='slot1'>通知面试</a>-->
			                	<a class="resume_notice" @click.stop="deleteDelivery(item.deliveryId)" href="javascript:void(0)" slot='slot2'>删除</a>
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
		name:'unsuitableresume',
		components:{
			resumebox
		},
		computed:{
			myCompanyId(){
				return this.$store.state.company.companyId()
			}
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
			dataInit(){
				this.$axios({
					method:'get',
					url:'/api/delivery/getListByPositionIdListStatus3&Unsuit',
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
			show(){
				console.log(this.checkmodel)
			},
			checkall(){
				if(this.allcheck){
					this.checkmodel = []
				}else{
					this.resume2positionlist.forEach((item) => {
						if(this.checkmodel.indexOf(item.deliveryId) === -1){
							this.checkmodel.push(item.deliveryId)
						}
					})
				}
			},
			showlabel(id){
				if(this.checkmodel.indexOf(id) > -1){
					return true
				}else{
					return false
				}
			},
			/*deleteone(id){
				for(let i = 0; i < this.resume2positionlist.length; i++){
					if(this.resume2positionlist[i].resume.id == id){
						this.resume2positionlist.splice(i,1)
						if(this.checkmodel.indexOf(id) > -1){
							this.checkmodel.splice(this.checkmodel.indexOf(id),1)
						}
						break
					}
				}
			},*/
			/*deletemul(){
				for(let i = this.checkmodel.length - 1; i >= 0; i--){
					let index = this.resume2positionlist.findIndex((item) => item.resume.id === this.checkmodel[i])
					this.resume2positionlist.splice(index,1)
					this.checkmodel.splice(i,1)
				}
			}*/
		},
		created(){
			//获取resume2positionlist
			this.dataInit()
			/*this.$axios.get('/static/data/resume2positionlist.json').then(res => {
				this.resume2positionlist = res.data.resume2positionlist
			});*/
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