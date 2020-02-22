<template>
	<div>
		<h3>
		    <!--<a target="_blank" title="随便写" href="">随便写</a>--> 
		    <router-link target="_blank" title="" to="">{{position.name}}</router-link>
		    <span>[{{position.city}}]</span>
		</h3>
		<slot name="slot1"></slot>
		<div>{{position.type}} / {{position.salarymin}}k-{{position.salarymax}}k / {{position.experience}} / {{position.degree}}及以上</div>
		<div class="c9">发布时间： {{time}}</div>
		<div class="links">
		    <router-link target = "_blank" class="job_edit" to="">编辑</router-link>
		    <slot name="slot2"></slot>                     
		    <a class="job_del" href="javascript:void(0)">删除</a>
		</div>
	</div>
</template>

<script>
	export default{
		name:"positionbox",
		props:{
			position:{
				type:Object
			},
			time:{
				
			},
		}
	}
</script>

<style>
</style>