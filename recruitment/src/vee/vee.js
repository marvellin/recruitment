import Vue from 'vue'
import VeeValidate, { Validator } from 'vee-validate';
import messages from 'vee-validate/dist/locale/zh_CN'

const attributesCh = {
	temptation:'一句话介绍',
	label:'标签',
	select_industry:'行业领域',
	website:'公司网址',
	membername:'公司负责人姓名',
	memberposition:'公司负责人职位',
	memberintro:'公司负责人介绍',
	productname:'产品名称',
	companyProfile:'公司介绍',
	companyfullname:'公司全称',
	companyshortname:'公司简称',
	companycity:'公司所在地',
	select_scale:'公司规模',
	companystage:'公司融资阶段'
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
		zh_CN:field => field + '手机号码必须为11位且以正确号段开头（如13、15等）',
	},
	validate:value => {
		return value.length == 11 && /^((13|14|15|17|18)[0-9]{1}\d{8})$/.test(value)
	}
})
Validator.extend('companyfullname',{
	messages:{
		zh_CN:field => "公司全称不应带有标点符号"
	},
	validate:value => {
		const regex = /^[ A-Za-z0-9\u4e00-\u9fa5]+$/
		return regex.test(value)
	}
})
Validator.extend('companyshortname',{
	messages:{
		zh_CN:field => "公司简称不应带有标点符号"
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