import Vue from 'vue'
import Router from 'vue-router'
import home from '@/components/home/home'
import login from '@/components/login&register/login/login'
import hotlist from '@/components/home/hotlist/hotlist'
import register from '@/components/login&register/register/register'
import myCompany from '@/components/mycompany/myCompany'
import myresume from '@/components/resume/resume'
import preview from'@/components/resume/preview'
import companylist from '@/components/companylist/companylist'
import management from '@/components/mycompany/management/index.vue'
import expiredposition from '@/components/mycompany/management/expiredposition/expiredposition'
import notifiedresume from '@/components/mycompany/management/notifiedresume/notifiedresume'
import pendingresume from '@/components/mycompany/management/pendingresume/pendingresume'
import postposition from '@/components/mycompany/management/postposition/postposition'
import postpositionsuccess from '@/components/mycompany/management/postposition/success'
import unsuitableresume from '@/components/mycompany/management/unsuitableresume/unsuitableresume'
import validposition from '@/components/mycompany/management/validposition/validposition'
import undeterminedresume from '@/components/mycompany/management/undeterminedresume/undeterminedresume'
import positiondetail from '@/components/positiondetail/positiondetail'
import collection from '@/components/collection/collection'
import positionlist from '@/components/positionlist/positionlist'
import delivery from '@/components/delivery/delivery'
import deliveryform from '@/components/delivery/deliveryform/deliveryform'
import companydetail from '@/components/companydetail/companydetail'
import companyhome from '@/components/companydetail/home/company_home'
import companyposition from '@/components/companydetail/position/company_position'
import companyproduct from '@/components/companydetail/product/company_product'
import auth from '@/components/auth/auth'
import authsuccess from '@/components/auth/authsuccess'
import about from '@/components/about/about'
import companyinfofillin from '@/components/companyinfofillin/index'
import index1 from '@/components/companyinfofillin/index1/index1'
import index2 from '@/components/companyinfofillin/index2/index2'
import index3 from '@/components/companyinfofillin/index3/index3'
import index4 from '@/components/companyinfofillin/index4/index4'
import index5 from '@/components/companyinfofillin/index5/index5'
import companyinforfillinsuccess from '@/components/companyinfofillin/success/success'
import setting from '@/components/setting/index'
import pwdsetting from '@/components/setting/pwdsetting/pwdsetting'
import resumesetting from '@/components/setting/resumesetting/resumesetting'
import attachment from '@/components/setting/resumesetting/attachment'
import online from '@/components/setting/resumesetting/online'
import infosetting from '@/components/setting/infosetting/infosetting'
import errorpage from '@/components/error/error'
import personinfofillin from '@/components/personinfofillin/personinfofillin'

import ElementUI from 'element-ui'
import {Message} from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import store from '../vuex/vuex'
Vue.use(Router)
Vue.use(ElementUI)


const router = new Router({
	mode:"history",
  routes: [
  {
  	path:'*',
  	name:'error',
  	component:errorpage
  },
    {
      path: '/',
      redirect:'/home',
      component: home,
      meta:{
      	title:'全国招聘第一站',
//    	requiresLogin:true,
//    	requiresUser:true,
//    	requiresCompany:true
      }
    },
    {
    	path:'/home',
    	name:'home',
    	component:home,
    	meta:{
	      	title:'全国招聘第一站',
//	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	      }
    },
    {
    	path:'/login',
    	name:'login',
    	component:login,
    	meta:{
	      	title:'登陆',
//	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	      }
    },
    {
    	path:'/register',
    	name:'register',
    	component:register,
    	meta:{
	      	title:'注册',
//	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	      }
    },
    {
    	path:'/mycompany',
    	name:'mycompany',
    	component:myCompany,
    	meta:{
	      	title:'我的公司',
	      	requiresLogin:true,
//	      	requiresUser:true,
	      	requiresCompany:true
	      }
    },
    {
    	path:'/companylist',
    	name:'companylist',
    	component:companylist,
    	meta:{
	      	title:'公司列表',
//	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	      }
    },
    /*{
    	path:'/hotlist',
    	name:'hotlist',
    	component:hotlist,
    	meta:{
	      	title:'全国招聘第一站',
	      	requiresLogin:true,
	      	requiresUser:true,
	      	requiresCompany:true
	      }
    },*/
    {
    	path:'/resumepreview',
    	name:'resumepreview',
    	component:preview,
    	meta:{
	      	title:'预览简历',
	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	      }
    },
    {
    	path:'/myresume',
    	name:'myresume',
    	component:myresume,
    	meta:{
	      	title:'我的简历',
	      	requiresLogin:true,
	      	requiresUser:true,
//	      	requiresCompany:true
	      }
    },
    {
    	path:'/management',
    	name:'management',
    	component:management,
    	meta:{
	      	title:'公司管理',
	      	requiresLogin:true,
//	      	requiresUser:true,
	      	requiresCompany:true
	    },
    	redirect:'/management/pendingresume',
    	children:[
    		{path:'expiredposition',name:'expiredposition',component:expiredposition},
    		{path:'notifiedresume',name:'notifiedresume',component:notifiedresume},
    		{path:'pendingresume',name:'pendingresume',component:pendingresume},
    		{
    			path:'postposition',
    			name:'postposition',
    			component:postposition,
    			/*children:[
    				{
    					path:'success',
    					name:'postpositionsuccess',
    					component:postpositionsuccess
    				}
    			]*/
    		},
    		{
    					path:'success',
    					name:'postpositionsuccess',
    					component:postpositionsuccess
    		},
    		{path:'unsuitableresume',name:'unsuitableresume',component:unsuitableresume},
    		{path:'validposition',name:'validposition',component:validposition},
    		{path:'undeterminedresume',name:'undeterminedresume',component:undeterminedresume}
    	]
    },
    {
    	path:'/positiondetail',
    	name:'positiondetail',
    	component:positiondetail,
    	meta:{
	      	title:'职位详情',
//	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	    }
    },
    {
    	path:'/collection',
    	name:'collection',
    	component:collection,
    	meta:{
	      	title:'我的收藏',
	      	requiresLogin:true,
	      	requiresUser:true,
//	      	requiresCompany:true
	      }
    },
    {
    	path:'/positionlist',
    	name:'positionlist',
    	component:positionlist,
    	meta:{
	      	title:'职位列表',
//	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	    }
    },
    {
    	path:'/companydetail',
    	name:'companydetail',
    	component:companydetail,
    	meta:{
	      	title:'公司详情',
//	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	     },
    	redirect:"/companydetail/company_home",
    	children:[
    		{
    			path:'company_home',
    			name:'company_home',
    			component:companyhome,
    			/*props:(route) => ({
    				id:route.query.companyid
    			})*/
    		},
    		{
    			path:'company_position',
    			name:'company_position',
    			component:companyposition,
    			/*props:(route) => ({
    				id:route.query.companyid
    			})*/
    		},
    		{
    			path:'company_product',
    			name:'company_product',
    			component:companyproduct,
    			/*props:(route) => ({
    				id:route.query.companyid
    			})*/
    		}
    	]
    },
    {
    	path:'/delivery',
    	name:'delivery',
    	component:delivery,
    	meta:{
	      	title:'我的投递',
	      	requiresLogin:true,
	      	requiresUser:true,
//	      	requiresCompany:true
	    },
    	redirect:'/delivery/all',
    	children:[
    		{
    			path:'all',
    			name:'all',
    			component:deliveryform
    		},
    		{
    			path:'interview',
    			name:'interview',
    			component:deliveryform
    		},
    		{
    			path:'improper',
    			name:'improper',
    			component:deliveryform
    		}
    	]
    },
    {
    	path:'/auth',
    	name:'auth',
    	component:auth,
    	meta:{
	      	title:'公司认证',
	      	requiresLogin:true,
//	      	requiresUser:true,
	      	requiresCompany:true
	    }
    },
    {
    	path:'/authsuccess',
    	name:'authsuccess',
    	component:authsuccess,
    	meta:{
	      	title:'公司认证',
	      	requiresLogin:true,
//	      	requiresUser:true,
	      	requiresCompany:true
	      }
    },
    {
    	path:'/about',
    	name:'about',
    	component:about,
    	meta:{
	      	title:'关于我们',
//	      	requiresLogin:true,
//	      	requiresUser:true,
//	      	requiresCompany:true
	      }
    },
    {
    	path:'/companyinfofillin',
    	name:'companyinfofillin',
    	component:companyinfofillin,
    	meta:{
	      	title:'完善公司信息',
	      	requiresLogin:true,
//	      	requiresUser:true,
	      	requiresCompany:true
	     },
    	redirect:'/companyinfofillin/step1',
    	children:[
	    	{
	    		path:'success',
	    		name:'success',
	    		component:companyinforfillinsuccess
	    	},
    		{
    			path:'step1',
    			name:'step1',
    			component:index1
    		},
    		{
    			path:'step2',
    			name:'step2',
    			component:index2
    		},
    		{
    			path:'step3',
    			name:'step3',
    			component:index3
    		},
    		{
    			path:'step4',
    			name:'step4',
    			component:index4
    		},
    		{
    			path:'step5',
    			name:'step5',
    			component:index5
    		}
    	]
    },
    {
    	path:'/setting',
    	name:'setting',
    	component:setting,
    	meta:{
	      	title:'我的设置',
	      	requiresLogin:true,
	      	requiresUser:true,
//	      	requiresCompany:true
	     },
    	redirect:'/setting/infosetting',
    	children:[
    		{
    			path:'pwdsetting',
    			name:'pwdsetting',
    			component:pwdsetting
    		},
    		{
    			path:'resumesetting',
    			name:'resumesetting',
    			component:resumesetting,
    			redirect:'/setting/resumesetting/online',
    			children:[
    				{
    					path:'attachment',
    					name:'attachment',
    					component:attachment
    				},
    				{
    					path:'online',
    					name:'online',
    					component:online
    				},
    			]
    		},
    		{
    			path:'infosetting',
    			name:'infosetting',
    			component:infosetting
    		}
    	]
    },
    {
    	path:'/personinfofillin',
    	name:'personinfofillin',
    	component:personinfofillin,
    	requiresLogin:true,
	    requiresUser:true,
//	    requiresCompany:true
    }
  ]
})

router.beforeEach((to,from,next) => {
	let isCompany = eval(store.state.isCompany())
	let isLogined = eval(store.state.isLogined())
	if(to.path === '/login' && isLogined){
		next({
			path:'/'
		})
	}
	else if(to.matched.some(record => record.meta.requiresLogin) && !isLogined){
		next({
			path:'/login'
		})
		Message({
			type:'warn',
			message:"请先登陆！",
			duration:1000
		})
	}
	else{
		if(to.matched.some(record => record.meta.requiresCompany)){
			if(!isCompany){
				next({
					path:'/error'
				})
				Message({
					type:'warn',
					message:"找不到页面！",duration:1000
				})
			}
			else if(isCompany){
				next()
			}
		}
		if(to.matched.some(record => record.meta.requiresUser)){
			if(isCompany){
				next({
					path:'/error'
				})
				Message({
					type:'warn',
					message:"找不到页面！",
					duration:1000
				})
			}
			else if(!isCompany){
				next()
			}
		}
		else{
			next()
		}
	}

	document.title = to.matched[0].meta.title
//	next()
})

export default router