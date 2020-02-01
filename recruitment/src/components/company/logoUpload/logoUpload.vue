<template>
	<div>
		<div style="width:650px;height:470px;" class="popup" id="logoUploader">
			<button>test1</button>
			<object width="650" height="470" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID">
				<button>test2</button>
				<param value="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" name="movie">
				<param value="high" name="quality">
				<param value="opaque" name="wmode">
				<param value="111.0.0.0" name="swfversion">
						<!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
						<param value="../../Scripts/expressInstall.swf" name="expressinstall">
						<!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
						<!--[if !IE]>-->
						<object width="650" height="470" data="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" type="application/x-shockwave-flash">
							<button>test3</button>
							<!--<![endif]-->
						    <param value="high" name="quality">
						    <param value="opaque" name="wmode">
						    <param value="111.0.0.0" name="swfversion">
						    <param value="../../Scripts/expressInstall.swf" name="expressinstall">
					    	<!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
					    	<div>
					      	<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
					      	<p><a href="http://www.adobe.com/go/getflashplayer"><img width="112" height="33" src="style/images/get_flash_player.gif" alt="获取 Adobe Flash Player"></a></p>
					    	</div>
				    	<!--[if !IE]>-->
				  		</object>
			  		<!--<![endif]-->
					</object>
				</div>
	</div>
</template>

<script>
	export default{
		name:'logoUpload'
	}
</script>

<style>
</style>