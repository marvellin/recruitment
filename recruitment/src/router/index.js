import Vue from 'vue'
import Router from 'vue-router'
import home from '@/components/home/home'
import login from '@/components/login&register/login/login'
import hotlist from '@/components/home/hotlist/hotlist'
import register from '@/components/login&register/register/register'
import myCompany from '@/components/mycompany/myCompany'
//import logoUpload from '@/components/mycompany/logoUpload/logoUpload'
import myresume from '@/components/resume/resume'
//import resumeupload from '@/components/resume/resumeupload'
import preview from'@/components/resume/preview'
import companylist from '@/components/companylist/companylist'
import postjob from '@/components/mycompany/postjob/create'
import management from '@/components/mycompany/management/index'
import expiredposition from '@/components/mycompany/management/exporedposition/exporedposition'
import notifiedresume from '@/components/mycompany/management/notifiedresume/notifiedresume'
import pendingresume from '@/components/mycompany/management/pendingresume/pendingresume'
import postposition from '@/components/mycompany/management/postposition/postposition'
import unsuitableresume from '@/components/mycompany/management/unsuitableresume/unsuitableresume'
import validposition from '@/components/mycompany/management/validposition/validposition'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      redirect:'/home',
      component: home
    },
    {
    	path:'/home',
    	name:'home',
    	component:home
    },
    {
    	path:'/login',
    	name:'login',
    	component:login
    },
    {
    	path:'/register',
    	name:'register',
    	component:register
    },
    {
    	path:'/mycompany',
    	name:'mycompany',
    	component:myCompany,
    },
    {
    	path:'/companylist',
    	name:'companylist',
    	component:companylist
    },
    {
    	path:'/hotlist',
    	name:'hotlist',
    	component:hotlist
    },
    {
    	path:'/resumepreview',
    	name:'resumepreview',
    	component:preview,
    },
    {
    	path:'/myresume',
    	name:'myresume',
    	component:myresume,
    },
    {
    	path:'/postjob',
    	name:'postjob',
    	component:postjob
    },
    {
    	path:'/management',
    	name:'management',
    	component:management,
    	children:[
    		{path:'expiredposition',name:'expiredposition',component:expiredposition},
    		{path:'notifiedresume',name:'notifiedresume',component:notifiedresume},
    		{path:'pendingresume',name:'pendingresume',component:pendingresume},
    		{path:'postposition',name:'postposition',component:postposition},
    		{path:'unsuitableresume',name:'unsuitableresume',component:unsuitableresume},
    		{path:'validposition',name:'validposition',component:validposition}
    	]
    }
  ]
})
