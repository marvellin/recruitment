<template>
	<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1>
                    <em></em>
                                                     有效职位
                    <span>
                    	（共<i style="color:#fff;font-style:normal" id="positionNumber">{{position2resumelist.length}}</i>个）
                    </span>                        
                </h1>
            </dt>
            <dd>
                <form id="searchForm">
			        <ul class="reset my_jobs">
				        <li v-for="(item,index) in position2resumelist" :key='index'>
				        	<positionbox :time='item.time' :position='item.position'>
				        		<span class="receivedResumeNo" slot="slot1">
								    <a href="unHandleResumes.html?positionId=149594">应聘简历（{{item.resume.length}}）</a>
								</span>
								<a class="job_offline" href="javascript:void(0)" slot="slot2">下线</a> 
				        	</positionbox>
		                    <!--<h3>
		                        <router-link target="_blank" title="" to="">{{position.name}}</router-link>
		                        <span>[{{position.city}}]</span>
		                    </h3>
		                    <span class="receivedResumeNo">
		                    	<a href="unHandleResumes.html?positionId=149594">应聘简历（{{1}}）</a>
		                    </span>
		                    <div>{{position.type}} / {{position.salarymin}}k-{{position.salarymax}}k / {{position.experience}} / {{position.degree}}及以上</div>
		                    <div class="c9">发布时间： {{time}}</div>
			                <div class="links">
		                        <router-link target = "_blank" class="job_edit" to="">编辑</router-link>
		                        <a class="job_offline" href="javascript:void(0)">下线</a>                      
		                        <a class="job_del" href="javascript:void(0)">删除</a>
		                    </div>-->
		                </li>
	                </ul>
			    </form>
		    </dd>
        </dl>
    </div>
</template>

<script>
	import positionbox from '../positionbox/positionbox'
	export default{
		name:'validposition',
		components:{positionbox},
		data(){
			return{
				position2resumelist:[],
			}
		},
		created(){
			this.$axios.get('/static/data/position2resumelist.json').then(res => {
				this.position2resumelist = res.data.position2resumelist
			}).catch(err => {
				console.log(err)
			})
		}
	}
</script>

<style>
</style>