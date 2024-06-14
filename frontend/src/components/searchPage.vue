<template>
  <div class="find-bar">
    <input type="text" v-model="searchModel" @input="handleInput" placeholder="Знайти байк..." ref="searchInput" class="search-sel" @click="showsearchMod = true">
    <ul v-if="showsearchMod" class="selects search-results">
      <router-link v-for="searchResult in searchResults" :to="`/motorcycle-info/${searchResult.id}`" :key="searchResult.id" class="product-items">
        <li @click="selectProduct(searchResult)">
          {{ searchResult.brand_name }} - {{ searchResult.motorcycle_model }} - {{ searchResult.model_years_of_production }}
        </li>
      </router-link>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      search: [],
      searchModel: "",
      showsearchMod: false,
      searchResults: [],
    };
  },
  mounted() {
    const motorcycles_info = this.$route.query.motorcycles_info;
    if (motorcycles_info) {
      this.searchResult = JSON.parse(motorcycles_info);
    } else {
      axios.get("http://127.0.0.1:8000/motorcycles_information/")
        .then((response) => {
          const motorcycles_info = response.data.full_motorcycles_information;
          this.search = motorcycles_info.flatMap(type => 
            type.motorcycles_info.map(motorcycle => ({
              ...motorcycle,
              brand_name: type.brand_name
            }))
          );
        })
        .catch((error) => {
          console.log(error);
        });
      this.handleInput();
      document.addEventListener('click', (event) => {
        if (!this.$refs.searchInput.contains(event.target)) {
          this.showsearchMod = false;
        }
      });
    }
  },
  methods: {
    async handleInput() {
      this.searchResults = [];
      let counter = 0;
      if (this.searchModel.length > 0) {
        const response = await axios.get("http://127.0.0.1:8000/motorcycles_information/");
        const motorcyclesData = response.data.full_motorcycles_information;
        const search = motorcyclesData.flatMap(type => 
          type.motorcycles_info.map(motorcycle => ({
            ...motorcycle,
            brand_name: type.brand_name
          }))
        );

        search.forEach(product => {
          if (counter >= 5) return;
          if (product.motorcycle_model.toLowerCase().includes(this.searchModel.toLowerCase()) || 
              product.brand_name.toLowerCase().includes(this.searchModel.toLowerCase())) {
            this.searchResults.push(product);
            counter++;
          }
        });
        this.showsearchMod = true;
      } else {
        this.showsearchMod = false;
      }
    },
    selectProduct(product) {
      localStorage.setItem('selectedProductId', product.id.toString());
      this.searchResults = [];
      this.$router.push(`/motorcycle-info/${product.id}`).then(() => {
        location.reload();
      });
    },
  },
};

</script>

<style>
.find-bar {
  position: relative;
}
.find-bar input {
  background-color: #fffaf5;
}
.search-sel {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 1px;
  padding: 12px;
  font-size: 16px;
  background-color: #fff0f0;
  width: 250px;
  box-shadow: 0 2px 4px;
  transition: background-color 0.3s ease;
}
.selects {
  margin: 0;
  padding: 0;
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #fff;
  border: 1px solid #ccc;
  border-top: none;
  border-radius: 0 0 5px 5px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  z-index: 1;
}
.search-results {
  display: flex;
  flex-direction: column;
}
.selects a {
  padding: 10px;
  width: 250px;
  cursor: pointer;
  list-style: none;
  border-bottom: 3px solid white;
}
.selects li {
  width: 250px;
  cursor: pointer;
}
.selects a:hover {
  background-color: #f5f5f5;
}
.selects a {
  text-decoration: none;
  color: #333;
}
</style>