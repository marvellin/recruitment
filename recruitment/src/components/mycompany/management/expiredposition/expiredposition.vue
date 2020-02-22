<template>
<div class="content">
        <dl class="company_center_content">
            <dt>
                <h1>
                    <em></em>
                                                    已下线职位                     
                </h1>
            </dt>
            <dd>
                <form id="searchForm">
			        <ul class="reset my_jobs">
				        <li v-for="(item,index) in position2resumelist" :key='index'>
				        	<positionbox :time='item.time' :position='item.position'>
								<a class="job_offline" href="javascript:void(0)" slot="slot2">上线</a> 
				        	</positionbox>
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
		name:'expiredposition',
		components:{
			positionbox
		},
		data(){
			return{
				position2resumelist:[]
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