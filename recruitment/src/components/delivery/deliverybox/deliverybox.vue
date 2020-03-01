<template>
		<div class="d_item">
		    <h2 :title="position.name">
			    <router-link target="_blank" to="/positiondetail">
			        <em>{{position.name}}</em> 
			        <span>（{{position.salarymin}}k-{{position.salarymax}}k）</span>
			    </router-link>
			</h2>
			<a class="fr" @click.prevent="deletedelivery">删除</a>
		    <div class="clear"></div>
			<a title="公司名称" class="d_jobname" target="_blank" href="http://www.lagou.com/c/25927.html">
			    {{company.name}}<span>[{{company.city}}]</span> 
			</a>
			<span class="d_time">反馈时间：{{feedbacktime}}</span>
			<div class="clear"></div>
			<!--<div class="d_resume">
			           使用简历：
			    <span>
			           在线简历
		        </span>
			</div>-->
			<span class="d_time fl">投递时间：{{deliverytime}}</span>
			<a class="btn_showprogress" @click.prevent="showstatusbox" href="javascript:;">
			    <!--<span>反馈结果：</span>-->
			    {{feedback}}
			    <i :class="[show?'transform':'']"></i>
			</a>
		</div>
</template>

<script>
	export default{
		name:"deliverybox",
		props:{
			show:{
				type:Boolean
			},
			position:{type:Object},
			company:{type:Object},
			deliverytime:{},
			feedbacktime:{},
			feedback:{}
		},
		data(){
			return{
				
			}
		},
		methods:{
			deletedelivery(){},
			showstatusbox(){
				this.$emit("showbox",'')
			}
		}
	}
</script>

<style>
</style>