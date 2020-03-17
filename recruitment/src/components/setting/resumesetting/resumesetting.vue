<template>
	<div class="content user_modifyContent">
		<dl class="c_section">
            <dt>
            	<h2><em></em>简历管理</h2>
            </dt>
            <dd>
            	<div class="delivery_tabs">
		            <ul class="reset">
		                <li style="width: 50%;"  :class="[currentroute === 'online'?'current':'']">
		                    <router-link to="/setting/resumesetting/online">在线简历</router-link>
		                </li>
		                <li style="width: 50%;"  :class="[currentroute === 'attachment'?'current':'']">
		                    <router-link style="border-right: none;" to="/setting/resumesetting/attachment">简历附件</router-link>
		                </li>
		            </ul>
		        </div>
		        <router-view/>
			</dd>
        </dl>
	</div>
</template>

<script>
	export default{
		name:"resumesetting",
		computed:{
			currentroute(){
				return this.$route.name
			}
		}
	}
</script>

<style>
</style>