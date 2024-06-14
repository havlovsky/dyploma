<template>
  <header>
    <nav>
      <div class="left-text">
        <a href="#/"><p class="header-title">VintageMotoHub</p></a>
        <div class="search-center">
          <searchPage />
        </div>
        <div class="right-side">
          <ul>
            <li :class="{ active: isActive('/motorcycle-brands') } "><a href="#/motorcycle-brands">Мотоцикли</a></li> 
            <li :class="{ active: isActive('/contacts') }"><a href="#/contacts">Контакти</a></li> 
            <li v-if="!isAuthenticated"><a href="#/login" class="button-link">Увійти</a></li>
            <li v-if="isAuthenticated"><a href="#/profile" class="profile"><i class="fa-solid fa-user"></i> Мій профіль</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>  
import searchPage from './searchPage.vue';
import axios from 'axios';

export default {
  props: ['isAuthenticated'],
  components: {
    searchPage
  },
  methods: {
    parseData(data) {
      const parsedData = {};
      data[0].forEach(item => {
        const [key, value] = item.split(':').map(str => str.trim());
        parsedData[key] = value;
      });
      return parsedData;
    },
    isActive(link) {
      return this.$route.path === link;
    },
  },
  mounted() {
    const token = this.$store.state.token;
    axios
      .get('http://127.0.0.1:8000/profile', {
        headers: {
          Authorization: `Token ${token}`,
        },
      })
      .then(response => {
        this.responseData = response.data;
        const info = this.parseData(this.responseData);
        this.userType = info.user_type; 
        this.$emit('update:isAuthenticated', true);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  },
}
</script>


<style>
.search-center {
  display: flex;
  margin: 0 auto;
}
header {
  background-color: #fff;
  margin: 0 auto;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1000;
  border-bottom: 3px solid #FF8636;
  height: 70px;
}
.header-title {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  width: 400px;
  font-size: 40px;
  line-height: 60px;
  text-transform: capitalize;
  background: linear-gradient(181.05deg, #FF8636 0.9%, #000000 294.55%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  text-fill-color: transparent;
}
nav {
  margin: 0 100px;
  display: flex;
  align-items: center;
  height: 70px;
  justify-content: center;
}
.left-text {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  height: 70px;
}
.right-side {
  display: flex;
  align-items: center;
}
.left-text ul, .right-side ul {
  list-style-type: none;
  padding: 0;
}
.left-text li, .right-side li {
  display: inline;
  margin-right: 60px;
}
ul li:last-child {
  margin-right: 0;
}
.left-text a {
  text-decoration: none;

}
.right-side a, .profile {
  text-decoration: none;
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 18px;
  line-height: 29px;
  text-transform: capitalize;
  color: #444444;
  transition: all 0.1s ease;
  padding: 7px 10px;
}
.right-side a:hover, .profile:hover {
  border-bottom: 3px solid #FF8636;
}
.profile i {
  color: white;
  background: black;
  padding: 10px;
  font-size: 15px;
  border-radius: 100%;
}
ul li img {
  width: 250px; 
  height: 50px;
  object-fit: cover;
  vertical-align: middle;
}
.active a {
  border-bottom: 3px solid #FF8636;
}
</style>
