<template>
  <footer class="footer">
    <div class="footer-cont"  v-if="vintageInfo.length">
        <div class="footer-left">
            <span>&copy; Copyright 2024, VintageMotoHub. All Right Reserved.</span>
            </div>
            <div class="footer-right">
              <a :href="vintageInfo[0].facebook" class="social-link" target="_blank"><i class="fa-brands fa-facebook"></i></a>
              <a :href="vintageInfo[0].instagram" class="social-link" target="_blank"><i class="fa-brands fa-instagram"></i></a>
              <a :href="vintageInfo[0].linkedin" class="social-link" target="_blank"><i class="fa-brands fa-linkedin"></i></a>
            </div>
    </div>
  </footer>
</template>

<script>
import axios from 'axios';

export default {
  data() {
      return {
          vintageInfo: []
      };
  },
  async mounted() {
      try {
          const response = await axios.get('http://127.0.0.1:8000/moto_hub_information/');
          this.vintageInfo = response.data.moto_hub_information;
      } catch (error) {
          console.error('Error fetching handbook information:', error);
      }
  },
};
</script>

<style>
.footer {
  padding: 20px;
  color: #FF8636;
  border-top: 3px solid #FF8636;
}
.footer-cont {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 1500px;
  margin: 0 auto;
}
.footer-left {
  display: flex;
  align-items: center;
  font-family: 'Roboto';
  font-size: 18px;
  font-weight: 600;
}
.footer-left a {
  margin: 0 10px;
  text-decoration: none;
}
.footer-left a:hover {
  text-decoration: underline;
}
.footer-right {
  display: flex;
  font-size: 22px;
  gap: 15px;
}
.social-link {
  margin-right: 10px;
  text-decoration: none;
  color: #FF8636;
}
</style>
