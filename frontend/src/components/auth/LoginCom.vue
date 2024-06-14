<template>
  <div class="login-container">
    <div class="login-form">
      <h2>Вхід</h2>
      <form @submit.prevent="submitForm">
        <div class="form-group">
          <input type="text" id="login-username" v-model="username" :class="{ 'input-field': true, 'error': !isValidUsername }" placeholder="Введіть логін">
          <div class="error-message" v-if="showUsernameError">{{ usernameErrorMessage }}</div>
        </div>
        <div class="form-group">
          <input type="password" id="login-password" v-model="password" class="input-field" placeholder="Введіть пароль">
          <div class="error-message" v-if="showPasswordError">{{ passwordErrorMessage }}</div>
        </div>
        <div class="form-actions gap-bot">
          <button type="submit" @click="login" class="login-button">Увійти</button>
        </div>
      </form>
      <div class="line"></div>
      <div class="have-account">Немає аккаунту? <a href="#/register">Реєстрація</a></div>
    </div>
  </div>
</template>

<script>
import Swal from 'sweetalert2';
import axios from 'axios';

export default {
  mounted() {
    if (localStorage.getItem('auth_token')) {
      localStorage.removeItem('auth_token');
      window.location.reload();
    }
  },
  data() {
    return {
      username: "",
      password: "",
      showUsernameError: false,
      showPasswordError: false,
      usernameErrorMessage: "Логін порожній",
      passwordErrorMessage: "Пароль порожній"
    };
  },
  computed: {
    isValidUsername() {
      return /^[a-zA-Z0-9_]+$/.test(this.username);
    }
  },
  methods: {
    login() {
      this.showUsernameError = false;
      this.showPasswordError = false;
      
      if (!this.username && !this.password) {
        this.showUsernameError = true;
        this.showPasswordError = true;
        return;
      } else if (!this.username) {
        this.showUsernameError = true;
        return;
      } else if (!this.password) {
        this.showPasswordError = true;
        return;
      } 
    },
    submitForm() {
      const formData = {
        username: this.username,
        password: this.password
      }
      if (this.isValidUsername) {
      axios
          .post('http://127.0.0.1:8000/authorization/token/login', formData)
          .then((response) => {
            const token = response.data.auth_token;
            this.$store.commit('setToken', token);
            axios.defaults.headers.common['Authorization'] = "Token " + token;
            localStorage.setItem('auth_token', token);

            if (response.status === 200) {
              Swal.fire({
                title: "Вітаю!",
                text: "Ви ввійшли в профіль!",
                icon: "success",
              }).then(() => {
                this.$router.push('/profile')});
            } else {
              Swal.fire({
                icon: 'error',
                text: 'Не вірний логін або пароль!'
              });
            }
          })
          .catch(error => {
            console.error('Login failed:', error);
            Swal.fire({
              text: "Не вірний логін або пароль!",
              icon: "error",
            });
          });
      } else {
        Swal.fire({
          title: "Помилка",
          text: "Введіть правильний логін або пароль!",
          icon: "error",
        });
      }
    },
  },
};
</script>

<style>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 85vh;
}
.login-form {
  width: 400px;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.login-form h2 {
  text-align: center;
  margin-bottom: 20px;
}
.form-group {
  margin-bottom: 20px;
}
.form-group label {
  display: block;
  margin-bottom: 5px;
}
.input-field {
  width: 95%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
.error-message {
  color: red;
  margin-top: 5px;
}
.form-actions {
  text-align: center;
}
.login-button {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  background-color: #FF8636;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
.line {
  margin-top: 20px;
  border-top: 1px solid #ccc;
}
.have-account {
  text-align: center;
  margin-top: 20px;
}

.have-account router-link {
  color: #1B6A19;
  text-decoration: none;
}
</style>