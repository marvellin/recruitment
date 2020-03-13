<template>
	<div id="thumbs_s">
		<ul id="da-thumbs" class="da-thumbs">
			<li v-for="(item,index) in thumbslist" :key='index' @mouseenter="over(index)" @mouseleave="out">
				<router-link :to="{path:item.path}" target="_blank">
					<img :src="item.img" :alt="item.h2" width="113" height="113"/>
					<!--<div class="hot_info" :class="[show?'current':'']">
						<h2 :title="item.h2">{{item.h2}}</h2>
						<em></em>
						<p :title="item.p">
							{{item.p}}
						</p>
					</div>-->
					<hotinfo :info='item.sub' :show='show' v-show='show&&index==current'></hotinfo>
				</router-link>
			</li>
		</ul>
	</div>
</template>

<script>
	import hotinfo from './hotinfo.vue'
	
	export default{
		name:'thumbs',
		components:{
			hotinfo
		},
		methods:{
			over(index){
				this.show = true
				this.current = index
				/*var e = event || window.event
				var target = event.target
				
				//获取鼠标位置
				var x = event.clientX
				var y = event.clientY
				console.log('x:' + x + ' ' + 'y:' + y)
				
				//获取图片距离浏览器位置
				var t = target.offsetTop
				var b = target.offsetHeight + t
				var l = target.offsetLeft
				var r = target.offsetWidth + l
				
				//获取鼠标与图片距离浏览器位置的差值（注意有负值，需要使用绝对值Math.abs）
				var chaYT = Math.abs(y - t)
				var chaYB = Math.abs(y - b)
				var chaXL = Math.abs(x - l)
				var chaXR = Math.abs(x - r)
				
				//获取最小值
				var min = Math.min(chaYT,chaYB,chaXL,chaXR)
				
				//判断方向
				switch(min){
					case chaYT:{
						console.log('从上进')
						this.dir = 't'
						break;
					}
					case chaYB:{
						console.log('从下进')
						this.dir = 'b'
						break;
					}
					case chaXL:{
						console.log('从左进')
						this.dir = 'l'
						break;
					}
					case chaXR:{
						console.log('从右进')
						this.dir = 'r'
						break;
					}
				}*/
			},
			out(){
				this.show = false
				this.current = null
			}
		},
		data(){
			return{
				show:false,
				current:null,
				thumbslist:[
				{
					img:'../../../static/images/f4822a445a8b495ebad81fcfad3e40e2.jpg',
					sub:{
						h2:'思特沃克',
						p:'一家全球信息技术服务公司'
					},
					path:''
				},
				{
					img:'../../../static/images/a254b11ecead45bda166afa8aaa9c8bc.jpg',
					sub:{
						h2:'联想',
						p:'世界因联想更美好'
					},
					path:''
				},
				{
					img:'../../../static/images/c75654bc2ab141df8218983cfe5c89f9.jpg',
					sub:{
						h2:'淘米',
						p:'将心诸如 追随极致',
					},
					path:''
				},
				{
					img:'../../../static/images/2bba2b71d0b0443eaea1774f7ee17c9f.png',
					sub:{
						h2:'优酷土豆',
						p:'专注于视频领域，是中国网络视频行业领军企业',
					},
					path:''
				},
				{
					img:'../../../static/images/5caf8f9631114bf990f87bb11360653e.png',
					sub:{
						h2:'奇猫',
						p:'专注于移动互联网、互联网产品研发',
					},
					path:''
				},
				{
					img:'../../../static/images/c0052c69ef4546c3b7d08366d0744974.jpg',
					sub:{
						h2:'堆糖网',
						p:'分享收集生活中的美好，遇见世界上的另外一个你',
					},
					path:''
				}]
			}
		}
	}
</script>

<style>
	/*#thumbs_s ul li:last-child{
		margin-right:0;
	}*/
</style>