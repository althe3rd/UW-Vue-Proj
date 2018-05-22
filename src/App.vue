<template>
  <div id="app">

    <Slides />

    <div class="sideBar">
      <BusSchedule />
      <Weather />
    </div>

  </div>
</template>

<script>
import Slides from "./components/Slides.vue";
import BusSchedule from "./components/BusSchedule.vue";
import Weather from "./components/Weather.vue";

export default {
  name: "app",
  components: {
    Slides,
    BusSchedule,
    Weather
  }
};
</script>

<style lang="scss">
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.sideBar {
  position: fixed;
  top: 0px;
  right: 0px;
  height: 100%;
  width: 30%;
  z-index: 10;
  color: #fff;
  background: rgba(0, 0, 0, 0.6);
}
</style>
