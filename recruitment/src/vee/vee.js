import Vue from 'vue'
import VeeValidate, { Validator } from 'vee-validate';
import messages from 'vee-validate/dist/locale/zh_CN'

const attributesCh = {
	loginemail:'登陆邮箱',
	password:'密码',
	temptation:'一句话介绍',
	label:'标签',
	select_industry:'行业领域',
	website:'公司网址',
	membername:'公司负责人姓名',
	memberposition:'公司负责人职位',
	memberintro:'公司负责人介绍',
	productname:'产品名称',
	companyProfile:'公司介绍',
	companyName:'公司名称',
	companyfullname:'公司全称',
	companyshortname:'公司简称',
	companycity:'公司所在地',
	select_scale:'公司规模',
	companystage:'公司融资阶段',
	confirmpassword:'确认密码',
	expectPosition:'期望职位',
	posttype:'职位类别',
	positionName:'职位名称',
	department:'所属部门',
	select_expectSalary:'期望月薪',
	salaryMax:'最高月薪',
	salaryMin:'最低月薪',
	workAddress:'工作城市',
	select_expectCity:'期望城市',
	workexperience:'工作经验',
	select_education:'学历要求',
	positionAdvantage:'职位诱惑',
	positionAddress:'工作地址',
	interviewaddress:'面试地点',
	hrtel:'HR联系方式',
	tel:'联系方式',
	stageorg:'投资机构名称',
	articleTitle:'新闻标题',
	articleUrl:'新闻链接',
	username_s:'个人姓名',
	select_currentState:'目前状态',
	select_workyear:'工作经验',
	degreemax:'最高学历',
	resumeName:'简历名称',
	projectName:'项目名称',
	thePost:'项目职务',
	projectDescription:'项目描述',
	schoolName:'学校名称',
	select_degree:'学历',
	professionalName:'专业名称',
	rank:'专业排名',
	selfDescription:'自我介绍'
//	editor:'职位描述',
}
Validator.updateDictionary({
    zh_CN: {
        messages:messages,
        attributes:attributesCh
    }
});

/*VeeValidator.localize('zh_CN',{
	messages:messages,
	attributes:attributesCh
})*/

/*Validator.updateDictionary({
    zh_CN: {
        messages
    }
});*/

Validator.addLocale(messages)
Validator.extend('tel',{
	messages:{
		zh_CN:field => field + '应为11位且以正确号段开头电话号码（如13、15等）',
	},
	validate:value => {
		return value.length == 11 && /^((13|14|15|17|18)[0-9]{1}\d{8})$/.test(value)
	}
})
Validator.extend('companyfullname',{
	messages:{
		zh_CN:field => field + "不应带有标点符号"
	},
	validate:value => {
		const regex = /^[ A-Za-z0-9\u4e00-\u9fa5]+$/
		return regex.test(value)
	}
})
Validator.extend('companyshortname',{
	messages:{
		zh_CN:field => field + "不应带有标点符号"
	},
	validate:value => {
		const regex = /^[ A-Za-z0-9\u4e00-\u9fa5]+$/
		return regex.test(value)
	}
})
Validator.extend('website',{
	messages:{
		zh_CN:field => "网址格式错误,请输入网址完整链接"
	},
	validate:value => {
		const regex = /^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+/
		return regex.test(value)
	}
})
Validator.extend('industry',{
	messages:{
		zh_CN:field => "行业领域不应带有标点符号"
	},
	validate:value => {
		const regex = /^[ A-Za-z0-9\u4e00-\u9fa5]+$/
		return regex.test(value)
	},
})
Validator.extend('membername',{
	messages:{
		zh_CN:field => field + '不应带有标点符号或数字'
	},
	validate:value => {
		const regex = /^[ A-Za-z\u4e00-\u9fa5]+$/
		return regex.test(value)
	}
})
Validator.extend('nosymbol',{
	messages:{
		zh_CN:field => field + '不应带有标点符号'
	},
	validate:value => {
		const regex = /^[ A-Za-z0-9\u4e00-\u9fa5]+$/
		return regex.test(value)
	}
})
Validator.extend('nosymbol&number',{
	messages:{
		zh_CN:field => field + '不应带有标点符号或数字'
	},
	validate:value => {
		const regex = /^[ A-Za-z\u4e00-\u9fa5]+$/
		return regex.test(value)
	}
})
Validator.extend('password',{
	messages:{
		zh_CN:field => field + "必须包含数字、字母和特殊符号"
	},
	validate:value => {
//		const regex = /^(?![A-Za-z0-9]+$)(?![a-z0-9\\W]+$)(?![A-Za-z\\W]+$)(?![A-Z0-9\\W]+$)[a-zA-Z0-9\\W]{8,}$/
//		const regex = /^(?![A-Za-z0-9]+$)(?![a-z0-9\\W]+$)(?![A-Za-z\\W]+$)(?![A-Z0-9\\W]+$)[a-zA-Z0-9\\W]$/

		const regex = /^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$)(?![0-9a-z]+$)(?![0-9A-Z]+$)(?![0-9a-zA-Z]+$)^.{8,20}$/	
		return regex.test(value)
	}
})

Validator.extend('username',{
	messages:{
		zh_CN:field => field + '只能为英文名(不超过20字符)或中文名(不少于2字符且不超过10字符)，不能带有数字和特殊符号'
	},
	validate:value => {
//		const regex = /[a-zA-Z. ]{1,20}|[\u4e00-\u9fa5]{2,10}/
		const regex = /^([\u4e00-\u9fa5]{2,20}|[a-zA-Z. ]{2,20})$/ 
		return regex.test(value)
	}
})
/*Validator.extend('editorrequired',{
	messages:{
		zh_CN:field => field + '是必须的.'
	},
	validate:value => {
		if(value === undefined || value === null || value === ''){
			return false
		}
		else{
			return true
		}
	}
})*/
/*Validator.extend('',{
	messages:{
		zh_CN:field => 
	},
	validate:value => {
		return
	}
})*/
const config = {
    errorBagName: 'errors', // change if property conflicts.
    delay: 100,
    locale: 'zh_CN',
    messages: null,
    strict: true,
    events: 'blur|input',
};
Vue.use(VeeValidate,config);
export default({})