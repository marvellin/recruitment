import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios';
import personModules from './modules/person'
import companyModules from './modules/company'

import ElementUI from 'element-ui'
import {Message} from 'element-ui'

Vue.use(Vuex)

export default new Vuex.Store({
	modules:{
		person:personModules,
		company:companyModules
	},
	state:{
		userId(){
			return localStorage.getItem("userId")
		},
		email(){
			return localStorage.getItem("email")
		},
		isCompany(){
			return localStorage.getItem("isCompany")
		},
		isLogined(){
			return localStorage.getItem("isLogined")
		},
		
		isFalse(){
			return localStorage.getItem("isFalse")
		},
		flaseMsg(){
			return localStorage.getItem("flaseMsg")
		}
		/*userId:null,
		isCompany:null,
		isLogined:null,
		
		isWrongCount:null,
		wrongMessage:null,*/
	},
	getters:{
		
	},
	mutations:{
		setUser(state,{userId,email,role}){
			localStorage.clear()
			localStorage.setItem("userId",userId)
			localStorage.setItem("email",email)
			localStorage.setItem("role",role)
			localStorage.setItem("isCompany",role=='company'?true:false)
			localStorage.setItem("isLogined",true)
			/*state.userId = userId
			state.isLogined = true
			state.isCompany = role=='company'?true:false*/
		},
		setWrongMsg(state,{isFalse,flaseMsg}){
			localStorage.clear()
			localStorage.setItem("isFalse",isFalse)
			localStorage.setItem("flaseMsg",flaseMsg)
		},
		clear(state){
			localStorage.clear()	
		}
	},
	actions:{
		userLogin(context,{loginEmail,loginPassword,router}){
			axios({
				method:'post',
				url:'api/login',
				params:{
					email:loginEmail,
					password:loginPassword
				}
			}).then(res => {
				console.log(res)
				if(res.data.code==200){
					context.commit('setUser',{userId:res.data.object.userId,email:res.data.object.email,role:res.data.object.role},{root:true})					
					if(res.data.object.role == 'person'){
						context.dispatch('person/getPerson',{loginedUserId:res.data.object.userId,router:router})
					}
					else if(res.data.object.role == 'company'){
						context.dispatch('company/getCompany',{loginedUserId:res.data.object.userId,router:router})
					}
					//然后执行页面跳转
					//router.push({path:'/'})
				}
				else{
					context.commit('setWrongMsg',{isFalse:true,flaseMsg:res.data.msg})
					Message({
						type:'warn',
						message:res.data.msg,
						duration:3000
					})
				}
			}).catch(err => {
				console.log(err)
			})
		}
	}
})
