// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'
import ElementUI from 'element-ui'
import {Message} from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import ViewUI from 'view-design'
import 'view-design/dist/styles/iview.css'
import VCharts from 'v-charts'
import VueQuillEditor from 'vue-quill-editor'

import '../static/css/colorbox.min.css';
import '../static/css/external.min.css';
import '../static/css/jiathis_share.css';
import '../static/css/popup.css';
import '../static/css/style.css';
import '../static/css/ui.css';
import '../static/css/window.css';

import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

Vue.config.productionTip = false

Vue.prototype.$axios = axios
Vue.use(VueAxios,axios)
Vue.use(ElementUI)
Vue.use(ViewUI)
Vue.use(VCharts)
Vue.use(VueQuillEditor)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  axios,
  components: { App },
  template: '<App/>'
})
