<template>
  <div class="margin-list">
    <div v-for="motorcycle in motorcycleData" :key="motorcycle.id" class="motorcycle-item">
      <div class="motorcycle-content-back">
        <div class="motorcycle-content">
          <div class="motorcycle-image-container">
            <img :src="getPhoto(motorcycle)" :alt="motorcycle.brand_name" class="motorcycle-image">
          </div>
          <div class="motorcycle-details">
            <h3 class="motorcycle-model">{{ motorcycle.brand_name }} - {{ motorcycle.motorcycle_model }}</h3>
            <div class="motorcycle-specs">
              <div class="button-center">
                <div v-if="isAuthenticated" @click="sendIdToServer(motorcycle.id)" class="button-with-image">
                  <img src="../../assets/like.png" alt="Like">
                </div>
              </div>
              <p class="motorcycle-info"><strong>Роки виробництва:</strong> {{ motorcycle.model_years_of_production }}</p>
              <p class="motorcycle-info"><strong>Об'єм двигуна:</strong> {{ motorcycle.engine_capacity }}</p>
              <p class="motorcycle-info"><strong>Тип двигуна:</strong> {{ motorcycle.engine_type }}</p>
              <p class="motorcycle-info"><strong>Потужність:</strong> {{ motorcycle.engine_hp }}</p>
              <p class="motorcycle-info"><strong>Тип охолодження:</strong> {{ motorcycle.cooling_system_type }}</p>
              <p class="motorcycle-info"><strong>Кількість передач:</strong> {{ motorcycle.number_of_gears }}</p>
              <p class="motorcycle-info"><strong>Ємність паливного бака:</strong> {{ motorcycle.fuel_tank_capacity }}</p>
              <p class="motorcycle-info"><strong>Вага:</strong> {{ motorcycle.weight }}</p>
            </div>
          </div>
        </div>
        <p class="motorcycle-infos" v-html="replaceNewlinesWithBr(motorcycle.motorcycle_description)"></p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';

export default {
  name: 'motorcycleInfo',
  props: ['isAuthenticated'],
  data() {
    return {
      motorcycleData: []
    };
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
    fetchmotorcycleTypes() {
      axios.get('http://127.0.0.1:8000/motorcycles_information/')
        .then(response => {
          const motorcycles_info = response.data.full_motorcycles_information;
          const searchResults = motorcycles_info.flatMap(type => 
            type.motorcycles_info.map(motorcycle => ({
              ...motorcycle,
              brand_name: type.brand_name
            }))
          );
          const currentPath = this.$route.path;
          const id = currentPath.split('/').pop();
          this.motorcycleData = searchResults.filter(motorcycle => motorcycle.id.toString() === id.toString());
          
        })
        .catch(error => {
          console.error('Error fetching motorcycle types:', error);
        });
    },
    getPhoto(motorcycle) {
      try {
        const photoPath = motorcycle.motorcycle_image.split('/images/motorcycle_images/')[1];
        const fileName = photoPath.split('/').pop();
        return require(`@/../../backend/images/motorcycle_images/${fileName}`);
      } catch (error) {
        console.error('Error loading photo:', error);
        return '';
      }
    },
    sendIdToServer(id) {
      const token = this.$store.state.token;
      const requestData = {
        "motorcycle_id": id,
      };

      axios.post('http://127.0.0.1:8000/add_favorite_motorcycle/', requestData, {
        headers: {
          Authorization: `Token ${token}`,
        },
      })
      .then((response) => {
        if (response.data === 'Favorite motorcycle successfully added!') {
          Swal.fire({
            icon: 'success',
            title: 'Мотоцикл був завезений в гараж!',
            confirmButtonText: 'Ок'
          }).then(() => {
            this.$router.push('/profile');
          });
        } else if (response.data === "This motorcycle is already in the list of favorites!") {
          Swal.fire({
            icon: 'warning',
            title: 'Даний мотоцикл вже є в гаражі!',
          });
        } else if (response.data === "Adding favorite motorcycle error!") {
          Swal.fire({
            icon: 'error',
            title: 'Мотоцикл був викинутий з гаража!',
          }).then(() => {
            window.location.reload();
          });
        }
      })
      .catch(error => {
        console.error('Registration failed:', error);
        Swal.fire({
          icon: 'error',
          title: 'Помилка під час додавання!',
        });
      });
    },
    replaceNewlinesWithBr(text) {
      return text.replace(/\n/g, '<br>');
    }
  },
  mounted() {
    this.fetchmotorcycleTypes();
  },
  watch: {
    '$route': 'fetchmotorcycleTypes'
  }
};
</script>


<style scoped>
.button-with-image img {
  width: 80px;
}

.button-with-image {
  background-color: none;
  cursor: pointer;
  width: 80px;
  border-radius: 20px;
}

.button-with-image:hover {
  background-color: wheat;
}

body {
  font-family: 'Roboto', sans-serif;
  background-color: #1a1a1a;
  color: #f4f4f4;
  margin: 0;
  padding: 0;
}

.margin-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  max-width: 1200px;
  margin: 100px auto 40px;
  gap: 140px;
  padding: 20px 0;
  align-items: center;
}

.motorcycle-item {
  width: 100%;
  background: #2e2e2e;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  display: flex;
  align-items: center;
  padding: 20px;
}

.motorcycle-item:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
}

.motorcycle-content {
  display: flex;
  align-items: center;
  width: 100%;
  padding: 20px;
}

.motorcycle-image-container {
  flex: 0 0 700px;
  margin-right: 20px;
  overflow: hidden;
  border-radius: 10px;
}

.motorcycle-image {
  width: 100%;
  height: auto;
  transition: transform 0.3s ease;
}

.motorcycle-item:hover .motorcycle-image {
  transform: scale(1.1);
}

.motorcycle-details {
  flex: 1;
  padding: 20px;
  font-family: 'Noto Sans';
  line-height: 130%;
}

.motorcycle-model {
  font-size: 24px;
  font-weight: bold;
  color: #FF8636;
  margin-bottom: 10px;
}

.motorcycle-specs {
  margin-bottom: 15px;
}

.motorcycle-info {
  font-size: 16px;
  margin: 2px 0;
  color: #ccc;
  font-family: 'Noto Sans';
  line-height: 130%;
}

.motorcycle-infos {
  font-size: 16px;
  margin: 2px 0;
  color: #ccc;
  font-family: 'Noto Sans';
  line-height: 160%;
  padding: 20px;
  text-align: justify;
}

.motorcycle-description {
  font-size: 16px;
  line-height: 1.5;
  color: #ddd;
}
</style>