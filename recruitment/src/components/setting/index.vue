<template>
	<div>
		<div id="body">
			<headert :navlist='1' :isCompany="false"></headert>
			<div id="container">
				<div class="user_bindSidebar">
    				<dl id="user_sideBarmenu" class="user_sideBarmenu">
     	       			<dt><h3 style="margin: 18px 0;">帐号设置</h3></dt>
     	       			<dd><router-link :class="[currentroutername==='infosetting'?'hover':'']" to="/setting/infosetting">个人信息</router-link></dd>
                		<dd><router-link :class="[currentroutername==='pwdsetting'?'hover':'']" to="/setting/pwdsetting">修改密码</router-link></dd>
        				<dd><router-link :class="{'hover':isresumesetting}" to="/setting/resumesetting">简历管理</router-link></dd>
            		</dl>
				</div>
				
				<router-view/>
				
				<div class="clear"></div>
				<totop></totop>
			</div>
		</div>
		<footert></footert>
	</div>
</template>

<script>
	import headert from '../header/header'
	import footert from '../footer/footer'
	import totop from '../totop/totop'
	export default{
		name:"setting",
		components:{
			headert,
			footert,
			totop,
		},
		computed:{
			currentroutername(){
				return this.$route.name
			},
			isresumesetting(){
				if(['resumesetting','online','attachment'].indexOf(this.currentroutername) > -1){
					return true
				}
				return false;
			}
		}
	}
</script>

<style>
</style>