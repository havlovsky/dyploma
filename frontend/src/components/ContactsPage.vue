<template>
  <section class="background-section">
      <div class="contacts-container" v-if="vintageInfo.length">
          <div class="contacts-left">
              <p class="contacts-title">{{ vintageInfo[0].moto_hub_name }}</p>
              <div class="contacts-phones">
                  <p class="contacts-name">Контактна інформація:</p>
                  <a :href="'tel:' + formatPhoneNumber(vintageInfo[0].phone_number)">Тел.: {{ formatPhoneNumber(vintageInfo[0].phone_number) }}</a>
                  <a :href="'mailto:' + vintageInfo[0].email">E-mail: {{ vintageInfo[0].email }}</a>
                  <div class="flex-links">
                      <a :href="vintageInfo[0].facebook" class="footer__social-link" target="_blank"><i class="fa-brands fa-facebook"></i></a>
                      <a :href="vintageInfo[0].instagram" class="footer__social-link" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                      <a :href="vintageInfo[0].linkedin" class="footer__social-link" target="_blank"><i class="fa-brands fa-linkedin"></i></a>
                  </div>
                  <div class="contacts-address">
              <p class="contacts-name">Адреса:</p>
              <p>{{ vintageInfo[0].address }}</p>
            </div>
            <div class="contacts-schedule">
              <p class="contacts-name">Години роботи:</p>
              <p>{{ vintageInfo[0].working_days_schedule }}</p>
              <p>{{ vintageInfo[0].saturday_schedule }}</p>
              <p>{{ vintageInfo[0].sunday_schedule }}</p>
            </div>
              </div>
          </div>
          <div>
            
          </div>
          <div class="contacts-right">
              <div>
                <iframe
                  width="600"
                  height="500"
                  style="border:0"
                  loading="lazy"
                  allowfullscreen
                  referrerpolicy="no-referrer-when-downgrade"
                  :src="vintageInfo[0].google_map">
                </iframe>
              </div>
          </div>
      </div>
  </section>
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
  methods: {
      formatPhoneNumber(phoneNumber) {
          return `${phoneNumber.slice(0, 3)} (${phoneNumber.slice(3, 6)}) ${phoneNumber.slice(6, 9)}-${phoneNumber.slice(9, 11)}-${phoneNumber.slice(11)}`
      }
  }
};
</script>

<style>
.contacts-container {
    font-family: 'Jost';
    display: flex;
    justify-content: center;
    align-items: center;
    height: 65vh;
}
.flex-links {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 25px;
  margin-top: 10px;
}
.flex-links a i {
  font-size: 25px;
  color: #5e5e5e;
}
#map {
  height: 400px;
  width: 500px;
}
.marker-icon {
font-size: 28px;
}
.contacts-left {
  font-size: 18px;
  font-family: 'Noto Sans';
  font-style: normal;
  font-weight: 400;
  line-height: 120%;
  color: #5e5e5e;
}
.contacts-container {
  line-height: 1.4;
  width: 1200px;
  margin: 50px auto 180px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.contacts-title {
  font-weight: 600;
  font-size: 30px;
  margin: 0;
  margin-bottom: 25px;
}
.contacts-name {
  font-weight: 600;
  font-size: 18px;
  margin: 10px 10px 20px;
}
.contacts-addr {
  width: 253px;
}
.contacts-sch {
  width: 150px;
}
.contacts-phones {
  display: flex;
  flex-direction: column;
}
.contacts-phones a {
  margin-bottom: 15px;
  text-decoration: none;
  color: #5e5e5e;
}
.contacts-right {
  margin-left: 50px;
}
</style>