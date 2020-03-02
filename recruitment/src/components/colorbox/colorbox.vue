<template>
	<div style="overflow: visible;">
		<div id="cboxOverlay" :style="{'display':show?'block':'none','opacity':show?'0.9':'1','cursor':show?'pointer':'auto'}" style="visibility: visible;overflow:visible;"></div>
		<div id="colorbox" class="" role="dialog" tabindex="-1" :style="{'display':show?'block':'none'}" style="overflow:visible;visibility: visible;top: 307px;left: 370.8px;position: absolute;width: 628px;height: 428px;opacity: 1;cursor: suto;">
			<div id="cboxWrapper" style="width: 628px;height: 428px;">
				<div>
					<div id="cboxTopLeft" style="float: left;"></div>
					<div id="cboxTopCenter" style="float: left;width: 602px;"></div>
					<div id="cboxTopRight" style="float: left;"></div>
				</div>
				<div style="clear: left;">
					<div id="cboxMiddleLeft" style="float: left;height: 402px;"></div>
					<div id="cboxContent" style="overflow:visible;float: left;height: 402px;width: 602px;">
						<div id="cboxLoadedContent" style="width: 602px;height: 338px;overflow:visible;">
							<slot name="slot1"></slot>
						</div>
						<div id="cboxTitle" style="float: left;display: block;">{{title}}</div>
						<button type="button" id="cboxClose" @click="closecolorbox">close</button>
					</div>
					<div id="cboxMiddleRight" style="float: left;height: 402px;"></div>
				</div>
				<div style="clear: left;">
					<div id="cboxBottomLeft" style="float: left;"></div>
					<div id="cboxBottomCenter" style="float: left;width: 602px;"></div>
					<div id="cboxBottomRight" style="float: left;"></div>
				</div>
			</div>
			<!--<div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>-->
		</div>
	</div>
</template>

<script>
	export default{
		name:"colorbox",
		methods:{
			closecolorbox(){
//				console.log(this.title)
				this.$emit("closebox",'')
			}
		},
		props:{
			title:{
				default:""
			},
			show:{
				type:Boolean
			}
		}
	}
</script>

<style>
</style>