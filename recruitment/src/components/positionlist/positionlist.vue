<template>
	<div>
		<div id="body">
			<headert :isCompany="false" :navlist="1"></headert>
			<div id="container">
				<sidebar>
					<div class="qq_group" slot="slot1">
		            	加入<span>前端</span>QQ群
		            	<div class="f18">跟同行聊聊</div>
		            	<p>1000000000</p>
		            </div>
		            <a href="http://www.w3cplus.com/" target="_blank" class="partnersAd">
		            	<img src="../../../static/images/w3cplus.png" width="230" height="80" alt="w3cplus" />
		            </a>
				    <a href="" target="_blank" class="partnersAd">
				        <img src="../../../static/images/jquery_school.jpg" width="230" height="80" alt="JQ学校" />
				    </a>
				    <a href="http://linux.cn/" target="_blank" class="partnersAd">
			            <img src="../../../static/images/linuxcn.png" width="230" height="80" alt="Linux中文社区"  />
			        </a>
			        <a href="http://zt.zhubajie.com/zt/makesite? utm_source=lagou.com&utm_medium=referral&utm_campaign=BD-yl" target="_blank" class="partnersAd">
			            <img src="../../../static/images/zhubajie.jpg" width="230" height="80" alt="猪八戒" />
			        </a>
			        <a href="http://www.imooc.com" target="_blank" class="partnersAd">
			            <img src="../../../static/images/muke.jpg" width="230" height="80" alt="幕课网" />
			        </a>
				</sidebar>
				<div class="content">
					<searchbox></searchbox>
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
					<div class="breakline"></div>
					<dl class="workplace" id="workplaceSelect">
		                	<dt class="fl">工作地点：</dt>
		               	    <dd>
		                		<a href="javascript:;" :class="" class="current">全国</a>|
		                	</dd>
		                	<dd v-for="(item,index) in citylist.hotcities" :key="index">
		                		<a href="javascript:;" @click="pickcity(item)" :class="">{{item}}</a>|
		                	</dd>
		               	    <dd class="more" :class="[{open:cityboxshow}]">
		                		<a href="javascript:;" @click.stop="cityboxshow=true">其他</a> 
		                	    <div :class="[{transform:cityboxshow}]" class="triangle citymore_arrow"></div>
		                	</dd>
		               	    <dd id="box_expectCity" class="searchlist_expectCity" :style="{'display':cityboxshow?'block':'none'}">
				            		<span class="bot"></span>
				            		<span class="top"></span>
					    			<dl>
						    			<dt>ABCDEF</dt>
						    			<dd>
						    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list1" :key="index">
						    					{{item}}
						    				</span>
						     			</dd>
						    	  	</dl>
						    	  	<dl>
						    			<dt>GHIJ</dt>
						    			<dd>
						    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list2" :key="index">
						    					{{item}}
						    				</span>
						     			</dd>
						    	  	</dl>
						    	  	<dl>
						    			<dt>KLMN</dt>
						    			<dd>
						    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list3" :key="index">
						    					{{item}}
						    				</span>
						     			</dd>
						    	  	</dl>
						    	  	<dl>
						    			<dt>OPQR</dt>
						    			<dd>
						    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list4" :key="index">
						    					{{item}}
						    				</span>
						     			</dd>
						    	  	</dl>
						    	  	<dl>
						    			<dt>STUV</dt>
						    			<dd>
						    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list5" :key="index">
						    					{{item}}
						    				</span>
						     			</dd>
						    	  	</dl>
						    	  	<dl>
						    			<dt>WXYZ</dt>
						    			<dd>
						    				<span @click="pickcity(item)" v-for="(item,index) in citylist.list6" :key="index">
						    					{{item}}
						    				</span>
						     			</dd>
						    	  	</dl>
					    	</dd>  
		            </dl>
					<ul class="hot_pos reset">
						<li :class="index%2==0?'clearfix':'odd clearfix'" v-for="(item,index) in currentlist" :key="index">
							<leftbox :job="item.position"></leftbox>
							<rightbox :company="item.company">
								<div class="apply" slot="slot1">
									<!--<a href="toudi.html" target="_blank">投个简历</a>-->
									<router-link target="_blank" to="">投个简历</router-link>
								</div>
							</rightbox>
						</li>
					</ul>
					<div class="Pagination">
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
				</div>
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
	import sidebar from './sidebar/sidebar'
	import leftbox from '../home/hotlist/leftbox/hotlist_l'
	import rightbox from '../home/hotlist/rightbox/hotlist_r'
	import searchbox from '../home/searchbox/searchbox'
	export default{
		name:"positionlist",
		data(){
			return{
				cityboxshow:false,
				citylist:{
					hotcities:['北京','上海','广州','深圳','成都','杭州','武汉','南京'],
					list1:['北京','长春','成都','重庆','长沙','常州','东莞','大连','佛山','福州'],
					list2:['贵阳','广州','哈尔滨','合肥','海口','杭州','惠州','金华','济南','嘉兴'],
					list3:['昆明','廊坊','宁波','南昌','南京','南宁','南通'],
					list4:['青岛','泉州'],
					list5:['上海','石家庄','绍兴','沈阳','深圳','苏州','天津','太原','台州'],
					list6:['武汉','无锡','温州','西安','厦门','烟台','珠海','中山','郑州']
				},
				position2companylist:null,
				currentlist:[],
				pagination:{
					limit:10,//单页显示的数据条数
					total:0,//总共的页数
					currentpage:1,//当前页数
					pagegroup:5//页数导航条显示的页数
				}
			}
		},
		mounted(){
			document.addEventListener('click',e => {
				let box = document.getElementById('box_expectCity')
				if(box && !box.contains(e.target)){
					this.cityboxshow = false
				}
			})
		},
		components:{
			headert,
			footert,
			totop,
			sidebar,
			leftbox,
			rightbox,
			searchbox
		},
		methods:{
			pickcity(city){
				//根据参数city访问后端获取数据并关闭citybox
				this.cityboxshow = false
			},
			pagedown(){
				if(this.pagination.currentpage > 1){
					this.pagination.currentpage--
					this.getcurrentlist()
				}
			},
			pageup(){
				if(this.pagination.currentpage < this.pagination.total){
					this.pagination.currentpage++
					this.getcurrentlist()
				}
			},
			topage(index){
				this.pagination.currentpage = index
				this.getcurrentlist()
			},
			getcurrentlist(){
				if(this.position2companylist){
					this.currentlist = this.position2companylist.slice(
						(this.pagination.currentpage - 1) * this.pagination.limit,
						this.pagination.currentpage * this.pagination.limit
					)
				}
				else{
					this.$axios.get("http://127.0.0.1:3000/position2companylist")
					.then((res) => {
						this.position2companylist = res.data
						this.pagination.total = Math.ceil(this.position2companylist.length / this.pagination.limit)
						this.currentlist = this.position2companylist.slice(
							(this.pagination.currentpage - 1) * this.pagination.limit,
							this.pagination.currentpage * this.pagination.limit
						)
//						console.log(this.currentlist)
//						console.log(this.position2companylist)
					})
					.catch((err) => {
						console.log(err)
					})
				}
			}
		},
		computed:{
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
				return list
			}
		},
		created(){
			this.getcurrentlist()
		}
	}
</script>

<style>
</style>