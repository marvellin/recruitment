<template>
	<div id="search_box">
		<form id="searchForm" name="searchForm">
			<!--<ul id="searchType" @mouseover="mouseOver" @mouseout="mouseOut" v-else="!comshow">
				<li data-searchtype="1" :class="comshow?'':'type-selected'" :style="{'display': show?'block':comshow?'none':'block'}" @click="changeofpos">职位</li>
				<li data-searchtype="4" :class="comshow?'type-selected':''" :style="{'display': show?'list-item':comshow?'list-item':'none'}" @click="changeofcom">公司</li>
			</ul>-->
			<ul id="searchType" v-if="comshow" @mouseover="mouseOver" @mouseout="mouseOut">
				<li data-searchtype="4" class="type-selected" style="display:list-item;" @click="changeofcom">公司</li>
				<li data-searchtype="1" class="" :style="{'display': show?'block':'none'}" @click="changeofpos">职位</li>
			</ul>
			<ul id="searchType" @mouseover="mouseOver" @mouseout="mouseOut" v-else>
				<li data-searchtype="1" class="type-selected" style="display: block;" @click="changeofpos">职位</li>
				<li data-searchtype="4" class="" :style="{'display': show?'list-item':'none'}" @click="changeofcom">公司</li>
			</ul>
			<div :class="[searchtype_arrow,show?'transform':'']"></div>
			<input type="text" id="search_input" name="kd" tabindex="1" value="" :placeholder="placeholder"/>
			<input type="hidden" name="spc" id="spcInput" value=""/>
			<input type="hidden" name="pl" id="plInput" value=""/>
			<input type="hidden" name="gj" id="gjInput" value=""/>
			<input type="hidden" name="xl" id="xlInput" value=""/>
			<input type="hidden" name="yx" id="yxInput" value=""/>
			<input type="hidden" name="gx" id="gxInput" value=""/>
			<input type="hidden" name="st" id="stInput" value=""/>
			<input type="hidden" name="labelWords" id="labelWords" value=""/>
			<input type="hidden" name="lc" id="lc" value=""/>
			<input type="hidden" name="workAddress" id="workAddress" value=""/>
			<input type="hidden" name="city" id="cityInput" value=""/>
			<input type="submit" id="search_button" value="搜索"/>
		</form>
	</div>
</template>

<script>
	export default{
		name:'searchbox',
		data(){
			return{
				show:false,
				comshow:false,
				searchtype_arrow:'searchtype_arrow',
				placeholder:'请输入职位名称'
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
				this.comshow=false
				this.placeholder='  请输入职位名称'
			},
			changeofcom(){
//				console.log("click company")
				this.comshow=true
				this.placeholder='  请输入公司名称'
			}
		}
	}
</script>

<style>
</style>