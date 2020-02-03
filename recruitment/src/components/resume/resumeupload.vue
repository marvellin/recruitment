<template>
	<!-- 上传简历 -->
	<div class="popup" id="uploadFile">
		<table width="100%"><tbody>
			<tr>
				<td align="center">
				    <form>
				        <a class="btn_addPic" href="javascript:void(0);">
				            <span>选择上传文件</span>
				                <!--<input type="file" onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload')" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3">-->
				            <input type="file" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3"/>
				        </a>
				    </form>
				</td>
			</tr>
			<tr>
				<td align="left">支持word、pdf、ppt、txt、wps格式文件<br>文件大小需小于10M</td>
			</tr>
				<!--<tr>
				    <td align="left" style="color:#dd4a38; padding-top:10px;">注：若从其它网站下载的word简历，请将文件另存为.docx格式后上传</td>
			</tr>-->
			<tr>
				<td align="center"><img width="55" height="16" alt="loading" style="visibility: hidden;" id="loadingImg" src="style/images/loading.gif"></td>
			</tr>
		</tbody></table>
	</div><!--/#uploadFile-->
				
</template>

<script>
	export default{
		name:'resumeupload',
		mounted(){
			console.log('resumeupload mounted')
		}
	}
</script>

<style>
</style>