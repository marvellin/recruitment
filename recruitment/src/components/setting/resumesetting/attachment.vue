<template>
	<div>
		<div v-show="!resumefilelist||resumefilelist.length===0" style="text-align: center;font-weight: 600;line-height:40px;margin: 20px 10px;padding: 20px 10px;">
			您还没有简历附件，
			<a style="position: relative;cursor:pointer" href="javascript:void(0);">
				<span>请上传您的简历附件（不多于3个）</span>
				<input type="file" @change="getresumefile" style="{display:block;position:absolute;top:0;left:0;width:219px;height:19px;font-size:100px;opacity:0;filter:alpha(opacity=0);cursor:pointer}" accept="application/msword,application/pdf,application/vnd.ms-powerpoint,application/vnd.ms-works,text/plain"/>
			</a>
			<div>
				<img width="100px" height="100px" src="../../../../static/images/u=1065457796,2310451731&fm=26&gp=0.jpg"/>
			</div>
		</div>
		<div lass="resumeUploadDiv" v-if="resumefilelist.length !== 0">
			<ul class="reset resumelist_s">
				<li style="line-height: 30px;background-color: white;margin: 20px 20px;padding: 5px 10px;border-bottom: 1px black solid;" v-for="(item,index) in resumefilelist" :key="index">
					<a class="resumename" @click.prevent="downloadresumefile">{{item.name}}</a>
					<p class="fr" style="margin: 0 5px;color: #019875;">默认简历</p>
					<a class="fr deleteresume" @click.prevent="deleteresumefile(index)">删除</a>
					<a class="fr resetresume" @click.prevent="resetresumefile(index)">设为默认简历</a>
				</li>
			</ul>
			<a style="position: relative;cursor: pointer;display: block;width:177px;height: 20px;margin: 0 auto;line-height: 20px;" href="javascript:void(0);">
				<span>上传简历附件（不多于3个）</span>
				<input type="file" @change="getresumefile" style="{display:block;position:absolute;top:0;left:0;width:177px;height:19px;font-size:100px;opacity:0;filter:alpha(opacity=0);cursor:pointer;}" accept="application/msword,application/pdf,application/vnd.ms-powerpoint,application/vnd.ms-works,text/plain"/>
			</a>
		</div>
		<span style="margin: 0 auto;text-align: center;width: 694px;height: 44px;line-height: 44px;display: block;">
			支持word、pdf、ppt、txt、wps格式文件,文件大小需小于10M
		</span>
	</div>
</template>

<script>
	export default{
		name:"attachment",
		data(){
			return{
				resumefilelist:[]
			}
		},
		methods:{
			downloadresumefile(){
				//传递文件对象给后台，返回字节流，创建下载url下载文件
			},
			getresumefile(e){
				//上传选中的简历附件
				var file = e.target.files[0]
				if(this.resumefilelist && this.resumefilelist.length < 3){
					this.resumefilelist.push(file)
				}
				else{
					this.$message({
						type:"warn",
						message:"已经上传3个简历附件！无法上传更多简历附件。"
					})
				}
			},
			deleteresumefile(index){
				if(index >= 0 && index < this.resumefilelist.length){
					this.$confirm('是否删除这个简历附件?', '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
			        }).then(() => {
			        	  this.resumefilelist.splice(index,1)
				          this.$message({
				            type: 'success',
				            message: '删除成功!'
				          });
			        }).catch(() => {
				          this.$message({
				            type: 'info',
				            message: '已取消删除'
				          });          
			        })
				}
			},
			resetresumefile(index){
				
			}
		}
	}
</script>

<style>
	.resumelist_s a{
		margin: 0 5px;
	}
	.deleteresume:hover{
		color: red;
	}
	.resumename{
		font-weight: 600;
	}
</style>