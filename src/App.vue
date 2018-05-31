<template>
  <div id="app">
    <div class="flex">
      <div class="slideContainer">
        <Logo />
        <Slides @imagecheck="imagecheck" :slidesurl="slidesurl" />
      </div>

      <div class="sideBar">
        <Weather />
        <BusSchedule />
      </div>
    </div>

    <div class="preloader" :class="{loaded: isLoaded && loadTimer}">
      <LoadingAnim />
    </div>

  </div>
</template>

<script>
import LoadingAnim from "./components/LoadingAnim.vue";
import Logo from "./components/Logo.vue";
import Slides from "./components/Slides.vue";
import BusSchedule from "./components/BusSchedule.vue";
import Weather from "./components/Weather.vue";

export default {
  name: "app",
  data() {
    return {
      isLoaded: false,
      loadTimer: false,
      slidesurl: "https://news.wisc.edu"
    };
  },
  components: {
    Slides,
    BusSchedule,
    Weather,
    Logo,
    LoadingAnim
  },
  created: function() {
    var obj = this;

    //Delay load slightly to demo preloader
    setTimeout(function() {
      obj.loadTimer = true;
    }, 3000);
  },
  methods: {
    imagecheck: function() {
      this.isLoaded = true;
    }
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
  overflow: hidden;
}

.flex {
  display: flex;
  flex-direction: row;
  height: 100%;
}

.slideContainer {
  flex-grow: 1;
  position: relative;
}

.sideBar {
  position: relative;
  flex-basis: 25%;
  min-width: 420px;
  color: #000;
  background: #fff;
  border-left: 4px solid #c5050c;
  box-shadow: 0px 1px 30px rgba(0, 0, 0, 0.2);
}

@media only screen and (max-width: 1300px) {
  .sideBar {
    min-width: 360px;
  }
}

.preloader {
  position: fixed;
  top: 0px;
  right: 0px;
  height: 100%;
  width: 100%;
  z-index: 20;
  background: #fff;
}

.preloader.loaded {
  animation-name: slidefade;
  animation-duration: 1s;
  animation-fill-mode: forwards;
  animation-delay: 0.5s;
}

h2 {
  font-family: "Verlag-black";
  text-transform: uppercase;
  letter-spacing: 1px;
  font-size: 1.1rem;
}

@keyframes slidefade {
  0% {
    opacitiy: 1;
  }

  50% {
    transform: translateX(75%);
    opacity: 1;
  }

  100% {
    opacity: 0;
    transform: translateX(75%);
  }
}
</style>
