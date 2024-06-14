<template>
  <headerCom :is-authenticated="isAuthenticated" />
  <div class="margin">
    <router-view :is-authenticated="isAuthenticated"></router-view>
  </div>
  <footerCom />
</template>

<script>
import headerCom from './components/headerComponent.vue';
import footerCom from './components/footerComponent.vue';

export default {
  name: 'App',
  components: {
    headerCom,
    footerCom
  },
  computed: {
    isAuthenticated() {
      return this.$store.state.isAuthenticated;
    }
  }
}
</script>


<style>
html {
  height: 100%;
  margin: 0;
  padding: 0;
}
body {
  margin: 70px 0 -170px;
  padding: 0;
}
html {
  scroll-behavior: smooth;
}
</style>
