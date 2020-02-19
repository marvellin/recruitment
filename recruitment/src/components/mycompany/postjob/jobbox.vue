<template>
	<div :style="{'display':jobboxshow?'block':'none'}" id="box_job" v-if="postlist">
		<dl v-for="(item1,index1) in postlist" :key='index1'>
			<dt>{{item1.main.type}}</dt>
			<dd>
				<ul class="reset job_main">
					<li @mouseleave="postnameboxshow=false" @mouseover="pickcurrentbox(index1,index2)" @click="pickposttype(item2.type)" v-for="(item2,index2) in item1.sub" :key='index2' style="width: 140px;height: 32px;">
						<span>{{item2.type}}</span>
						<ul class="reset job_sub" style="list-style: none;width: 426px;" id="postnamebox" @mouseleave="postnameboxshow=false" :style="{'display':postnameboxshow&&currentpostbox==index1&&currentpostnamebox==index2?'block':'none','margin-left':index2%3==1?'-152px':index2%3==2?'-296px':''}">
							<li style="width: 193px;" @click="pickpost(item2.type,item3.name)" v-for="(item3,index3) in item2.joblist" :key='index3'>
								{{item3.name}}
							</li>
						</ul>
					</li>
				</ul>
			</dd>
		</dl>
		<!--
				                                        <dl>
			                                                <dt>技术</dt>
			                                                <dd>
			                                                    <ul class="reset job_main">
			                                                        <li>
			                                                            <span>后端开发</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>Java</li>
			                                                                                                                                                    <li>C++</li>
			                                                                                                                                                    <li>PHP</li>
			                                                                                                                                                    <li>数据挖掘</li>
			                                                                                                                                                    <li>C</li>
			                                                                                                                                                    <li>C#</li>
			                                                                                                                                                    <li>.NET</li>
			                                                                                                                                                    <li>Hadoop</li>
			                                                                                                                                                    <li>Python</li>
			                                                                                                                                                    <li>Delphi</li>
			                                                                                                                                                    <li>VB</li>
			                                                                                                                                                    <li>Perl</li>
			                                                                                                                                                    <li>Ruby</li>
			                                                                                                                                                    <li>Node.js</li>
			                                                            </ul>
			                                                        </li>
			                                                    	<li>
			                                                            <span>移动开发</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -160px;">
			                                                                                                                                                    <li>HTML5</li>
			                                                                                                                                                    <li>Android</li>
			                                                                                                                                                    <li>iOS</li>
			                                                                                                                                                    <li>WP</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>前端开发</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -310px;">
			                                                                                                                                                    <li>web前端</li>
			                                                                                                                                                    <li>Flash</li>
			                                                                                                                                                    <li>html5</li>
			                                                                                                                                                    <li>JavaScript</li>
			                                                                                                                                                    <li>U3D</li>
			                                                                                                                                                    <li>COCOS2D-X</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>测试</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>测试工程师</li>
			                                                                                                                                                    <li>自动化测试</li>
			                                                                                                                                                    <li>功能测试</li>
			                                                                                                                                                    <li>性能测试</li>
			                                                                                                                                                    <li>测试开发</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>运维</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -160px;">
			                                                                                                                                                    <li>运维工程师</li>
			                                                                                                                                                    <li>运维开发工程师</li>
			                                                                                                                                                    <li>网络工程师</li>
			                                                                                                                                                    <li>系统工程师</li>
			                                                                                                                                                    <li>IT支持</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>DBA</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -310px;">
			                                                                                                                                                    <li>MySQL</li>
			                                                                                                                                                    <li>SQLServer</li>
			                                                                                                                                                    <li>Oracle</li>
			                                                                                                                                                    <li>DB2</li>
			                                                                                                                                                    <li>MongoDB</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>项目管理</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>项目经理</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>高端技术职位</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -160px;">
			                                                                                                                                                    <li>技术经理</li>
			                                                                                                                                                    <li>技术总监</li>
			                                                                                                                                                    <li>测试经理</li>
			                                                                                                                                                    <li>架构师</li>
			                                                                                                                                                    <li>CTO</li>
			                                                                                                                                                    <li>运维总监</li>
			                                                            </ul>
			                                                        </li>
			                                                    </ul>
			                                                </dd>
			                                            </dl>
			                                            <dl>
			                                                <dt>产品</dt>
			                                                <dd>
			                                                    <ul class="reset job_main">
			                                                        <li>
			                                                            <span>产品经理</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>产品经理</li>
			                                                                                                                                                    <li>网页产品经理</li>
			                                                                                                                                                    <li>移动产品经理</li>
			                                                                                                                                                    <li>产品助理</li>
			                                                                                                                                                    <li>数据产品经理</li>
			                                                                                                                                                    <li>电商产品经理</li>
			                                                                                                                                                    <li>游戏策划</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>产品设计师</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -160px;">
			                                                                                                                                                    <li>网页产品设计师</li>
			                                                                                                                                                    <li>无线产品设计师</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>高端产品职位</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -310px;">
			                                                                                                                                                    <li>产品部经理</li>
			                                                                                                                                                    <li>产品总监</li>
			                                                            </ul>
			                                                        </li>
			                                                    </ul>
			                                                </dd>
			                                            </dl>
			                                            <dl>
			                                                <dt>设计</dt>
			                                                <dd>
			                                                    <ul class="reset job_main">
			                                                        <li>
			                                                            <span>视觉设计</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>视觉设计师</li>
			                                                                                                                                                    <li>网页设计师</li>
			                                                                                                                                                    <li>Flash设计师</li>
			                                                                                                                                                    <li>APP设计师</li>
			                                                                                                                                                    <li>UI设计师</li>
			                                                                                                                                                    <li>平面设计师</li>
			                                                                                                                                                    <li>美术设计师（2D/3D）</li>
			                                                                                                                                                    <li>广告设计师</li>
			                                                                                                                                                    <li>多媒体设计师</li>
			                                                                                                                                                    <li>原画师</li>
			                                                                                                                                                    <li>游戏特效</li>
			                                                                                                                                                    <li>游戏界面设计师</li>
			                                                                                                                                                    <li>游戏场景</li>
			                                                                                                                                                    <li>游戏角色</li>
			                                                                                                                                                    <li>游戏动作</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>交互设计</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -160px;">
			                                                                                                                                                    <li>交互设计师</li>
			                                                                                                                                                    <li>无线交互设计师</li>
			                                                                                                                                                    <li>网页交互设计师</li>
			                                                                                                                                                    <li>硬件交互设计师</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>用户研究</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -310px;">
			                                                                                                                                                    <li>数据分析师</li>
			                                                                                                                                                    <li>用户研究员</li>
			                                                                                                                                                    <li>游戏数值策划</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>高端设计职位</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>设计经理/主管</li>
			                                                                                                                                                    <li>设计总监</li>
			                                                                                                                                                    <li>视觉设计经理/主管</li>
			                                                                                                                                                    <li>视觉设计总监</li>
			                                                                                                                                                    <li>交互设计经理/主管</li>
			                                                                                                                                                    <li>交互设计总监</li>
			                                                                                                                                                    <li>用户研究经理/主管</li>
			                                                                                                                                                    <li>用户研究总监</li>
			                                                            </ul>
			                                                        </li>
			                                                    </ul>
			                                                </dd>
			                                            </dl>
			                                            <dl>
			                                                <dt>运营</dt>
			                                                <dd>
			                                                    <ul class="reset job_main">
			                                                    	<li>
			                                                            <span>运营</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>用户运营</li>
			                                                                                                                                                    <li>产品运营</li>
			                                                                                                                                                    <li>数据运营</li>
			                                                                                                                                                    <li>内容运营</li>
			                                                                                                                                                    <li>活动运营</li>
			                                                                                                                                                    <li>商家运营</li>
			                                                                                                                                                    <li>品类运营</li>
			                                                                                                                                                    <li>游戏运营</li>
			                                                                                                                                                    <li>网络推广</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>编辑</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -160px;">
			                                                                                                                                                    <li>副主编</li>
			                                                                                                                                                    <li>内容编辑</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>客服</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -310px;">
			                                                                                                                                                    <li>售前咨询</li>
			                                                                                                                                                    <li>售后客服</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>高端运营职位</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>主编</li>
			                                                                                                                                                    <li>运营总监</li>
			                                                                                                                                                    <li>COO</li>
			                                                            </ul>
			                                                        </li>
			                                                    </ul>
			                                                </dd>
			                                            </dl>
			                                            <dl>
			                                                <dt>市场与销售</dt>
			                                                <dd>
			                                                    <ul class="reset job_main">
			                                                        <li>
			                                                            <span>市场/营销</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>市场营销</li>
			                                                                                                                                                    <li>市场策划</li>
			                                                                                                                                                    <li>市场顾问</li>
			                                                                                                                                                    <li>市场推广</li>
			                                                                                                                                                    <li>SEO</li>
			                                                                                                                                                    <li>SEM</li>
			                                                                                                                                                    <li>商务渠道</li>
			                                                                                                                                                    <li>商业数据分析</li>
			                                                                                                                                                    <li>活动策划</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>公关</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -160px;">
			                                                                                                                                                    <li>媒介经理</li>
			                                                                                                                                                    <li>广告协调</li>
			                                                                                                                                                    <li>品牌公关</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>销售</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -310px;">
			                                                                                                                                                    <li>销售专员</li>
			                                                                                                                                                    <li>销售经理</li>
			                                                                                                                                                    <li>客户代表</li>
			                                                                                                                                                    <li>大客户代表</li>
			                                                                                                                                                    <li>BD经理</li>
			                                                                                                                                                    <li>商务渠道</li>
			                                                                                                                                                    <li>渠道销售</li>
			                                                                                                                                                    <li>代理商销售</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>高端市场职位</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>市场总监</li>
			                                                                                                                                                    <li>销售总监</li>
			                                                                                                                                                    <li>商务总监</li>
			                                                                                                                                                    <li>CMO</li>
			                                                                                                                                                    <li>公关总监</li>
			                                                            </ul>
			                                                        </li>
			                                                    </ul>
			                                                </dd>
			                                            </dl>
			                                            <dl>
			                                                <dt>职能</dt>
			                                                <dd>
			                                                    <ul class="reset job_main">
			                                                        <li>
			                                                            <span>人力资源</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>人力资源</li>
			                                                                                                                                                    <li>招聘</li>
			                                                                                                                                                    <li>HRBP</li>
			                                                                                                                                                    <li>人事/HR</li>
			                                                                                                                                                    <li>培训经理</li>
			                                                                                                                                                    <li>薪资福利经理</li>
			                                                                                                                                                    <li>绩效考核经理</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>行政</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -160px;">
			                                                                                                                                                    <li>助理</li>
			                                                                                                                                                    <li>前台</li>
			                                                                                                                                                    <li>法务</li>
			                                                                                                                                                    <li>行政</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>财务</span>
			                                                            <ul class="reset job_sub dn" style="margin-left: -310px;">
			                                                                                                                                                    <li>会计</li>
			                                                                                                                                                    <li>出纳</li>
			                                                                                                                                                    <li>财务</li>
			                                                            </ul>
			                                                        </li>
			                                                        <li>
			                                                            <span>高端职能职位</span>
			                                                            <ul class="reset job_sub dn">
			                                                                                                                                                    <li>行政总监/经理</li>
			                                                                                                                                                    <li>财务总监/经理</li>
			                                                                                                                                                    <li>HRD/HRM</li>
			                                                                                                                                                    <li>CFO</li>
			                                                            </ul>
			                                                        </li>
			                                                    </ul>
			                                                </dd>
			                                            </dl>
		-->
	</div>
</template>

<script>
	export default{
		name:'jobbox',
		props:['jobboxshow'],
		data(){
			return{
				postlist:null,
				postnameboxshow:false,
				currentpostnamebox:null,
				currentpostbox:null,
			}
		},
		methods:{
			pickposttype(type){
				this.$emit('getposttype',type)
				this.currentpostnamebox = false
			},
			pickpost(type,name){
				let post = {
					'type':type,
					'name':name
				}
				this.$emit('getpost',post)
				this.currentpostnamebox = false
			},
			pickcurrentbox(index1,index2){
				this.currentpostbox = index1
				this.currentpostnamebox = index2
				this.postnameboxshow = true
			}
		},
		created(){
			this.$axios.get('/static/data/postlist.json').then(res => {
				this.postlist = res.data.postlist
				console.log(this.postlist)
			}).catch(err =>{
				console.log(err)
			})
			document.addEventListener('click',e => {
				let postnamebox = document.getElementById('postnamebox')
				if(postnamebox && !postnamebox.contains(e.target)){
					this.postnameboxshow=false
				}
			})
		}
	}
</script>

<style>
</style>