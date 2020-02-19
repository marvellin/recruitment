<template>
	<quill-editor v-model="content" ref="editor" :options="editoroption" class="n-editor"></quill-editor>
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
		}
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