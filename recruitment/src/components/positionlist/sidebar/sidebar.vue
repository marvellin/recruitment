<template>
	<div class="sidebar">
	    <div id="options" class="greybg">
	    	<dl v-for="(item1,index1) in optionlist" :key="index1">
	    		<dt @click="clickoption(index1)">
	    			{{item1.name}}
	    			<em :class="[showoption(index1)?'':'transform']"></em></dt>
	    		<dd :style="{'display':showoption(index1)?'block':'none'}">
	    			<div v-for="(item2,index2) in item1.list" :key="index2" @click="pickoption(item2)">
	    				{{item2}}
	    			</div>
	    		</dd>
	    	</dl>
	    </div>
	    <slot name="slot1"></slot>
	    <slot></slot>
	</div>
</template>

<script>
	export default{
		name:"sidebar",
		data(){
			return{
				currentoption:[],
				optionlist:[]
			}
		},
		created(){
			this.$axios.get('/static/data/optionlist.json').then((res) => {
				this.optionlist = res.data.optionlist
				this.initarr()
			}).catch((err) => {
				console.log(err)
			})
		},
		methods:{
			initarr(){
				for(let i = 0; i < this.optionlist.length; i++){
					this.currentoption.push(i)
				}
			},
			clickoption(index){
				if(this.currentoption.indexOf(index) > -1){
					this.currentoption.splice(this.currentoption.indexOf(index),1)
				}
				else{
					this.currentoption.push(index)
				}
			},
			pickoption(item){
				//访问后台根据item条件查找返回符合条件的职位list
			},
			showoption(index){
				if(this.currentoption.indexOf(index) > -1){
					return true
				}
				else{
					return false
				}
			}
		}
	}
</script>

<style>
</style>