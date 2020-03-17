<template>
	<div class="content_mid">
		<dl class="c_section c_section_mid">
			<dt>
				<slot name='slot1'></slot>
			</dt>
			<dd class="c_notice">
				<h4>恭喜你，公司信息已填写完善，你可以发布职位啦！</h4>
                <router-link class="greylink" to="/management/postposition">发布新职位</router-link>
                <router-link class="greylink" to="/mycompany"> 进入我的公司主页</router-link>
			</dd>
		</dl>
	</div>
</template>

<script>
	export default{
		name:"companyinfofillinsuccess",
		
	}
</script>

<style>
</style>