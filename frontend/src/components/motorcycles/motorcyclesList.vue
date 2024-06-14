<template>
  <div class="margin-list">
    <div v-for="motorcycles in motorcycles" :key="motorcycles.id" class="motorcycle-item">
      <router-link :to="`/motorcycle-info/${motorcycles.id}`" class="motorcycle-link">
        <img :src="getPhoto(motorcycles)" :alt="motorcycles.brand_name" class="motorcycle-image">
        <div class="motorcycle-info">
          <span class="motorcycle-name">{{ motorcycles.motorcycle_model }}</span><br/>
          <span class="motorcycle-year">{{ motorcycles.model_years_of_production }}</span>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'ListComp',
  data() {
    return {
      motorcycles: []
    };
  },
  created() {
    this.fetchmotorcycleTypes();
  },
  methods: {
    fetchmotorcycleTypes() {
      axios.get('http://127.0.0.1:8000/motorcycles_information/')
        .then(response => {
            this.motorcycleTypes = response.data.full_motorcycles_information;
            const currentPath = this.$route.path;
            const id = currentPath.split('/').pop();
            this.motorcycleTypes = this.motorcycleTypes.find(type => type.id.toString() === id.toString());
            this.motorcycles = this.motorcycleTypes.motorcycles_info;
        })
        .catch(error => {
          console.error('Error fetching motorcycle types:', error);
        });
    },
    getPhoto(motorcycles) {
      try {
        const photoPath = motorcycles.motorcycle_image.split('/images/motorcycle_images/')[1];
        const fileName = photoPath.split('/').pop();
        return require(`@/../../backend/images/motorcycle_images/${fileName}`);
      } catch (error) {
        console.error('Error loading photo:', error);
        return '';
      }
    },
  }
}
</script>

<style scoped>
.margin-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  max-width: 1400px;
  margin: 120px auto 90px;
  font-family: 'Noto Sans';
}

.motorcycle-item {
  border-radius: 15px;
  position: relative;
  width: calc(33.33% - 20px);
  margin: 10px 0;
  overflow: hidden;
}

.motorcycle-link {
  text-decoration: none;
  color: #000; 
  display: block;
  position: relative;
  overflow: hidden;
}

.motorcycle-image {
  width: 100%;
  height: 250px;
  object-fit: cover;
  display: block;
  transition: transform 0.3s ease;
}

.motorcycle-info {
  background-color: rgba(0, 0, 0, 0.5);
  padding: 10px;
  text-align: center;
  transition: transform 0.3s ease;
  color: #ffffff;
}

.motorcycle-link:hover .motorcycle-info {
  color: #ffffff;
  background-color: #FF8636;
}
</style>
