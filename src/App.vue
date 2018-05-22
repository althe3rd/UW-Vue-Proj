<template>
  <div id="app">
    <img src="./assets/logo.png" class="logo" alt="University of Wisconsin News" />

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
/* Verlag Black */
@font-face {
  font-family: "Verlag-Black";
  src: url("./assets/VerlagBlack.eot");
  src: url("./assets/VerlagBlack.eot") format("embedded-opentype"),
    url("./assets/VerlagBlack.woff2") format("woff2"),
    url("./assets/VerlagBlack.woff") format("woff"),
    url("./assets/VerlagBlack.ttf") format("truetype"),
    url("./assets/VerlagBlack.svg#VerlagBlack") format("svg");
}

/* Verlag Book */
@font-face {
  font-family: "Verlag-Book";
  src: url("./assets/VerlagBook.eot");
  src: url("./assets/VerlagBook.eot") format("embedded-opentype"),
    url("./assets/VerlagBook.woff2") format("woff2"),
    url("./assets/VerlagBook.woff") format("woff"),
    url("./assets/VerlagBook.ttf") format("truetype"),
    url("./assets/VerlagBook.svg#VerlagBook") format("svg");
}

@font-face {
  font-family: "Verlag-Light";
  src: url("./assets/Verlag-Light.eot");
  src: url("./assets/Verlag-Light.eot") format("embedded-opentype"),
    url("./assets/Verlag-Light.woff") format("woff"),
    url("./assets/Verlag-Light.ttf") format("truetype"),
    url("./assets/Verlag-Light.svg#Verlag-Light") format("svg");
}

body {
  margin: 0px;
}

#app {
  font-family: "Verlag-Book", "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin: 0px;
  background: #000;
  height: 100vh;
}

.logo {
  position: fixed;
  top: 20px;
  left: 20px;
  max-height: 100px;
  z-index: 20;
}

.sideBar {
  position: fixed;
  top: 0px;
  right: 0px;
  height: 100%;
  width: 25%;
  z-index: 10;
  color: #000;
  background: #fff;
  border-left: 4px solid #c5050c;
  box-shadow: 0px 1px 30px rgba(0, 0, 0, 0.2);
}

h2 {
  font-family: "Verlag-black";
  text-transform: uppercase;
  letter-spacing: 1px;
  font-size: 1.1rem;
}
</style>
