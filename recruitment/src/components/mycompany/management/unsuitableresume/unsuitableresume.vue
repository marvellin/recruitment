<template>
	<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1>
                    <em></em>
                                                    不适合简历  <span>（共{{resume2positionlist.length}}份）
                    </span>                        
                </h1>
            </dt>
            <dd>
                <form action="canInterviewResumes.html" method="get" id="filterForm">
	                <div class="filter_actions">
		                <label class="checkbox">
		                    <input type="checkbox" @click="checkall" v-model="allcheck">
		                    <i :style="{'display':allcheck?'inline':'none'}"></i>
		                </label>
		                <span>全选</span>
		                <!--<a id="resumeRefuseAll" href="javascript:void(0);">通知面试</a>-->
		                <a id="resumeRefuseAll" @click.stop="deletemul" href="javascript:void(0);">删除</a>
		            </div><!-- end .filter_actions -->
                    <ul class="reset resumeLists">
		                <li class="onlineResume" v-for="(item,index) in resume2positionlist" :key='item.resume.id'>
			                <label class="checkbox">
			                    <input type="checkbox" :value="item.resume.id" v-model="checkmodel">
			                    <i :style="{'display':showlabel(item.resume.id)?'inline':'none'}"></i>
			                </label>
			                <resumebox :resume='item.resume' :time='item.time' :position='item.position'>
			                	<!--<a class="resume_notice" href="javascript:void(0)" slot='slot1'>通知面试</a>-->
			                	<a class="resume_notice" @click.stop="deleteone(item.resume.id)" href="javascript:void(0)" slot='slot2'>删除</a>
			                </resumebox>
			                <!--<div class="resumeShow">
			                    <a title="预览在线简历" target="_blank" class="resumeImg" href="resumeView.html?deliverId=1686182">
			                        <img src="../../../../../static/images/default_headpic.png">
			                    </a>
			                    <div class="resumeIntro">
			                        <h3 class="unread">
										<a target="_blank" title="预览jason的简历" href="resumeView.html?deliverId=1686182">
			                                jason的简历
			                            </a>
			                  		    <em></em>
			                        </h3> 
			                        <span class="fr">投递时间：2014-07-01 17:08</span>
			                        <div> 
			                            jason / 男 / 大专 / 3年 / 广州<br>
			                                                                         高级产品经理 · 上海辉硕科技有限公司 | 本科 · 北京大学
			                        </div>
			                        <div class="jdpublisher">
				                        <span>
				                                                                         应聘职位：<a title="随便写" target="_blank" href="http://www.lagou.com/jobs/149594.html">随便写</a>
				                        </span>
			                        </div>
			                    </div>
			                    <div class="links">
			                        <a data-deliverid="1686182" data-name="jason" data-positionid="149594" data-email="888888888@qq.com" class="resume_notice" href="javascript:void(0)">通知面试</a>
			                        <a data-deliverid="1686182" class="resume_refuse" href="javascript:void(0)">不合适</a>
			                        
			                    </div>
			                </div>
			                <div class="contactInfo">
			                    <span class="c9">电话：</span>18650216666   &nbsp;&nbsp;&nbsp;   
			                    <span class="c9">邮箱：</span><a href="mailto:888888888@qq.com">888888888@qq.com</a>
			                </div>-->
			            </li>
		            </ul><!-- end .resumeLists -->
		        </form>
            </dd>
        </dl><!-- end .company_center_content -->
    </div>
</template>

<script>
	import resumebox from '../resumebox/resumebox'
	export default{
		name:'unsuitableresume',
		components:{
			resumebox
		},
		data(){
			return{
				resume2positionlist:[],
				checkmodel:[],
				allcheck:false
			}
		},
		methods:{
			checkall(){
				if(this.allcheck){
					this.checkmodel = []
				}else{
					this.resume2positionlist.forEach((item) => {
						if(this.checkmodel.indexOf(item.resume.id) === -1){
							this.checkmodel.push(item.resume.id)
						}
					})
				}
			},
			showlabel(id){
				if(this.checkmodel.indexOf(id) > -1){
					return true
				}else{
					return false
				}
			},
			deleteone(id){
				for(let i = 0; i < this.resume2positionlist.length; i++){
					if(this.resume2positionlist[i].resume.id == id){
						this.resume2positionlist.splice(i,1)
						break
					}
				}
			},
			deletemul(){
				/*for(let i = 0; i < this.resume2positionlist.length; i++){
					if(this.checkmodel.indexOf(this.resume2positionlist[i].resume.id)){
						this.resume2positionlist.splice(i,1)
						i--
					}
				}*/
				for(let i = this.checkmodel.length - 1; i >= 0; i--){
					let index = this.resume2positionlist.findIndex((item) => item.resume.id === this.checkmodel[i])
					this.resume2positionlist.splice(index,1)
					this.checkmodel.splice(i,1)
				}
			}
		},
		created(){
			//获取resume2positionlist
			this.$axios.get('/static/data/resume2positionlist.json').then(res => {
				this.resume2positionlist = res.data.resume2positionlist
			});
		},
		watch:{
			checkmodel(){
				if(this.checkmodel.length === this.resume2positionlist.length){
					this.allcheck = true
				}
				else{
					this.allcheck = false
				}
			}
		}
	}
</script>

<style>
</style>