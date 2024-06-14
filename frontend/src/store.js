import { createStore } from 'vuex';
import axios from 'axios';

export default createStore({
  state: {
    token: '',
    isAuthenticated: false,
  },
  mutations: {
    setToken(state, token) {
      state.token = token;
      state.isAuthenticated = true;
      localStorage.setItem('auth_token', token);
    },
    removeToken(state) {
      state.token = '';
      state.isAuthenticated = false;
      localStorage.removeItem('auth_token');
    },
    initializeStore(state) {
      const token = localStorage.getItem('auth_token');
      if (token) {
        state.token = token;
        state.isAuthenticated = true;
      } else {
        state.isAuthenticated = false;
      }
    },
  },
  getters: {
    isAuthenticated: (state) => state.isAuthenticated,
  },
  actions: {
    fetchUser({ commit }) {
      const token = localStorage.getItem('auth_token');
      if (token) {
        commit('setToken', token);
        axios
          .get('/profile', {
            headers: {
              Authorization: `Token ${token}`,
            },
          })
          .then(() => {
            commit('initializeStore');
          })
          .catch(() => {
            commit('removeToken');
          });
      }
    },
  },
  modules: {},
});
