import axios from 'axios';
import ElementUI from 'element-ui'
import {Message} from 'element-ui'
export default{
	namespaced:true,
	state:{
		companyId(){
			return localStorage.getItem("companyId")
		}
	},
	getters:{
		
	},
	mutations:{
		setCompany(state,{companyId}){
			localStorage.setItem("companyId",companyId)
		},
		clear(state){
			localStorage.clear()
		}
	},
	actions:{
		getCompany(context,{loginedUserId,router}){
			console.log('enter getCompany')
			axios({
				method:'post',
				url:'/api/company/getByUserId',
				params:{
					userId:loginedUserId
				}
			}).then(res => {
				console.log(res)
				if(res.data.code == 200){
					context.commit('setCompany',{companyId:res.data.object.companyId})
					if(!res.data.object.companyDetail||res.data.object.companyDetail.shortname==undefined||res.data.object.companyDetail.shortname==null){
						router.push({
							path:'/companyinfofillin'
						})
						Message({
							type:'warn',
							message:'请先完善您的信息！'
						})
					}
					else{
						router.push({
							path:'/'
						})
					}
				}
			}).catch(err => {
				console.log(err)
			})
		}
	}
}