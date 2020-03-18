<template>
	<div>
	<quill-editor name="editor" v-model="content" ref="editor" :options="editoroption" class="n-editor"></quill-editor>
	<!--<button @click="showerrors1">show</button>-->
	<!--<el-alert :closable="false" :title="errors.first('editor')" type="error" v-show="errors.has('editor')"></el-alert>-->
	</div>
</template>

<script>
	import quillEditor from 'vue-quill-editor'
	export default{
		name:'editor',
		data(){
			return{
				content:null,
				editoroption:{
					theme:'snow',
					modules:{
						toolbar:[
							['bold','underline'],
							[{'indent':'-1'},{'indent':'+1'}],
							[{'list': 'ordered'}],
							[{'align': []}],
							['clean'],
						]
					}
				},
			}
		},
		watch:{
			content(v){
				this.$emit("getcontent",v)
			}
		},
		/*methods:{
			showerrors1(){
				console.log(this.$validator)
			}
		}*/
	}
</script>

<style>
	.n-editor{
		/*min-width: 548px;*/
		width: auto;
		/*min-height: 320px;*/
		height: auto;
	}
</style>