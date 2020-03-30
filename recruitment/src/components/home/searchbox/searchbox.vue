<template>
	<div id="search_box">
		<form id="searchForm" name="searchForm">
			<!--<ul id="searchType" @mouseover="mouseOver" @mouseout="mouseOut" v-else="!isCompany">
				<li data-searchtype="1" :class="isCompany?'':'type-selected'" :style="{'display': show?'block':isCompany?'none':'block'}" @click="changeofpos">职位</li>
				<li data-searchtype="4" :class="isCompany?'type-selected':''" :style="{'display': show?'list-item':isCompany?'list-item':'none'}" @click="changeofcom">公司</li>
			</ul>-->
			<ul id="searchType" v-if="isCompany" @mouseover="mouseOver" @mouseout="mouseOut">
				<li data-searchtype="4" class="type-selected" style="display:list-item;" @click="changeofcom">公司</li>
				<li data-searchtype="1" class="" :style="{'display': show?'block':'none'}" @click="changeofpos">职位</li>
			</ul>
			<ul id="searchType" @mouseover="mouseOver" @mouseout="mouseOut" v-else>
				<li data-searchtype="1" class="type-selected" style="display: block;" @click="changeofpos">职位</li>
				<li data-searchtype="4" class="" :style="{'display': show?'list-item':'none'}" @click="changeofcom">公司</li>
			</ul>
			<div :class="[searchtype_arrow,show?'transform':'']"></div>
			<input type="text" id="search_input" name="kd" tabindex="1" v-model="keyWord" :placeholder="placeholder"/>
			<input type="submit" @click="search" id="search_button" value="搜索"/>
		</form>
	</div>
</template>

<script>
	export default{
		name:'searchbox',
		data(){
			return{
				keyWord:null,
				show:false,
				isCompany:false,
				searchtype_arrow:'searchtype_arrow',
				placeholder:'请输入职位名称',
//				type:'position'
			}
		},
		methods:{
			mouseOver(){
				this.show=true
			},
			mouseOut(){
				this.show=false
			},
			changeofpos(){
//				console.log("click position")
//				this.type = 'position'
				this.isCompany=false
				this.placeholder='请输入职位名称'
			},
			changeofcom(){
//				console.log("click company")
//				this.type = 'company'
				this.isCompany=true
				this.placeholder='请输入公司名称'
			},
			search(){
				if(this.isCompany){
					this.$router.push({
						path:'/companylist',
						query:{
							companyName:this.keyWord
						}
					})
				}
				else{
					this.$router.push({
						path:'/positionlist',
						query:{
							positionName:this.keyWord
						}
					})
				}
			}
		}
	}
</script>

<style>
</style>