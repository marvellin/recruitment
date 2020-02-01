<template>
<div class="hot_info" style="display: block;top:0px;left: 0px;transition: all 300ms ease 0s;">
<!--<div class="hot_info" style="display: block;left: 0px;transition: all 300ms ease 0s;" :style="{'top':show?'0px':'-100%'}">-->
	<h2 :title="info.h2">{{info.h2}}</h2>
	<em></em>
	<p :title="info.p">
		{{info.p}}
	</p>
</div>
</template>

<script>
	export default{
		name:'hotinfo',
		props:['info','show'],
		data(){
			return{
				mydir:'t'
			}
		},
		methods:{
			
		},
		/*computed:{
			changeMydir(){
				this.mydir = this.dir
				console.log('dir' + this.dir)
				console.log('mydie' + this.mydir)
			}
		},*/
		/*watch:{
			dir(){
				
			}
		}*/
	}
</script>

<style scoped>
	/*.hot_info{
		display: none;
		left: 0;
		top: 0;
		transition: all 300ms ease 0s; 
	}
	.current{
		display: block;
		left: 0;
		top: 0;
		transition: all 300ms ease 0s;
	}*/
	/*.hot_info{
		display: none;
	}
	.current{
		display: block;
	}*/
</style>