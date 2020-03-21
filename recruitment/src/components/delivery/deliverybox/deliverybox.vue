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
			<a v-if="status==2" class="btn_showprogress" @click.prevent="showstatusbox" href="javascript:;">
			    <!--<span>反馈结果：</span>-->
			         已查看
			    <i :class="[show?'transform':'']"></i>
			</a>
			<a v-if="status==1" class="btn_showprogress" href="javascript:;">
			    <!--<span>反馈结果：</span>-->
			    	已投递
			    <!--<i :class="[show?'transform':'']"></i>-->
			</a>
			<a v-if="status==3" class="btn_showprogress" @click.prevent="showstatusbox" href="javascript:;">
			    <span>反馈结果：</span>
			    	{{feedback}}
			    <i :class="[show?'transform':'']"></i>
			</a>
		</div>
</template>

<script>
	export default{
		name:"deliverybox",
		props:{
			status:{},
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
		created(){
			console.log(this.status)
		},
		methods:{
			deletedelivery(){},
			showstatusbox(){
//				console.log(this.status)
				this.$emit("showbox",'')
			}
		}
	}
</script>

<style>
</style>