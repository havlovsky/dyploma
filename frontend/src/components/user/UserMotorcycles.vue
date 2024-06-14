<template>
  <div class="home-motorcycles">
    <div :class="['motorcycle-list', { 'single-item': motorcycle.length === 1 }]">
      <div class="list-mush">
        <div class="loading" v-if="loading">
          <img src="https://i.gifer.com/ZKZg.gif" alt="Loading...">
        </div>
        <div v-else class="margin-list">
          <div v-if="motorcycle.length > 0" class="motorcycle-item">
            <div class="motorcycle-container" :class="{ 'justify-center': motorcycle.length < 3 }">
              <div v-for="motorcycle in motorcycle" :key="motorcycle.id" class="motorcycle">
                <img :src="getPhoto(motorcycle)" :alt="motorcycle.motorcycle_name" class="img-motor">
                <h3>{{ motorcycle.motorcycle_model }}</h3>
                <div class="links-web">
                  <a :href="`#/motorcycle-info/${motorcycle.id}`" class="start-button">Докладніше</a>
                  <button @click="deletemotorcycleId(motorcycle.id)" class="delete-button">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="center-img" v-else>
            <img src="../../assets/motorbike-rider-crying.avif" alt="">
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';
import { mapGetters } from 'vuex';

export default {
  computed: {
    ...mapGetters(['isAuthenticated']),
  },
  data() {
    return {
      motorcycle: [],
      loading: true,
    };
  },
  async mounted() {
    this.token = this.$store.state.token;
    await this.fetchData();
  },
  methods: {
    async fetchData() {
      try {
        const token = this.$store.state.token;
        const profileResponse = await axios.get('http://127.0.0.1:8000/profile/', {
          headers: {
            Authorization: `Token ${token}`,
          },
        });
        const websiteInfo = profileResponse.data.motorcycles_id_list;
        const motorcyclesResponse = await axios.get('http://127.0.0.1:8000/motorcycles_information/');
        const motorcycles_info = motorcyclesResponse.data.full_motorcycles_information;
          this.search = motorcycles_info.flatMap(type => 
            type.motorcycles_info.map(motorcycle => ({
              ...motorcycle,
              brand_name: type.brand_name
            }))
          );


        this.motorcycle = this.search.filter(motorcycle => websiteInfo.includes(motorcycle.id));
        console.log(this.motorcycleFilter)

        this.loading = false;
      } catch (error) {
        console.error('Error:', error);
        this.loading = false;
      }
    },
    async deletemotorcycleId(motorcycleId) {
      try {
        const response = await axios.post('http://127.0.0.1:8000/delete_favorite_motorcycle/', {
          motorcycle_id: motorcycleId,
        }, {
          headers: {
            Authorization: `Token ${this.token}`,
          },
        });
        if (response.data === 'Favorite motorcycle successfully deleted!') {
          Swal.fire({
            icon: 'success',
            title: 'Мотоцикл був викинутий з гаража!',
            confirmButtonText: 'Ок',
          }).then(() => {
            this.fetchData(); 
          });
        } else if (response.data === "Deleting favorite motorcycle error!") {
          Swal.fire({
            icon: 'error',
            title: 'Мотоцикл залишився в гаражі!',
          });
        }
      } catch (error) {
        console.error('Error:', error);
        Swal.fire({
          icon: 'error',
          title: 'Мотоцикл залишився в гаражі!',
        });
      }
    },
    startmotorcycle(motorcycleId) {
      localStorage.setItem('id', motorcycleId);
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
  },
};
</script>

<style scoped>
.home-motorcycles {
  margin: 30px 0;
  padding: 40px 50px;
  text-align: center;
}
.motorcycle img {
  width: 100%;
  height: 210px;
  object-fit: cover;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  margin-bottom: 20px;
  transition: transform 0.3s ease;
}
.motorcycle-container {
  display: flex;
  flex-wrap: wrap;
  gap: 50px;
}

.motorcycle {
  width: calc(90% / 3);
  border: 1px solid #ddd;
  border-radius: 15px;
  overflow: hidden;
}

.motorcycle:hover .img-motor {
  transform: scale(1.1);
}

.justify-center {
  justify-content: center;
}

.start-button {
  padding: 10px 20px;
  font-size: 18px;
  text-decoration: none;
  border-radius: 5px;
  color:#333;
  transition: all 0.5s ease;
}
.start-button:hover {
  background-color: #FF8636;
  color: #fff;
}
.start-button i {
  margin-left: 5px;
}
.links-web {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.links-web a {
  width: 100%;
}
.delete-button {
  background-color: transparent;
  border: none;
  cursor: pointer;
  height: 42px;
}
.delete-button i {
  font-size: 25px;
  color: #000;
  transition: color 0.3s;
  margin: 0 7px;
}
.delete-button:hover i {
  color: #f00;
}
</style>