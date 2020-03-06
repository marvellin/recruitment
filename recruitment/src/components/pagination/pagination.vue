<template>
	<div class="Pagination myself">
		<ul style="list-style: none;">
			<li>
			    <a @click.prevent="change(currentpage-1)" :class="currentpage == 1?'disabled':''">上一页</a>
			</li>
			<li>
			    <a @click.prevent="change(1)" :class="currentpage == 1?'disabled':''">首页</a>
			</li>
			<li v-for="(item,index) in getgrouplist" :key='index'>
			    <a @click.prevent="change(item.val)" :class="currentpage == item.val?'current':''">{{item.msg}}</a>
			</li>
			<li>
			    <a @click.prevent="change(total)" :class="currentpage == total?'disabled':''">尾页</a>
			</li>
			<li>
			    <a @click.prevent="change(currentpage+1)" :class="currentpage == total?'disabled':''">下一页</a>
			</li>
		</ul>
	</div>
</template>

<script>
	export default{
		name:"pagination",
		data(){
			return{
				pagegroup:5//页数导航条显示的页数
				/*pagination:{
					limit:15,//单页显示的数据条数
					total:0,//总共的页数
					currentpage:1,//当前页数
					pagegroup:5//页数导航条显示的页数
				},*/
			}
		},
		props:{
			limit:{
				type:Number,
				default:15,
				required:true
			},
			total:{//总页数
				type:Number,
				default:0,
				required:true
			},
			currentpage:{
				type:Number,
				default:1,
				required:true
			},
		},
		computed:{
			getgrouplist(){
				let len = this.total
				let center = this.currentpage
				let count = Math.floor(this.pagegroup / 2)
				
				let tmp = []
				let list = []
				
				//如果总页数小于等于pagegroup即显示的导航页数
				if(len <= this.pagegroup){
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
				
				tmp = tmp.splice(center - count - 1,this.pagegroup)
				for(let j = 0; j < tmp.length; j++){
					list.push(tmp[j])
				}
				console.log('in getgrouplist in pagination ' + list)
				return list
			}
		},
		methods:{
			change(index){
				if(index !== this.currentpage && index > 0 && index < this.total){
					this.$emit("change",index)
				}
			}
		}
	}
</script>

<style>
</style>