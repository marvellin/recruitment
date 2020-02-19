<template>
	<div class="sidebar">
	            	<a class="btn_create" href="create.html">发布新职位</a>
	                <dl class="company_center_aside">
						<dt>我收到的简历</dt>
						<dd>
							<a href="">待处理简历</a> 
						</dd>
						<dd>
							<a href="">待定简历</a>
						</dd>
						<dd>
							<a href="">已通知面试简历</a>
						</dd>
						<dd>
							<a href="">不合适简历</a>
						</dd>
						<dd class="btm">
							<a href="">自动过滤简历</a> 
						</dd>
					</dl>
					<dl class="company_center_aside">
						<dt>我发布的职位</dt>
						<dd>
							<a href="">有效职位</a>
						</dd>
						<dd>
							<a href="">已下线职位</a>
						</dd>
					</dl>
					<slot name='slot1'></slot>
					<slot name='slot2'></slot>
    </div>
</template>

<script>
	export default{
		name:'sidebar'
	}
</script>

<style>
</style>