<template>
	<div class="content user_modifyContent">
		<dl class="c_section">
            <dt>
            	<h2><em></em>修改密码</h2>
            </dt>
            <dd>
            	<form id="updatePswForm">
            		<table class="savePassword">
            			<tbody>
	            			<tr>
	            				<td>登录邮箱</td>
	            				<td class="c7">jason@qq.com</td>
	            			</tr>
	            			<tr>
	            				<td class="label">当前密码</td>
	            				<td>
	            					<input type="password" maxlength="16" id="oldpassword" name="oldpassword" style="background-image: url(style/images/img/0CQnd2Jos49xUAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
	            					<span id="updatePwd_beError" style="display:none;" class="error">
	            				</span></td>            				
	            			</tr>
	            			<tr>
	            				<td class="label">新密码</td>
	            				<td><input type="password" maxlength="16" id="newpassword" name="newpassword" style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;"></td>
	            			</tr>
	            			<tr>
	            				<td class="label">确认密码</td>
	            				<td><input type="password" maxlength="16" id="comfirmpassword" name="comfirmpassword" style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;"></td>
	            			</tr>
	            			<tr>
	            				<td>&nbsp;</td>
	            				<td><input type="submit" value="保 存"></td>
	            			</tr>
            			</tbody>
            		</table>
				</form>
			</dd>
        </dl>
	</div>
</template>

<script>
	export default{
		name:"pwdsetting"
	}
</script>

<style>
	.savePassword input[type="password"]{
		width: 422px;
		height: 46px;
	}
</style>