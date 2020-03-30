<template>
	<div id="deliveryForm">
		<ul class="reset my_delivery">
		   	<li v-for="(item,index) in deliverylist" :key="index">
		    	<deliverybox @refresh="refresh" @showbox="showbox(index)" :show="statusboxshow&&currentbox==index" :status="item.status" :delivery="item" :position="item.position" :companyId="item.position.companyId" :deliverytime="item.deliverytime" :feedback="item.feedBack"></deliverybox>
		    	<statusbox @closebox="closebox" :show="statusboxshow&&currentbox==index" :status="item.status" :deliverytime="item.deliverytime" :feedBack="item.feedBack"></statusbox>
		    </li>
		</ul>
	</div>
</template>

<script>
	import deliverybox from '../deliverybox/deliverybox'
	import statusbox from '../statusbox/statusbox'
	export default{
		name:"deliveryform",
		components:{
			deliverybox,
			statusbox
		},
		watch:{
			$route(to,from){
				/*console.log(from.query.type)
				console.log(to.query.type)*/
				this.type=to.query.type
				this.getdeliverylist(to.query.type)
			}
		},
		data(){
			return{
				type:'getListByPersonId',
				deliverylist:[],
				statusboxshow:false,
				currentbox:null,
			}
		},
		created(){
			if(this.$route.query.type!=undefined&&this.$route.query.type!=null&&this.$route.query.type!=''){
				this.type = this.$route.query.type
			}
			this.getdeliverylist(this.type)
		},
		computed:{
			myPersonId(){
				return this.$store.state.person.personId()
			}
		},
		methods:{
			refresh(){
				this.getdeliverylist(this.type)
			},
			closebox(){
				this.statusboxshow = false
				this.currentbox = null
//				console.log(this.statusboxshow)
			},
			showbox(index){
				this.statusboxshow = !this.statusboxshow
				this.currentbox = index
//				console.log(this.statusboxshow)
			},
			getdeliverylist(path){
				/*this.$axios.get("http://127.0.0.1:3000/deliverylist")
				.then((res) => {
					this.deliverylist = res.data
				})
				.catch((err) => {
					console.log(err)
				})*/
				console.log('enter getlist')
				this.$axios({
					method:'get',
					url:'/api/delivery/'+path,
					params:{
						personId:this.myPersonId
					}
				}).then(res => {
					console.log(res)
					this.deliverylist = res.data.object
				}).catch(err => {
					console.log(err)
				})
				}
		}
	}
</script>

<style>
</style>