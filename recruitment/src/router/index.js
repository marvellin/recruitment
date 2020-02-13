import Vue from 'vue'
import Router from 'vue-router'
import home from '@/components/home/home'
import login from '@/components/login&register/login/login'
import hotlist from '@/components/home/hotlist/hotlist'
import register from '@/components/login&register/register/register'
import myCompany from '@/components/company/myCompany'
import logoUpload from '@/components/company/logoUpload/logoUpload'
import myresume from '@/components/resume/resume'
//import resumeupload from '@/components/resume/resumeupload'
import preview from'@/components/resume/preview'
import companylist from '@/components/companylist/companylist'

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
    }
  ]
})
