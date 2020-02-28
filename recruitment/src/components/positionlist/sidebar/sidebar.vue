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
	       <!-- <dl>
	            <dt>月薪范围 <em ></em></dt>
		        <dd>
		            <div>2k以下</div>
		            <div>2k-5k</div>
		            <div>5k-10k</div>
		            <div>10k-15k</div>
		            <div>15k-25k</div>
		            <div>25k-50k</div>
		            <div>50k以上</div>
		        </dd> 
	        </dl>
	        <dl>
	            <dt>工作经验 <em ></em></dt>
		        <dd>
		                    	                    	<div>不限</div>
		                    	                    	<div>应届毕业生</div>
		                    	                    	<div>1年以下</div>
		                    	                    	<div>1-3年</div>
		                    	                    	<div>3-5年</div>
		                    	                    	<div>5-10年</div>
		                    	                    	<div>10年以上</div>
		        </dd> 
	        </dl>
	        <dl>
	            <dt>最低学历 <em ></em></dt>
		        <dd>
		                    	                    	<div>不限</div>
		                    	                    	<div>大专</div>
		                    	                    	<div>本科</div>
		                    	                    	<div>硕士</div>
		                    	                    	<div>博士</div>
		        </dd> 
	        </dl>
	        <dl>
	        <dt>工作性质 <em ></em></dt>
		    	<dd>
		                    	                    	<div>全职</div>
		                    	                    	<div>兼职</div>
		                    	                    	<div>实习</div>
		    	</dd> 
	        </dl>
	        <dl>
	            <dt>发布时间 <em ></em></dt>
		        <dd>
		                    	                    	<div>今天</div>
		                    	                    	<div>3天内</div>
		                    	                    	<div>一周内</div>
		                    	                    	<div>一月内</div>
		        </dd> 
	        </dl>-->
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
//			console.log(this)
			this.$axios.get('/static/data/optionlist.json').then((res) => {
				this.optionlist = res.data.optionlist
				this.initarr()
			}).catch((err) => {
				console.log(err)
			})
		},
		methods:{
			initarr(){
//				console.log(this.optionlist.length)
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
//				console.log(this.currentoption)
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