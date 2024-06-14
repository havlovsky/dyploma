<template>
    <div class="login-container back-wh">
        <div class="login-form">
            <h2>Реєстрація</h2>
            <div class="registration-form-style">
                <form @submit.prevent="register" class="form-grid">
                <div class="form-group">
                    <input type="text" id="student-username" v-model="studentUsername" :class="{ 'input-field': true, 'error': !isValidUsername }" maxlength="20" placeholder="Введіть логін" @blur="clearRegistrationError"> 
                    <div v-if="!isValidUsername && studentUsername !== ''" class="error-message">Введіть коректний логін!</div>
                    <div v-if="registrationUserError" class="error-message">{{ registrationUserError }}</div>
                </div>
                <div class="form-group">
                    <input type="email" id="student-email" v-model="studentEmail" :class="{ 'input-field': true, 'error': !isValidEmail }" maxlength="60" placeholder="Введіть електронну адресу" @blur="clearRegistrationError">
                    <div v-if="!isValidEmail && studentEmail !== ''" class="error-message">Введіть дійсну адресу електронної пошти!</div>
                    <div v-if="registrationEmailError" class="error-message">{{ registrationEmailError }}</div>
                </div>
                <div class="form-group">
                  <input type="text" id="student-first-name" v-model="studentFirstName" :class="{ 'input-field': true, 'error': !isValidFirstName }" maxlength="60" placeholder="Введіть ім'я">
                  <div v-if="!isValidFirstName && studentFirstName !== ''" class="error-message">Введіть справжнє ім'я!</div>
                </div>
                <div class="form-group">
                  <input type="text" id="student-last-name" v-model="studentLastName" :class="{ 'input-field': true, 'error': !isValidLastName }" maxlength="60" placeholder="Введіть прізвище">
                  <div v-if="!isValidLastName && studentLastName !== ''" class="error-message">Введіть справжнє прізвище!</div>
                </div>
                <div class="form-group">
                    <input type="password" id="student-password" v-model="studentPassword" :class="{ 'input-field': true, 'error': !isValidPassword }" placeholder="Введіть пароль">
                    <div v-if="!isValidPassword && studentPassword !== ''" class="error-message">{{ passwordErrorMessage }}</div>
                </div>
                <div class="form-group">
                    <input type="password" id="student-confirm-password" v-model="studentConfirmPassword" :class="{ 'input-field': true, 'error': !isValidConfirmPassword }" placeholder="Підтвердіть обраний пароль">
                    <div v-if="!isValidConfirmPassword && studentConfirmPassword !== ''" class="error-message">Паролі не співпадають!</div>
                </div>
                <div class="form-actions gap-bot">
                    <button type="submit" class="register-button">Зареєструватись</button>
                </div>
                </form>
            </div>
            <div class="line"></div>
            <div class="have-account">Вже є акаунт? <a href="#/login">Увійти</a></div>
        </div>
    </div>
</template>
    
<script>
  import Swal from 'sweetalert2';
  import axios from 'axios';
  import zxcvbn from 'zxcvbn';
  
    export default {
      data() {
        return {
          studentUsername: '',
          studentPassword: '',
          studentConfirmPassword: '',
          studentEmail: '',
          studentFirstName: '',
          studentLastName: '',
          registrationUserError: '',
          registrationEmailError: '',
        };
      },
      computed: {
          isValidUsername() {
            if (!/[a-zA-Z]/.test(this.studentUsername)) {
              return false;
            }
            return /^[a-zA-Z0-9_]+$/.test(this.studentUsername);
          },
          isValidPassword() {
              const hasNumber = /\d/.test(this.studentPassword);
              const passwordResult = zxcvbn(this.studentPassword);
              return passwordResult.score >= 3 && hasNumber;
          },
          isValidConfirmPassword() {
            return this.studentPassword === this.studentConfirmPassword;
          },
          isValidFirstName() {
            return /^([А-ЩЬЮЯҐЄІЇ][а-щьюяґєії']{1,20})([-][А-ЩЬЮЯҐЄІЇ][а-щьюяґєії']{1,20}){0,2}$/.test(this.studentFirstName);
          },
          isValidLastName() {
              return /^([А-ЩЬЮЯҐЄІЇ][а-щьюяґєії']{1,20})([-][А-ЩЬЮЯҐЄІЇ][а-щьюяґєії']{1,20}){0,2}$/.test(this.studentLastName);
          },
          passwordErrorMessage() {
              if (this.studentPassword === '') {
                  return 'Введіть пароль!';
              } else if (this.studentPassword.length < 8) {
                  return 'Пароль має містити мінімум 8 символів!';
              } else if (!/\d/.test(this.studentPassword)) {
                  return 'Пароль має містити мінімум одне число!';
              } else if (zxcvbn(this.studentPassword).score < 3) {
                  return 'Пароль занадто легкий. Оберіть складніший!';
              } else {
                  return 'Введіть правильний пароль!';
              }
          },
          isValidEmail() {
            return /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[a-zA-Z]{2,}))?$/.test(this.studentEmail);
        },
        },
        methods: {
          clearRegistrationError() {
            this.registrationUserError = '';
            this.registrationEmailError = '';
          },
        register() {
          if (this.areFieldsEmpty()) {
            Swal.fire({
              icon: 'error',
              title: 'Помилка!',
              text: 'Введіть всі необхідні поля!'
            });
            return; 
          }
          if (this.isFormValid()) {
            const requestData = {
              "username": this.studentUsername,
              "password": this.studentPassword,
              "email": this.studentEmail,
              "first_name": this.studentFirstName,
              "last_name": this.studentLastName,
            };
            axios.post('http://127.0.0.1:8000/registration/', requestData)
            .then((response) => {
              if (response.data === 'Message: user register is success!') {
                Swal.fire({
                  icon: 'success',
                  title: 'Реєстрація успішна!',
                  text: 'Вас було успішно зареєстровано!',
                  confirmButtonText: 'Увійти в профіль'
                }).then(() => {
                  this.$router.push('/login');
                });
              } else if (response.data === "Error: username is already taken!") {
                this.registrationUserError = "Логін вже зайнятий!";
              } else if (response.data === "Error: email is already taken!") {
                this.registrationEmailError = "Електронна пошта вже зайнята!";
              } 
            })
            .catch(error => {
              console.error('Registration failed:', error);
              Swal.fire({
                icon: 'error',
                title: 'Помилка під час реєстрації!',
                text: 'Будь ласка, спробуйте зареєструватись пізніше!'
              });
            });
            } else {
              Swal.fire({
                icon: 'error',
                title: 'Помилка під час валідації!',
                text: 'Заповніть всі поля!'
              });
            }
          },
        areFieldsEmpty() {
          return (
            this.studentUsername === '' ||
            this.studentPassword === '' ||
            this.studentConfirmPassword === '' ||
            this.studentFirstName === '' ||
            this.studentLastName === '' ||
            this.studentEmail === ''
          );
        },
        isFormValid() {
          return (
            this.isValidUsername &&
            this.isValidPassword &&
            this.isValidConfirmPassword &&
            this.isValidFirstName &&
            this.isValidLastName &&
            this.isValidEmail
          );
        },
      }
    };
</script>

<style>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 85vh;
}
.back-wh {
  background-color: white;
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
.register-button {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  background-color: #FF8636;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
</style>