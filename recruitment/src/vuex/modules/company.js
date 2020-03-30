import axios from 'axios';
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
		getCompany(context,{loginedUserId}){
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
				}
			}).catch(err => {
				console.log(err)
			})
		}
	}
}