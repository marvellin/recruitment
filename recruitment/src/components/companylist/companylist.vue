<template>
	<div>
	<div id="body">
		<headert :navlist='0'></headert>
		<div id="container">
        
	        <div class="clearfix">
	            <div class="content_l">
	            	<form id="companyListForm" name="companyListForm" method="get" action="h/c/companylist.html">
		                <dl class="hc_tag">
		                    <dt>
		                        <!--  <h2 class="fl">热门公司</h2> -->
		                        <ul class="workplace reset fr" id="workplaceSelect">
		                        	<li>
		                        		<a href="javascript:void(0)"  :class="" class="current">全国</a> |
		                        	</li>
		                        	<li v-for="(item,index) in citylist.hotcities" :key='index'>
		                        		<a href="javascript:void(0)" @click="pickcity(item)" :class="">{{item}}</a> |
		                        	</li>
		                        	
		                            <li  class="more" :class="[cityboxshow?'open':'']">
	                                	<a href="javascript:void(0)" @click.stop="cityboxshow=true">其他</a> 
	                                	<div class="triangle citymore_arrow" :class="[cityboxshow?'transform':'']"></div>
	                                </li>
		                         	<li id="box_expectCity" class="searchlist_expectCity" :style="{'display':cityboxshow?'list-item':'none'}">
							            	<span class="bot"></span>
							            	<span class="top"></span>
								    		
								    		<dl>
								    			<dt>ABCDEF</dt>
									    		<dd>
									    			<span v-for="(item,index) in citylist.list1" :key='index' @click="pickcity(item)">
									    				{{item}}
									    			</span>
									     		</dd>
									     	</dl>
									    	<dl>
									    	  	<dt>GHIJ</dt>
									    		<dd>
									    			<span v-for="(item,index) in citylist.list2" :key='index' @click="pickcity(item)">
									    				{{item}}
									    			</span>
									     		</dd>
									    	</dl>
									    	<dl>
									    			<dt>KLMN</dt>
									    			<dd>
									    				<span v-for="(item,index) in citylist.list3" :key='index' @click="pickcity(item)">
									    					{{item}}
									    				</span>
									     			</dd>
									    	</dl>
									    	<dl>
									    			<dt>OPQR</dt>
									    			<dd>
									    				<span v-for="(item,index) in citylist.list4" :key='index' @click="pickcity(item)">
									    					{{item}}
									    				</span>
									     			</dd>
									    	</dl>
									    	<dl>
									    			<dt>STUV</dt>
									    			<dd>
									    				<span v-for="(item,index) in citylist.list5" :key='index' @click="pickcity(item)">
									    					{{item}}
									    				</span>
									     			</dd>
									    	</dl>
									    	<dl>
									    			<dt>WXYZ</dt>
									    			<dd>
									    				<span v-for="(item,index) in citylist.list6" :key='index' @click="pickcity(item)">
									    					{{item}}
									    				</span>
									     			</dd>
									    	</dl>
								    	</li>

		                        </ul>
		                    </dt>
		                    <dd>
		                        <dl>
		                            <dt>发展阶段：</dt>
		                            <dd>
		                            	<a href="javascript:void(0)">初创型</a>
			                            <a href="javascript:void(0)">成长型</a>
			                            <a href="javascript:void(0)">成熟型</a>
			                            <a href="javascript:void(0)">已上市</a>
			                        </dd>
		                        </dl>
		                        <dl>
		                            <dt>行业领域：</dt>
		                            <dd>
		                                <a href="javascript:void(0)">移动互联网</a>
			                            <a href="javascript:void(0)">电子商务</a>
			                            <a href="javascript:void(0)">社交</a>
			                            <a href="javascript:void(0)">企业服务</a>
			                            <a href="javascript:void(0)">O2O</a>
			                            <a href="javascript:void(0)">教育</a>
			                            <a href="javascript:void(0)">文化艺术</a>
			                            <a href="javascript:void(0)">游戏</a>
			                            <a href="javascript:void(0)">在线旅游</a>
			                            <a href="javascript:void(0)">金融互联网</a>
			                            <a href="javascript:void(0)">健康医疗</a>
			                            <a href="javascript:void(0)">生活服务</a>
			                            <a href="javascript:void(0)">硬件</a>
			                            <a href="javascript:void(0)">搜索</a>
			                            <a href="javascript:void(0)">安全</a>
			                            <a href="javascript:void(0)">运动体育</a>
			                            <a href="javascript:void(0)">云计算\大数据</a>
			                            <a href="javascript:void(0)">移动广告</a>
			                            <a href="javascript:void(0)">社会化营销</a>
			                            <a href="javascript:void(0)">视频多媒体</a>
			                            <a href="javascript:void(0)">媒体</a>
			                            <a href="javascript:void(0)">智能家居</a>
			                            <a href="javascript:void(0)">智能电视</a>
			                            <a href="javascript:void(0)">分类信息</a>
			                            <a href="javascript:void(0)">招聘</a>
			                        </dd>
		                        </dl>
		                        <!-- <dl>
		                            <dt>热门标签：</dt>
		                            <dd>
		                                	                                			                               	<a href="javascript:void(0)">年底双薪</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">专项奖金</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">股票期权</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">绩效奖金</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">年终分红</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">带薪年假</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">交通补助</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">通讯津贴</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">午餐补助</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">定期体检</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">弹性工作</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">年度旅游</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">节日礼物</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">免费班车</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">帅哥多</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">美女多</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">领导好</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">扁平管理</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">管理规范</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">技能培训</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">岗位晋升</a>
			                                	                                	                                			                               	<a href="javascript:void(0)">五险一金</a>
			                                	                                	                            </dd>
		                        </dl> -->
		                    </dd>
		                </dl>
		                
		               	<ul class="hc_list reset">
		               		<li @click="toCompanyDetail(index)" v-if="!isEmpty(item)" v-for="(item,index) in currentlist" :style="{'clear':index % 3 === 0?'both':''}" :key='index'>
		               			<companybox :company='item'></companybox>
		               		</li>
			            </ul>
			                
			            <div class="Pagination myself">
			            	<ul style="list-style: none;">
			            		<li>
			            			<a @click.prevent="pagedown" :class="pagination.currentpage == 1?'disabled':''">上一页</a>
			            		</li>
			            		<li>
			            			<a @click.prevent="topage(1)" :class="pagination.currentpage == 1?'disabled':''">首页</a>
			            		</li>
			            		<li v-for="(item,index) in getgrouplist" :key='index'>
			            			<a @click.prevent="topage(item.val)" :class="pagination.currentpage == item.val?'current':''">{{item.msg}}</a>
			            		</li>
			            		<li>
			            			<a @click.prevent="topage(pagination.total)" :class="pagination.currentpage == pagination.total?'disabled':''">尾页</a>
			            		</li>
			            		<li>
			            			<a @click.prevent="pageup" :class="pagination.currentpage == pagination.total?'disabled':''">下一页</a>
			            		</li>
			            	</ul>
			            </div>
			        </form>
	            </div>	
	            <div class="content_r">
	            	<!--<div class="subscribe_side">
		            	<a href="javascript:void(0)" target="_blank">
		                    <div class="subpos"><span>订阅</span> 职位</div>
		                    <div class="c7">拉勾网会根据你的筛选条件，定期将符合你要求的职位信息发给你
		                    </div>
		                    <div class="count">
		                    	已有
		                    	<em>{{parseInt(subscriptioncount / 10000)}}</em>
		                    	<em>{{parseInt(subscriptioncount / 1000 % 10)}}</em>
		                    	<em>{{parseInt(subscriptioncount / 100 % 100)}}</em>
		                    	<em>{{parseInt(subscriptioncount / 10 % 1000)}}</em>
		                    	<em>{{parseInt(subscriptioncount / 1 % 10000)}}</em>
		                    	人订阅
		                    </div>
		                    <i>我也要订阅职位</i>
		            	</a>
		            </div>-->
	                <a href="h/subject/jobguide.html" target="_blank" class="eventAd">
	               		<img src="../../../static/images/subject280.jpg" width="280" height="135" alt="互联网跳槽指南"/>
	               	</a>
	               	<a href="h/subject/risingPrice.html" target="_blank" class="eventAd">
	               		<img src="../../../static/images/rising280.png" width="280" height="135" alt="互联网涨价攻略"/>
	               	</a>
	            </div>
	       	</div>
			     	
			<div class="clear"></div>
	    	<totop></totop>
	    </div>
	</div>
	<footert></footert>
	</div>
</template>

<script>
	import footert from '../footer/footer'
	import headert from '../header/header'
	import totop from '../totop/totop'
	import companybox from './companybox'
	export default{
		name:'companylist',
		components:{
			footert,
			headert,
			totop,
			companybox
		},
		data(){
			return{
				keyWord:'',
				cityboxshow:false,
				companylist:null,
				currentlist:null,
				subscriptioncount:1,
				pagination:{
					limit:15,//单页显示的数据条数
					total:0,//总共的页数
					currentpage:1,//当前页数
					pagegroup:5//页数导航条显示的页数
				},
				citylist:{
					hotcities:['北京','上海','广州','深圳','成都','杭州','武汉','南京'],
					list1:['北京','长春','成都','重庆','长沙','常州','东莞','大连','佛山','福州'],
					list2:['贵阳','广州','哈尔滨','合肥','海口','杭州','惠州','金华','济南','嘉兴'],
					list3:['昆明','廊坊','宁波','南昌','南京','南宁','南通'],
					list4:['青岛','泉州'],
					list5:['上海','石家庄','绍兴','沈阳','深圳','苏州','天津','太原','台州'],
					list6:['武汉','无锡','温州','西安','厦门','烟台','珠海','中山','郑州']
				},
			}
		},
		methods:{
			toCompanyDetail(index){
				this.$router.push({
					path:'/companydetail',
					query:{
						companyId:this.currentlist[index].companyId
					}
				})
			},
			isEmpty(item){
				if(item.companyDetail==null||item.companyStage==null){
					return true
				}
				else{
					return false;
				}
			},
			pickcity(item){
				this.cityboxshow = false
			},
			pageup(){
				if(this.pagination.currentpage < this.pagination.total){
					this.pagination.currentpage++
					this.getcurrentlist()
				}
			},
			pagedown(){
				if(this.pagination.currentpage > 1){
					this.pagination.currentpage--
					this.getcurrentlist()
				}
			},
			topage(index){
				this.pagination.currentpage = index
				this.getcurrentlist()
			},
			/*getcompanylist(){
				this.$axios.get('/static/data/companylist.json').then((res) => {
					this.companylist = res.data.companylist
					console.log('in getcompanylist')
					console.log(this.companylist)
					this.pagination.total = Math.ceil(this.companylist.length / this.pagination.limit)
				})
			},*/
			getcurrentlist(){
				if(this.companylist){
					this.currentlist = this.companylist.slice(
						(this.pagination.currentpage - 1) * this.pagination.limit,
						this.pagination.currentpage * this.pagination.limit
					)
				}
				else{
					this.$axios({
						method:'get',
						url:'/api/company/search',
						params:{
							companyName:this.keyWord
						}
					}).then(res => {
						console.log(res)
						this.companylist = res.data.object
						this.pagination.total = Math.ceil(this.companylist.length / this.pagination.limit)
						this.currentlist = this.companylist.slice(
							(this.pagination.currentpage - 1) * this.pagination.limit,
							this.pagination.currentpage * this.pagination.limit
						)
					}).catch(err => {
						console.log(err)
					})
					/*this.$axios.get('/static/data/companylist.json').then(res => {
						this.companylist = res.data.companylist
//						console.log('in getcurrentlist')
						this.pagination.total = Math.ceil(this.companylist.length / this.pagination.limit)
						this.currentlist = this.companylist.slice(
							(this.pagination.currentpage - 1) * this.pagination.limit,
							this.pagination.currentpage * this.pagination.limit
						)
					});*/
				}
			}
		},
		computed:{
			/*getpagecount(){
				return Math.ceil(this.companylist.length / this.pagination.limit)
			},*/
			getgrouplist(){
				let len = this.pagination.total
				let center = this.pagination.currentpage
				let count = Math.floor(this.pagination.pagegroup / 2)
				
				let tmp = []
				let list = []
				
				//如果总页数小于等于pagegroup即显示的导航页数
				if(len <= this.pagination.pagegroup){
					for(let i = 1; i <= len; i++){
						list.push(
							{
								msg:i,
								val:i
							}
						)
					}
//					console.log('1')
//					console.log(list)
					return list
				}
				
				//否则
				for(let i = 1; i <= len; i++){
					tmp.push(
						{
							msg:i,
							val:i
						}
					)
				}
				
				(center < count + 1) && (center = count + 1);//当当前页是头几页时，保持center在正中心
				(center > len - count) && (center = len - count);//当当前页是末几页时，保持center在正中心
				
				tmp = tmp.splice(center - count - 1,this.pagination.pagegroup)
				for(let j = 0; j < tmp.length; j++){
					list.push(tmp[j])
				}
//				console.log('2')
//				console.log(list)
				return list
			}
		},
		created(){
			console.log(this.$route)
			if(this.$route.query.companyName!=undefined&&this.$route.query.companyName!=null){
				this.keyWord = this.$route.query.companyName
			}
			this.getcurrentlist()
			document.addEventListener('click',e => {
				let citybox = document.getElementById('box_expectCity')
				if(citybox && !citybox.contains(e.target)){
					this.cityboxshow = false
				}
			})
		}
	}
</script>

<style>
</style>