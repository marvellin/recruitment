import axios from 'axios';
import ElementUI from 'element-ui'
import {Message} from 'element-ui'
import router from '../../router/index'
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
					if(!res.data.object.basicinfo||res.data.object.basicinfo.username==undefined||res.data.object.basicinfo.username==null){
						router.push({
							path:'/personinfofillin'
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
