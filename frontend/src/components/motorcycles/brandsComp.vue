<template>
  <div class="links-container">
    <div class="motorcycle-list">
      <div v-for="motorcycleType in motorcycleTypes" :key="motorcycleType.id" class="motorcycle-item">
        <router-link :to="`/motorcycles/${motorcycleType.id}`" class="motorcycle-link">
          <img :src="getPhoto(motorcycleType)" :alt="motorcycleType.brand_name" class="motorcycle-image">
          <span class="motorcycle-name">{{ motorcycleType.brand_name }}</span>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'motorcycleLinks',
  data() {
    return {
      motorcycleTypes: []
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
        })
        .catch(error => {
          console.error('Error fetching motorcycle types:', error);
        });
    },
    getPhoto(motorcycles) {
      try {
        const photoPath = motorcycles.brand_image.split('/images/motorcycle_brand_images/')[1];
        const fileName = photoPath.split('/').pop();
        return require(`@/../../backend/images/motorcycle_brand_images/${fileName}`);
      } catch (error) {
        console.error('Error loading photo:', error);
        return '';
      }
    },
  }
};
</script>

<style scoped>
.links-container {
  display: flex;
  justify-content: center;
  margin: 120px 0 70px;
}

.motorcycle-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  max-width: 1200px;
  font-family: 'Noto Sans';
  font-size: 18px;
  font-weight: 600;
}

.motorcycle-item {
  position: relative;
  width: calc(33.33% - 10px);
  margin-bottom: 20px;
  overflow: hidden;
}

.motorcycle-link {
  text-decoration: none;
  color: #000;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: hidden;
}

.motorcycle-image {
  width: 250px;
  height: 250px;
  padding: 10px;
  object-fit: cover;
  margin-bottom: 20px;
  transition: transform 0.3s ease;
}

.motorcycle-name {
  display: block;
  text-align: center;
  margin-top: 10px;
  color: #FF8636;
}

.motorcycle-link:hover .motorcycle-name{
  color: black;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.motorcycle-link:hover .motorcycle-image {
  transform: scale(1.1);
}
</style>