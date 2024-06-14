import { createRouter, createWebHashHistory } from 'vue-router';

import MainPage from './components/MainComponent.vue';
import Contacts from './components/ContactsPage.vue';
import brandsComp from './components/motorcycles/brandsComp.vue';
import motorcyclesList from './components/motorcycles/motorcyclesList.vue';
import motorcycleInfo from './components/motorcycles/motorcycleInfo.vue';
import Login from './components/auth/LoginCom.vue';
import Register from './components/auth/RegisterCom.vue';
import Profile from './components/user/ProfileCom.vue';
import store from './store';

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    { path: '/', component: MainPage },
    { path: '/contacts', component: Contacts },
    { path: '/motorcycle-brands', component: brandsComp },
    { path: '/motorcycles/:id', component: motorcyclesList },
    { path: '/motorcycle-info/:id', component: motorcycleInfo },
    { path: '/login', component: Login },
    { path: '/register', component: Register },
    { path: '/profile', component: Profile, meta: { requiresAuth: true } },
  ]
});

router.beforeEach((to, from, next) => {
  const isAuthenticated = store.state.isAuthenticated;

  if (to.matched.some((record) => record.meta.requiresAuth) && !isAuthenticated) {
    next('/login');
  } else {
    next();
  }
  
});

router.afterEach(() => {
  window.scrollTo(0, 0);
});

export default router;