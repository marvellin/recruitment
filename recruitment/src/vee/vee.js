import Vue from 'vue'
import VeeValidate, { Validator } from 'vee-validate';
import messages from 'vee-validate/dist/locale/zh_CN'
Validator.updateDictionary({
    zh_CN: {
        messages
    }
});
Validator.addLocale(messages)
Validator.extend('tel',{
	messages:{
		zh_CN:field => field + '手机号码必须为11位且以正确号段开头（如13、15等）',
	},
	validate:value => {
		return value.length == 11 && /^((13|14|15|17|18)[0-9]{1}\d{8})$/.test(value)
	}
})
const config = {
    errorBagName: 'errors', // change if property conflicts.
    delay: 0,
    locale: 'zh_CN',
    messages: null,
    strict: true,
    events: 'blur',
};
Vue.use(VeeValidate,config);
export default({})