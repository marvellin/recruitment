<template>
	<div :class="[menu_box,show?current:'']" style="position: relative;" @mouseover="mouseOn($event)" @mouseout="mouseOut($event)">
		<menumain ref='menumain' :main='part.main'></menumain>
		<menusub :sublist='part.sub' :show="show"></menusub>
	</div>
</template>

<script>
	import menumain from './menumain.vue'
	import menusub from './menusub.vue'
	export default{
		name:'menubox',
		props:['part'],
		components:{menumain,menusub},
		data(){
			return{
				show:false,
				menu_box:'menu_box',
				current:'current'
			}
		},
		methods:{
			mouseOn(){
				this.show=true
			},
			mouseOut(){
				this.show=false
			}
		}
	}
</script>

<style>
</style>