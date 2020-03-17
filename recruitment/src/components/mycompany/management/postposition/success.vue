<template>
	<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1>
                    <em></em>
                                           发布新职位
                </h1>
            </dt>
	        <dd> 
	            <div class="publish_tip">
                    <h2>恭喜你，职位发布成功！</h2>
                    <router-link class="greylink" to="/management/postposition">继续发布新职位</router-link><br>
                    <router-link class="greylink" to="/mycompany"> 进入我的公司主页</router-link><br>
                </div>
	        </dd>
        </dl>
    </div>
</template>

<script>
	export default{
		name:"postpositionsuccess"
	}
</script>

<style>
</style>