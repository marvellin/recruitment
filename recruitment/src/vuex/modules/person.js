import axios from 'axios';
export default{
	namespaced:true,
	state:{
		personId(){
			return localStorage.getItem("personId")
		}
		/*person:{
			get PersonId(){
				return localStorage.getItem("personId")
			}
		},*/
	},
	getters:{
		
	},
	mutations:{
		setPerson(state,{personId}){
			localStorage.setItem("personId",personId)
		},
		clear(state){
			localStorage.clear()
		}
	},
	actions:{
		getPerson(context,{loginedUserId}){
			console.log('enter getPerson')
			axios({
				method:'post',
				url:'/api/person/getByUserId',
				params:{
					userId:loginedUserId
				}
			}).then(res => {
				console.log(res)
				if(res.data.code == 200){
					context.commit('setPerson',{personId:res.data.object.personId})
				}
			}).catch(err => {
				console.log(err)
			})
		}
	}
}
