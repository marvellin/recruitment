<template>
	<div id="deliveryForm">
		<ul class="reset my_delivery">
		   	<li v-for="(item,index) in deliverylist" :key="index">
		    	<deliverybox @showbox="showbox" :show="statusboxshow" :status="item.status" :position="item.position" :company="item.company" :deliverytime="item.deliverytime" :feedbacktime="item.feedbacktime" :feedback="item.feedback"></deliverybox>
		    	<statusbox @closebox="closebox" :show="statusboxshow" :status="item.status" :deliverytime="item.deliverytime" :feedbacktime="item.feedbacktime" :feedbackdetail="item.feedbackdetail"></statusbox>
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
		data(){
			return{
				deliverylist:[],
				statusboxshow:false,
			}
		},
		created(){
			this.getdeliverylist()
		},
		methods:{
			closebox(){
				this.statusboxshow = false
//				console.log(this.statusboxshow)
			},
			showbox(){
				this.statusboxshow = !this.statusboxshow
//				console.log(this.statusboxshow)
			},
			getdeliverylist(){
				this.$axios.get("http://127.0.0.1:3000/deliverylist")
				.then((res) => {
					this.deliverylist = res.data
				})
				.catch((err) => {
					console.log(err)
				})
			}
		}
	}
</script>

<style>
</style>