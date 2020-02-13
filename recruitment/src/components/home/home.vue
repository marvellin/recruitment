<template>
	<div>
	<div id="body">
		<!--<div id="header">
			<div class="wrapper">
				<router-link to="/home" class="logo">
					<img src="../../../build/logo.png" width="229" height="60" alt="全国招聘第一站"/>
				</router-link>
				<ul class="reset" id="navheader">
					<li class="current">
						<router-link to="/home">首页</router-link>
					</li>
					<li>
						<router-link to="/mycompany">公司</router-link>
					</li>
					<li>
						<router-link to="/forumHome" target="_blank">论坛</router-link>
					</li>
					<li>
						<router-link to="/myresume">我的简历</router-link>
					</li>
					<li>
						<router-link to="/postHome">发布职位</router-link>
					</li>
				</ul>
				<ul class="loginTop">
					<li>
						<router-link to="/login">登陆</router-link>
					</li>
					<li>|</li>
					<li>
						<router-link to='/register'>注册</router-link>
					</li>
				</ul>
			</div>
		</div>-->
		<headert :navlist='0' :isCompany='true'></headert>
		<div id="container">
			<div id="sidebar"><!--finish-->
				<!--<div class="mainNavs">
					<div class="menu_box" @mouseover="mouseOn()" @mouseout="mouseOut()">
						<div class="menu_main">
							<h2>技术<span></span></h2>
							<div>
							<router-link to="">Java</router-link>
							<router-link to="">PHP</router-link>
							<router-link to="">C</router-link>
							<router-link to="">C++</router-link>
							<router-link to="">Android</router-link>
							<router-link to="">IOS</router-link>
							<router-link to="">前段开发</router-link>
							<router-link to="">测试</router-link>
							<router-link to="">技术经理</router-link>
							<router-link to="">项目经理</router-link>
							<router-link to="">架构师</router-link>
							</div>
						</div>
						<div class="menu_sub" v-show="box1">
							<div>
							<dl class="reset">
								<dt>
									<router-link to="">后端开发</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">Java</router-link>
									<router-link to="" class="curr">C++</router-link>
									<router-link to="" class="curr">PHP</router-link>
									<router-link to="" class="curr">数据挖掘</router-link>
									<router-link to="" class="curr">C</router-link>
									<router-link to="" class="curr">C#</router-link>
									<router-link to="" class="curr">.NET</router-link>
									<router-link to="" class="curr">Hadoop</router-link>
									<router-link to="" class="curr">Python</router-link>
									<router-link to="" class="curr">Delphi</router-link>
									<router-link to="" class="curr">VB</router-link>
									<router-link to="" class="curr">Perl</router-link>
									<router-link to="" class="curr">Ruby</router-link>
									<router-link to="" class="curr">Node.js</router-link>
								</dd>
							</dl>
							</div>
							<dl class="reset">
								<dt>
									<router-link to="">移动开发</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">HTML5</router-link>
									<router-link to="" class="curr">Android</router-link>
									<router-link to="" class="curr">IOS</router-link>
									<router-link to="" class="curr">WP</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="" class="curr">前段开发</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">web前段</router-link>
									<router-link to="" class="curr">Flash</router-link>
									<router-link to="" class="curr">html5</router-link>
									<router-link to="" class="curr">JavaScript</router-link>
									<router-link to="" class="curr">U3D</router-link>
									<router-link to="" class="curr">COCOS2D-X</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="" class="curr">测试</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">测试工程师</router-link>
									<router-link to="" class="curr">自动化测试</router-link>
									<router-link to="" class="curr">功能测试</router-link>
									<router-link to="" class="curr" >性能测试</router-link>
									<router-link to="" class="curr">测试开发</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">运维</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">运维工程师</router-link>
									<router-link to="" class="curr">运维开发工程师</router-link>
									<router-link to="" class="curr">网络工程师</router-link>
									<router-link to="" class="curr">系统工程师</router-link>
									<router-link to="" class="curr">IT支持</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">DBA</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">MySQL</router-link>
									<router-link to="" class="curr">SQLServer</router-link>
									<router-link to="" class="curr">Oracle</router-link>
									<router-link to="" class="curr">DB2</router-link>
									<router-link to="" class="curr">Mongo</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">项目管理</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">项目经理</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">高端职位</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">技术经理</router-link>
									<router-link to="" class="curr">技术总监</router-link>
									<router-link to="" class="curr">测试经理</router-link>
									<router-link to="" class="curr">架构师</router-link>
									<router-link to="" class="curr">CTO</router-link>
									<router-link to="" class="curr">运维总监</router-link>
								</dd>
							</dl>
						</div>
					</div>
					<div class="menu_box">
						<div class="menu_main">
							<h2>产品<span></span></h2>
							<router-link to="">产品经理</router-link>
							<router-link to="">产品助理</router-link>
							<router-link to="">无线产品经理</router-link>
							<router-link to="">游戏策划</router-link>
						</div>
						<div class="menu_sub dn">
							<dl class="reset">
								<dt>
									<router-link to="">产品经理</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">产品经理</router-link>
									<router-link to="" class="curr">网页产品经理</router-link>
									<router-link to="" class="curr">移动产品经理</router-link>
									<router-link to="" class="curr">产品助理</router-link>
									<router-link to="" class="curr">数据产品经理</router-link>
									<router-link to="" class="curr">电商产品经理</router-link>
									<router-link to="" class="curr">游戏策划</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">产品设计师</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">网页产品设计师</router-link>
									<router-link to="" class="curr">无线产品设计师</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">高端职位</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">产品部经理</router-link>
									<router-link to="" class="curr">产品经理</router-link>
								</dd>
							</dl>
						</div>
					</div>
					<div class="menu_box">
						<div class="menu_main">
							<h2>设计<span></span></h2>
							<router-link to="">UI</router-link>
							<router-link to="">UE</router-link>
							<router-link to="">设计师</router-link>
							<router-link to="">交互设计</router-link>
							<router-link to="">数据分析</router-link>
						</div>
						<div class="menu_sub dn">
							<dl class="reset">
								<dt>
									<router-link to="">视觉设计</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">视觉设计师</router-link>
									<router-link to="" class="curr">网页设计师</router-link>
									<router-link to="" class="curr">Flash设计师</router-link>
									<router-link to="" class="curr">APP设计师</router-link>
									<router-link to="" class="curr">UI设计师</router-link>
									<router-link to="" class="curr">平面设计师</router-link>
									<router-link to="" class="curr">美术设计师</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">交互设计</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">交互设计师</router-link>
									<router-link to="" class="curr">无线交互设计师</router-link>
									<router-link to="" class="curr">网页交互设计师</router-link>
									<router-link to="" class="curr">硬件交互设计师</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">用户研究</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">数据分析师</router-link>
									<router-link to="" class="curr">用户研究员</router-link>
									<router-link to="" class="curr">游戏数值策划</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">高端职位</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">设计经理/主管</router-link>
									<router-link to="" class="curr">设计总监</router-link>
									<router-link to="" class="curr">视觉设计经理/主管</router-link>
									<router-link to="" class="curr">交互设计总监</router-link>
									<router-link to="" class="curr">用户研究总监</router-link>
								</dd>
							</dl>
						</div>
					</div>
					<div class="menu_box">
						<div class="menu_main">
							<h2>运营<span></span></h2>
							<router-link to="">运营</router-link>
							<router-link to="">游戏运营</router-link>
							<router-link to="">编辑</router-link>
						</div>
						<div class="menu_sub dn">
							<dl class="reset">
								<dt>
									<router-link to="">运营</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">用户运营</router-link>
									<router-link to="" class="curr">产品运营</router-link>
									<router-link to="" class="curr">数据运营</router-link>
									<router-link to="" class="curr">内容运营</router-link>
									<router-link to="" class="curr">活动运营</router-link>
									<router-link to="" class="curr">商家运营</router-link>
									<router-link to="" class="curr">游戏运营</router-link>
									<router-link to="" class="curr">网络推广</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">客服</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">售前咨询</router-link>
									<router-link to="" class="curr">售后服务</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">编辑</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">审稿</router-link>
									<router-link to="" class="curr">内容编辑</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">高端职位</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">主编</router-link>
									<router-link to="" class="curr">COO</router-link>
									<router-link to="" class="curr">运营总监</router-link>
								</dd>
							</dl>
						</div>
					</div>
					<div class="menu_box">
						<div class="menu_main">
							<h2>市场与销售<span></span></h2>
							<router-link to="">市场推广</router-link>
							<router-link to="">市场策划</router-link>
							<router-link to="">活动策划</router-link>
							<router-link to="">BD</router-link>
							<router-link to="">销售经理</router-link>
						</div>
						<div class="menu_sub dn">
							<dl class="reset">
								<dt>
									<router-link to="">市场</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">市场营销</router-link>
									<router-link to="" class="curr">市场推广</router-link>
									<router-link to="" class="curr">市场策划</router-link>
									<router-link to="" class="curr">市场顾问</router-link>
									<router-link to="" class="curr">SEO</router-link>
									<router-link to="" class="curr">SEM</router-link>
									<router-link to="" class="curr">商务渠道</router-link>
									<router-link to="" class="curr">商业数据分析</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">公关</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">媒介经理</router-link>
									<router-link to="" class="curr">广告协调</router-link>
									<router-link to="" class="curr">品牌公关</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">销售</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">销售专员</router-link>
									<router-link to="" class="curr">销售经理</router-link>
									<router-link to="" class="curr">客户代表</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">高端职位</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">市场总监</router-link>
									<router-link to="" class="curr">销售总监</router-link>
									<router-link to="" class="curr">商务总监</router-link>
								</dd>
							</dl>
						</div>
					</div>
					<div class="menu_box">
						<div class="menu_main">
							<h2>职能<span></span></h2>
							<router-link to="">HR</router-link>
							<router-link to="">行政</router-link>
							<router-link to="">会计</router-link>
							<router-link to="">出纳</router-link>
						</div>
						<div class="menu_sub dn">
							<dl class="reset">
								<dt>
									<router-link to="">人力资源</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">招聘</router-link>
									<router-link to="" class="curr">HRBP</router-link>
									<router-link to="" class="curr">人事/HR</router-link>
									<router-link to="" class="curr">培训经理</router-link>
									<router-link to="" class="curr">绩效考核经理</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">行政</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">助理</router-link>
									<router-link to="" class="curr">前台</router-link>
									<router-link to="" class="curr">法务</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">财务</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">会计</router-link>
									<router-link to="" class="curr">出纳</router-link>
									<router-link to="" class="curr">财务管理</router-link>
								</dd>
							</dl>
							<dl class="reset">
								<dt>
									<router-link to="">高端职位</router-link>
								</dt>
								<dd>
									<router-link to="" class="curr">行政总监/经理</router-link>
									<router-link to="" class="curr">财务总监/经理</router-link>
									<router-link to="" class="curr">CFO</router-link>
								</dd>
							</dl>
						</div>
					</div>
				</div>--><!--end of mainNavs-->
				<mainNavs></mainNavs>
				<router-link class="subscribe" to="/subscribe" target="_blank">订阅职位</router-link>
			</div><!--end of sidebar-->
			<div class="content">
				<!--<div id="search_box">
					<form id="searchForm" name="searchForm">
						<ul id="searchType">
							<li data-searchtype="1" class="type_selected">职位</li>
							<li data-searchtype="4">公司</li>
						</ul>
						<div class="searchtype_arrow"></div>
						<input type="text" id="search_input" name="kd" tabindex="1" value="" placeholder="请输入职位名称，如：产品经理"/>
						<input type="hidden" name="spc" id="spcInput" value=""/>
						<input type="hidden" name="pl" id="plInput" value=""/>
						<input type="hidden" name="gj" id="gjInput" value=""/>
						<input type="hidden" name="xl" id="xlInput" value=""/>
						<input type="hidden" name="yx" id="yxInput" value=""/>
						<input type="hidden" name="gx" id="gxInput" value=""/>
						<input type="hidden" name="st" id="stInput" value=""/>
						<input type="hidden" name="labelWords" id="labelWords" value=""/>
						<input type="hidden" name="lc" id="lc" value=""/>
						<input type="hidden" name="workAddress" id="workAddress" value=""/>
						<input type="hidden" name="city" id="cityInput" value=""/>
						<input type="submit" id="search_button" value="搜索"/>
					</form>                             
				</div>-->
				<searchbox></searchbox>
				<!--<style>
					.ui-autocomplete{
						width: 488px;
						background: #fafafa !important;
						position: relative;
						z-index: 10;
						border: 2px solid #91cebe;
					}
					.ui-autocomplete-category{
						font-size: 16px;
						color: #999;
						width: 50px;
						position: absolute;
						z-index: 11;
						right: 0px;
						text-align: center;
						border-top: 1px dashed #e5e5e5;
						padding: 5px 0;
					}
					.ui-menu-item{
						*width: 439px;
						vertical-align: middle;
						position: relative;
						margin: 0px;
						margin-right: 50px !important;
						background: #fff;
						border-right: 1px dashed #ededed;
					}
					.ui-menu-item a{
						display: block;
						overflow: hidden;
					}
				</style>-->
				<dl class="hotSearch">
					<dt>热门搜索：</dt>
					<dd>
						<router-link to="">Java</router-link>
					</dd>
					<dd>
						<router-link to="">PHP</router-link>
					</dd>
					<dd>
						<router-link to="">Android</router-link>
					</dd>
					<dd>
						<router-link to="">IOS</router-link>
					</dd>
					<dd>
						<router-link to="">前端</router-link>
					</dd>
					<dd>
						<router-link to="">产品经理</router-link>
					</dd>
					<dd>
						<router-link to="">UI</router-link>
					</dd>
					<dd>
						<router-link to="">运营</router-link>
					</dd>
					<dd>
						<router-link to="">BD</router-link>
					</dd>
					<dd>
						<router-link to="">实习</router-link>
					</dd>	
				</dl>
				<!--<div id="home_banner">
					<ul class="banner_bg">
						<li class="banner_bg_1 current">
							<router-link to="" targrt="_blank"></router-link>
							<img src="../../../static/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg" alt="好买基金——来了就给100万" width="612" height="160" />
						</li>
						<li class="banner_bg_2">
							<router-link to="" targrt="_blank"></router-link>
							<img src="../../../static/images/c9d8a0756d1442caa328adcf28a38857.jpg" alt="世界杯放假看球，老板我也要！" width="612" height="160" />
						</li>
						<li class="banner_bg_3">
							<router-link to="" targrt="_blank"></router-link>
							<img src="../../../static/images/d03110162390422bb97cebc7fd2ab586.jpg" alt="出北京记——第一站厦门" width="612" height="160" />
						</li>
					</ul>
					<div class="banner_control">
						<em></em>
						<ul class="thumbs">
							<li class="thumbs_1 current"><i></i><img src="../../../static/images/4469b1b83b1f46c7adec255c4b1e4802.jpg" width="110" height="42" /></li>
							<li class="thumbs_2"><i></i><img src="../../../static/images/381b343557774270a508206b3a725f39.jpg" width="110" height="42" /></li>
							<li class="thumbs_3"><i></i><img src="../../../static/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="110" height="42" /></li>
						</ul>
					</div>
				</div>--><!--main_banner-->
				<homebanner></homebanner>
				<!--<ul id="da-thumbs" class="da-thumbs">
					<li>
						<router-link to="" target="_blank">
							<img src="../../../static/images/a254b11ecead45bda166afa8aaa9c8bc.jpg" alt="联想" width="113" height="113" />
							<div class="hot_info">
								<h2 title="联想">联想</h2>
								<em></em>
								<p title="世界因联想更美好">
									世界因联想更美好
								</p>
							</div>
						</router-link>
					</li>
					<li>
						<router-link to="" target="_blank">
							<img src="../../../static/images/c75654bc2ab141df8218983cfe5c89f9.jpg" alt="淘米" width="113" height="113" />
							<div class="hot_info">
								<h2 title="淘米">淘米</h2>
								<em></em>
								<p title="将心诸如 追随极致">
									将心诸如 追随极致
								</p>
							</div>
						</router-link>
					</li>
					<li>
						<router-link to="" target="_blank">
							<img src="../../../static/images/2bba2b71d0b0443eaea1774f7ee17c9f.png" alt="优酷土豆" width="113" height="113" />
							<div class="hot_info">
								<h2 title="优酷土豆">优酷土豆</h2>
								<em></em>
								<p title="专注于视频领域，是中国网络视频行业领军企业">
									专注于视频领域，是中国网络视频行业领军企业
								</p>
							</div>
						</router-link>
					</li>
					<li>
						<router-link to="" target="_blank">
							<img src="../../../static/images/f4822a445a8b495ebad81fcfad3e40e2.jpg" alt="思特沃克" width="113" height="113" />
							<div class="hot_info">
								<h2 title="思特沃克">思特沃克</h2>
								<em></em>
								<p title="一家全球信息技术服务公司">
									一家全球信息技术服务公司
								</p>
							</div>
						</router-link>
					</li>
					<li>
						<router-link to="" target="_blank">
							<img src="../../../static/images/5caf8f9631114bf990f87bb11360653e.png" alt="奇猫" width="113" height="113" />
							<div class="hot_info">
								<h2 title="奇猫">奇猫</h2>
								<em></em>
								<p title="专注于移动互联网、互联网产品研发">
									专注于移动互联网、互联网产品研发
								</p>
							</div>
						</router-link>
					</li>
					<li class="last">
						<router-link to="" target="_blank">
							<img src="../../../static/images/c0052c69ef4546c3b7d08366d0744974.jpg" alt="堆糖网" width="113" height="113" />
							<div class="hot_info">
								<h2 title="堆糖网">堆糖网</h2>
								<em></em>
								<p title="分享收集生活中的美好，遇见世界上的另外一个你">
									分享收集生活中的美好，遇见世界上的另外一个你
								</p>
							</div>
						</router-link>
					</li>
				</ul>-->
				<thumbs></thumbs>
				
				<ul class="reset hotabbing">
					<li :class="[hottabbingShow?'current':'']" @click="hotabbingClick1">热门职位</li>
					<li :class="[hottabbingShow?'':'current']" @click="hotabbingClick2">最新职位</li>
				</ul>
				
				<!--<div id="hotList">
					<ul class="hot_pos reset">
						<li class="clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank">运营总监</router-link>
									&nbsp;
									<span class="c9">北京</span>
								</div>
								<span><em class="c7">月薪：</em>"15k-20k"</span>
								<span><em class="c7">经验：</em>"3-5年"</span>
								<span><em class="c7">学历：</em>"本科"</span>
								<br />
								<span><em class="c7">职位诱惑：</em>"发展前景"</span>
								<br />
								<span>1天前发布</span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="odd clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="odd clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="odd clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="odd clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="odd clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="odd clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="odd clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="clearfix">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<router-link to="">查看更多</router-link>
					</ul>
					<ul class="hot_pos hot_posHotPosition reset" style="display: none;">
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<li class="">
							<div class="hot_pos_l">
								<div class="mb10">
									<router-link to="" target="_blank"></router-link>
									&nbsp;
									<span class="c9"></span>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<br />
								<span></span>
							</div>
							<div class="hot_pos_r">
								<div class="mb10 recompany">
									<router-link to=""></router-link>
								</div>
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<br />
								<span><em class="c7"></em></span>
								<span><em class="c7"></em></span>
								<ul class="compantYags reset">
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</li>
						<router-link to="">查看更多</router-link>
					</ul>
				</div>-->
				<hotlist :hottabbingShow='hottabbingShow'></hotlist>
				
				<div class="clear"></div>
				<div id="linkbox">
					<dl>
						<dt>友情链接</dt>
						<dd>
							<a href="http://www.zhuqu.com/" target="_blank">住趣家居网</a><span>|</span>
			        		<a href="http://www.woshipm.com/" target="_blank">人人都是产品经理</a> <span>|</span>
			        		<a href="http://zaodula.com/" target="_blank">互联网er的早读课</a><span>|</span>
			                <a href="http://lieyunwang.com/" target="_blank">猎云网</a><span>|</span>
			        		<a href="http://www.ucloud.cn/" target="_blank">UCloud</a><span>|</span>
			          		<a href="http://www.iconfans.com/" target="_blank">iconfans</a><span>|</span>
			          		<a href="http://www.html5dw.com/" target="_blank">html5梦工厂</a><span>|</span>
			          		<a href="http://www.sykong.com/" target="_blank">手游那点事</a> <span>|</span>
			          		<a href="http://www.php100.com/" target="_blank">php100</a> <span>|</span>
			          		<a href="http://www.uehtml.com/" target="_blank">uehtml</a> <span>|</span>
			          		<a href="http://www.w3cplus.com/" target="_blank">W3CPlus</a> <span>|</span>
			          		<a href="http://www.boxui.com/" target="_blank">盒子UI</a> <span>|</span>
			          		<a href="http://www.uimaker.com/" target="_blank">uimaker</a> <span>|</span>
			          		<a href="http://www.yixieshi.com/" target="_blank">互联网的一些事</a> <span>|</span>
			          		<a href="http://www.chuanke.com/" target="_blank">传课网</a> <span>|</span>
			          		<a href="http://www.eoe.cn/" target="_blank">安卓开发</a> <span>|</span>
			          		<a href="http://www.eoeandroid.com/" target="_blank">安卓开发论坛</a> <span>|</span>
			          		<a href="http://hao.360.cn/" target="_blank" >360安全网址导航</a> <span>|</span>
			          		<a href="http://se.360.cn/" target="_blank" >360安全浏览器</a> <span>|</span>
			          		<a href="http://www.hao123.com/" target="_blank" >hao123上网导航</a> <span>|</span>
			          		<a href="http://www.ycpai.com" target="_blank" >互联网创业</a><span>|</span>
			          		<a href="http://www.zhongchou.cn" target="_blank" >众筹网</a><span>|</span>
			          		<a href="http://www.marklol.com/" target="_blank" >马克互联网</a><span>|</span>
			          		<a href="http://www.chaohuhr.com/" target="_blank" >巢湖英才网</a><span>|</span>
			          		
			          		<a href="http://www.zhubajie.com/" target="_blank" >创意服务外包</a><span>|</span>
			          		<a href="http://www.thinkphp.cn/" target="_blank" >thinkphp</a><span>|</span>
			          		<a href="http://www.chuangxinpai.com/" target="_blank" >创新派</a><span>|</span>

			          		<a href="http://w3cshare.com/" target="_blank" >W3Cshare</a><span>|</span>
			          		<a href="http://www.518lunwen.cn/" target="_blank" >论文发表网</a><span>|</span>
			          		<a href="http://www.199it.com" target="_blank" >199it</a><span>|</span>

			          		<a href="http://www.shichangbu.com" target="_blank" >市场部网</a><span>|</span>
			          		<a href="http://www.meitu.com/" target="_blank" >美图公司</a><span>|</span>
			          		<a href="https://www.teambition.com/" target="_blank" >Teambition</a><span>|</span>
			          		<a href="http://oupeng.com/" target="_blank" >欧朋浏览器</a><span>|</span>
			          		<a href="http://iwebad.com/" target="_blank">网络广告人社区</a><span>|</span>
			          		<a href="h/af/flink.html" target="_blank" class="more">更多</a><span>|</span>
						</dd>
					</dl>
				</div>
			</div><!--end of content-->
			<input type="hidden" value="" name="userid" id="userid"/>
			<!--弹窗lightbox-->
			<!--<div style="display: none;"></div>-->
			<!--<lightbox></lightbox>-->
			<!--弹窗end-->
			<div class="clear"></div>
			<input type="hidden" id="resumbmitToken" value=""/>
			<a id="backtop" title="回到顶部" style="display: inline;" rel="nofollow" @click="toTop"></a>
		</div><!--end of container-->
	</div><!--end of body-->
	<div id="footer">
		<div class="wrapper">
			<!--<router-link to=""></router-link>-->
		</div>
	</div>
	</div>
</template>

<script>
//	import lightbox from './lightbox/lightbox.vue'
	import hotlist from './hotlist/hotlist.vue'
	import mainNavs from './mainNavs/mainNavs.vue'
	import searchbox from './searchbox/searchbox.vue'
	import homebanner from './homebanner/homebanner.vue'
	import thumbs from './thumbs/thumbs.vue'
	import headert from '../header/header'
	
	export default{
		name:'home',
		created(){
			/*this.$axios.get('/static/data/companylist.json').then((res) => {
				this.companylist = res.data.companylist
				console.log(this.companylist[0].name)
			})*/
		},
		components:{
			hotlist,
			mainNavs,
			searchbox,
			homebanner,
			thumbs,
			headert
		},
		data(){
			return{
				hottabbingShow:true,
				navlist:[
					{
						name:'公司',
						path:'/mycompany'
					},
					{
						name:'论坛',
						path:''
					},
					{
						name:'我的简历',
						path:'/myresume'
					},
					{
						name:'发布职位',
						path:''
					},
				],
			}
		},
		methods:{
			hotabbingClick1(){
				this.hottabbingShow = true
//				console.log(this.hottabbingShow)
			},
			hotabbingClick2(){
				this.hottabbingShow = false
//				console.log(this.hottabbingShow)
			},
			toTop(){
				body.scrollIntoView({behavior:'smooth'})
			}
		}
	}
</script>

<style>
	/*@import url("../../../static/css/colorbox.min.css");
	@import url("../../../static/css/external.min.css");
	@import url("../../../static/css/jiathis_share.css");
	@import url("../../../static/css/popup.css");
	@import url("../../../static/css/style.css");
	@import url("../../../static/css/ui.css");
	@import url("../../../static/css/window.css");*/
	
	/*.ui-autocomplete{
		width: 488px;
		background: #fafafa !important;
		position: relative;
		z-index: 10;
		border: 2px solid #91cebe;
	}
	.ui-autocomplete-category{
		font-size: 16px;
		color: #999;
		width: 50px;
		position: absolute;
		z-index: 11;
		right: 0px;
		text-align: center;
		border-top: 1px dashed #e5e5e5;
		padding: 5px 0;
	}
	.ui-menu-item{
		*width: 439px;
		vertical-align: middle;
		position: relative;
		margin: 0px;
		margin-right: 50px !important;
		background: #fff;
		border-right: 1px dashed #ededed;
	}
	.ui-menu-item a{
		display: block;
		overflow: hidden;
	}*/
</style>