<template>
	<div>
		<div id="body">
			<headert :navlist="2" :isCompany="true"></headert>
			<div id="container">
				
				<div class="content_mid">
		        	<dl class="c_section c_section_mid" style="width: 680px;height: 457px;">
		        		<dt>
		                    <h2><em></em>关于我们</h2>
		                </dt>
		                <dd class="aboutus" style="width:680px;height: 457px;"> 
		                	<img alt="创业团队" src="../../../build/logo.png" style="margin-top:-30px: ;" width="186" height="186" />
		                	<div style="width: 424px;height: 185px">
		                		<span>我们是专注所有职业机会的招聘网站，以众多优质互联网资源为依托，发布圈内招聘信息，为求职者提供人性化、个性化、专业化的信息服务，以让优质人才和优秀企业及时相遇为己任。</span>
								<span>我们是一个热爱互联网的年轻团队，我们用责任来做这件事情，致力于打造最专业的互联网招聘平台。</span>
		                	</div>
		                	<ul class="reset contact_box">
			                	<li style="width: 197px;height: 102px;" class="cli1">
			                			<p>商务合作：</p>
										邮箱：<a href="javascript:void(0)">11111111@qq.com</a>
		
										地址：广东省广州市
			                		</li>
			                	<li style="width: 173px;height: 102px;" class="cli2">
		                			增值服务：<br />
									邮箱：<a href="javascript:void(0)">1111111@qq.com</a><br />
		                		</li>
		                		<li style="width: 239px;height: 102px;" class="cli3">
		                			客服邮箱：<a href="javascript:void(0)">11111111111@qq.com</a><br />
									电话：11111110000(9:30-21:00)<br />
									<!--<span>
										<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NjM3OV8xNDUzODBfODAwMDU2Mzc5Xw"></script>
									</span>-->
		                		</li>
		                	</ul>
		                </dd>
		            </dl>
       			</div>
       			<div class="clear"></div>
       			<!--<totop></totop>-->
			</div>
		</div>
		<footert></footert>
	</div>
</template>

<script>
	import headert from '../header/header'
	import footert from '../footer/footer'
	export default{
		name:"about",
		components:{
			headert,
			footert ,
		},
	}
</script>

<style>
</style>