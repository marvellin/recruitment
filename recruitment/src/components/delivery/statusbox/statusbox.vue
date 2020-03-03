<template>
	<div v-show="show" class="progress_status">
		<!--
			关于status
			1:是默认状态，即投送完成
			2:简历已查看状态，即简历被HR待定
			3:简历已回复状态，即已拒绝或已邀请面试，若拒绝则显示默认拒绝信息，若邀请面试则显示面试信息即feedbakcdetail
		-->
		<ul class="status_steps">
		    <li class="status_done status_1">1</li>
		    <li :class="[status>=2?'status_line_done':'status_line_grey']" class="status_line"><span></span></li>
		    <li :class="[status>=2?'status_done':'status_grey']"><span>2</span></li>
		    <li :class="[status>=3?'status_line_done':'status_line_grey']" class="status_line"><span></span></li>
		    <li :class="[status>=3?'status_done':'status_grey']"><span>3</span></li>
		    <!--<li class="status_line status_line_done"><span></span></li>
		    <li class="status_done"><span>4</span></li>-->
		</ul>
		<ul class="status_text">
		    <li>投递成功</li>
		    <li class="status_text_2">简历被查看</li>
		    <li class="status_text_3">投递反馈</li>
		    <!--<li style="margin-left: 75px;*margin-left: 60px;" class="status_text_4">不合适</li>-->
		</ul>
		<ul class="status_list">
		    <li class="top" v-if="status>=3">
		        <div class="list_time"><em></em>{{feedbacktime}}</div>
		        <div class="list_body" v-if="!feedbackdetail">简历被HR标记为不合适
		            <div>
		            	您的简历已收到，但目前您的工作经历与该职位不是很匹配，因此很抱歉地通知您无法进入面试。
		            </div>                               						                               					
		        </div>
		        <div class="list_body" v-if="feedbackdetail">
		        	<div>
		        		恭喜您的简历已通过HR筛选，现通知您参见下一轮面试！
		        	</div>
		        	<ul style="list-style: none;">
		        		<li>面试地点：{{feedbackdetail.address}}</li>
		        		<li>面试时间：{{feedbackdetail.time}}</li>
		        		<li>有疑问请咨询：{{feedbackdetail.tel}}</li>
		        	</ul>
		        </div>
		    </li>
		    <li class="bottom">
		        <div class="list_time"><em></em>{{deliverytime}}</div>
		        <div class="list_body">HR已成功接收你的简历</div>
		    </li>
		</ul>
		<a class="btn_closeprogress" @click.prevent="closestatusbox" href="javascript:;"></a>
	</div>
</template>

<script>
	export default{
		name:"statusbox",
		props:{
			status:{},
			feedbackdetail:{
				default:null
			},
			deliverytime:{},
			feedbacktime:{},
			show:{
				type:Boolean
			}
		},
		methods:{
			closestatusbox(){
				this.$emit("closebox",'')
			}
		}
	}
</script>

<style>
</style>