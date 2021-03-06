<template>
  <div class="weather" v-if="dataReady">
    <div class="icon sun-shower" :class="{ showIcon: isSunShower }">
      <div class="cloud"></div>
      <div class="sun">
      <div class="rays"></div>
    </div>
    <div class="rain"></div>
  </div>

  <div class="icon thunder-storm" :class="{ showIcon: isStorm }">
    <div class="cloud"></div>
    <div class="lightning">
      <div class="bolt"></div>
      <div class="bolt"></div>
    </div>
  </div>

  <div class="icon cloudy" :class="{ showIcon: isClouds }">
    <div class="cloud"></div>
    <div class="cloud"></div>
  </div>

    <div class="icon flurries" :class="{ showIcon: isSnow }">
      <div class="cloud"></div>
      <div class="snow">
        <div class="flake"></div>
        <div class="flake"></div>
      </div>
    </div>

    <div class="icon sunny" :class="{ showIcon: isSunny }">
      <div class="sun">
        <div class="rays"></div>
      </div>
    </div>

    <div class="icon rainy" :class="{ showIcon: isRain }">
      <div class="cloud"></div>
      <div class="rain"></div>
    </div>


        <div class="temp">{{ tempInt }} <span>&#176;</span></div>
        <div class="condition">{{ weatherdata.weather[0].main }}</div>

  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Weather",
  data() {
    return {
      weatherdata: [],
      errors: [],
      dataReady: false,
      isRain: false,
      isClouds: false,
      isSunny: false,
      isStorm: false,
      isSunShower: false,
      isSnow: false
    };
  },
  computed: {
    tempInt: function() {
      return parseInt(this.weatherdata.main.temp);
    }
  },
  created: function() {
    var obj = this;

    var weathercached = localStorage.getItem("weatherjson");
    weathercached = JSON.parse(weathercached);

    var datecheckedlast = localStorage.getItem("datecheckedlast");

    var currentdate = new Date().getTime();
    if (datecheckedlast) {
      var diffMs = currentdate - datecheckedlast;

      // limit checks to once a minute
      if (diffMs > 0) {
        this.getWeather();

        //Update weather every 10 minutes
        setInterval(function() {
          obj.getWeather();
        }, 600000);

        //If within timelimit use last pull stored locally
      } else {
        this.weatherdata = weathercached;
        this.adaptCondition();
        this.dataReady = true;
      }
    } else {
      this.getWeather();
    }
  },
  methods: {
    getWeather: function() {
      //retrieve posts

      axios
        .get(
          `https://api.openweathermap.org/data/2.5/weather?zip=53572,us&units=imperial&APPID=953d5255520875f27485ea002ce5d661`
        )
        .then(response => {
          // JSON responses are automatically parsed.
          this.weatherdata = response.data;
          this.adaptCondition();
          this.dataReady = true;

          // Save weather data to local storage in case API isn't availble next time
          if (this.weatherdata.main.temp) {
            var now = new Date().getTime();
            localStorage.setItem("weatherjson", JSON.stringify(response.data));
            localStorage.setItem("datecheckedlast", now);
          }
        })
        .catch(e => {
          this.errors.push(e);
        });
    },
    adaptCondition: function() {
      if (this.weatherdata.weather[0].main == "Rain") {
        this.isRain = true;
        this.isClouds = false;
        this.isSunShower = false;
        this.isStorm = false;
        this.isSunny = false;
      } else if (this.weatherdata.weather[0].main == "Clouds") {
        this.isRain = false;
        this.isClouds = true;
        this.isSunShower = false;
        this.isStorm = false;
        this.isSunny = false;
      } else if (this.weatherdata.weather[0].main == "Sunny") {
        this.isRain = false;
        this.isClouds = false;
        this.isSunShower = false;
        this.isStorm = false;
        this.isSunny = true;
      } else {
        this.isRain = false;
        this.isClouds = false;
        this.isSunShower = false;
        this.isStorm = false;
        this.isSunny = true;
      }
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.weather {
  position: relative;

  .temp {
    margin-top: 4rem;
    font-size: 8rem;
    font-weight: bold;
    display: inline-block;
    line-height: 1;

    span {
      font-family: "Verlag-Light";
      color: rgba(0, 0, 0, 0.5);
      font-size: 7rem;
      margin-left: -25px;
    }
  }

  .condition {
    font-size: 2.5rem;
  }
}

h1 {
  margin-bottom: 1.375em;
  color: #fff;
  font-weight: 100;
  font-size: 2em;
  text-transform: uppercase;
}
p,
a {
  color: rgba(255, 255, 255, 0.3);
  font-size: small;
}
p {
  margin: 1.375rem 0;
}

.icon {
  position: absolute;
  top: -20px;
  right: -20px;
  display: none;
  width: 12em;
  margin: 0 auto;
  height: 10em;
  font-size: 1em; /* control icon size here */
}

.icon.showIcon {
  display: block;
}

.cloud {
  position: absolute;
  z-index: 1;
  top: 50%;
  left: 50%;
  width: 3.6875em;
  height: 3.6875em;
  margin: -1.84375em;
  background: currentColor;
  border-radius: 50%;
  box-shadow: -2.1875em 0.6875em 0 -0.6875em, 2.0625em 0.9375em 0 -0.9375em,
    0 0 0 0.375em #000, -2.1875em 0.6875em 0 -0.3125em #000,
    2.0625em 0.9375em 0 -0.5625em #000;
}

.cloud:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: -0.5em;
  display: block;
  width: 4.5625em;
  height: 1em;
  background: currentColor;
  box-shadow: 0 0.4375em 0 -0.0625em #000;
}
.cloud:nth-child(2) {
  z-index: 0;
  background: #000;
  box-shadow: -2.1875em 0.6875em 0 -0.6875em #000,
    2.0625em 0.9375em 0 -0.9375em #000, 0 0 0 0.375em #000,
    -2.1875em 0.6875em 0 -0.3125em #000, 2.0625em 0.9375em 0 -0.5625em #000;
  opacity: 0.3;
  transform: scale(0.5) translate(6em, -3em);
  animation: cloud 4s linear infinite;
}
.cloud:nth-child(2):after {
  background: #000;
}

.sun {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 2.5em;
  height: 2.5em;
  margin: -1.25em;
  background: currentColor;
  border-radius: 50%;
  box-shadow: 0 0 0 0.375em #000;
  animation: spin 12s infinite linear;
}
.rays {
  position: absolute;
  top: -2em;
  left: 50%;
  display: block;
  width: 0.375em;
  height: 1.125em;
  margin-left: -0.1875em;
  background: #000;
  border-radius: 0.25em;
  box-shadow: 0 5.375em #000;
}
.rays:before,
.rays:after {
  content: "";
  position: absolute;
  top: 0em;
  left: 0em;
  display: block;
  width: 0.375em;
  height: 1.125em;
  transform: rotate(60deg);
  transform-origin: 50% 3.25em;
  background: #000;
  border-radius: 0.25em;
  box-shadow: 0 5.375em #000;
}
.rays:before {
  transform: rotate(120deg);
}
.cloud + .sun {
  margin: -2em 1em;
}

.rain,
.lightning,
.snow {
  position: absolute;
  z-index: 2;
  top: 50%;
  left: 50%;
  width: 3.75em;
  height: 3.75em;
  margin: 0.375em 0 0 -2em;
  background: transparent;
}

.rain:after {
  content: "";
  position: absolute;
  z-index: 2;
  top: 50%;
  left: 50%;
  width: 1.125em;
  height: 1.125em;
  margin: -1em 0 0 -0.25em;
  background: #0cf;
  border-radius: 100% 0 60% 50% / 60% 0 100% 50%;
  box-shadow: 0.625em 0.875em 0 -0.125em rgba(0, 0, 0, 0.2),
    -0.875em 1.125em 0 -0.125em rgba(0, 0, 0, 0.2),
    -1.375em -0.125em 0 rgba(0, 0, 0, 0.2);
  transform: rotate(-28deg);
  animation: rain 3s linear infinite;
}

.bolt {
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -0.25em 0 0 -0.125em;
  color: #000;
  opacity: 0.3;
  animation: lightning 2s linear infinite;
}
.bolt:nth-child(2) {
  width: 0.5em;
  height: 0.25em;
  margin: -1.75em 0 0 -1.875em;
  transform: translate(2.5em, 2.25em);
  opacity: 0.2;
  animation: lightning 1.5s linear infinite;
}
.bolt:before,
.bolt:after {
  content: "";
  position: absolute;
  z-index: 2;
  top: 50%;
  left: 50%;
  margin: -1.625em 0 0 -1.0125em;
  border-top: 1.25em solid transparent;
  border-right: 0.75em solid;
  border-bottom: 0.75em solid;
  border-left: 0.5em solid transparent;
  transform: skewX(-10deg);
}
.bolt:after {
  margin: -0.25em 0 0 -0.25em;
  border-top: 0.75em solid;
  border-right: 0.5em solid transparent;
  border-bottom: 1.25em solid transparent;
  border-left: 0.75em solid;
  transform: skewX(-10deg);
}
.bolt:nth-child(2):before {
  margin: -0.75em 0 0 -0.5em;
  border-top: 0.625em solid transparent;
  border-right: 0.375em solid;
  border-bottom: 0.375em solid;
  border-left: 0.25em solid transparent;
}
.bolt:nth-child(2):after {
  margin: -0.125em 0 0 -0.125em;
  border-top: 0.375em solid;
  border-right: 0.25em solid transparent;
  border-bottom: 0.625em solid transparent;
  border-left: 0.375em solid;
}

.flake:before,
.flake:after {
  content: "\2744";
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -1.025em 0 0 -1.0125em;
  color: #000;
  list-height: 1em;
  opacity: 0.2;
  animation: spin 8s linear infinite reverse;
}
.flake:after {
  margin: 0.125em 0 0 -1em;
  font-size: 1.5em;
  opacity: 0.4;
  animation: spin 14s linear infinite;
}
.flake:nth-child(2):before {
  margin: -0.5em 0 0 0.25em;
  font-size: 1.25em;
  opacity: 0.2;
  animation: spin 10s linear infinite;
}
.flake:nth-child(2):after {
  margin: 0.375em 0 0 0.125em;
  font-size: 2em;
  opacity: 0.4;
  animation: spin 16s linear infinite reverse;
}

/* Animations */

@keyframes spin {
  100% {
    transform: rotate(360deg);
  }
}

@keyframes cloud {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 0.3;
  }
  100% {
    opacity: 0;
    transform: scale(0.5) translate(-200%, -3em);
  }
}

@keyframes rain {
  0% {
    background: #0cf;
    box-shadow: 0.625em 0.875em 0 -0.125em rgba(255, 255, 255, 0.2),
      -0.875em 1.125em 0 -0.125em rgba(255, 255, 255, 0.2),
      -1.375em -0.125em 0 #0cf;
  }
  25% {
    box-shadow: 0.625em 0.875em 0 -0.125em rgba(255, 255, 255, 0.2),
      -0.875em 1.125em 0 -0.125em #0cf,
      -1.375em -0.125em 0 rgba(255, 255, 255, 0.2);
  }
  50% {
    background: rgba(255, 255, 255, 0.3);
    box-shadow: 0.625em 0.875em 0 -0.125em #0cf,
      -0.875em 1.125em 0 -0.125em rgba(255, 255, 255, 0.2),
      -1.375em -0.125em 0 rgba(255, 255, 255, 0.2);
  }
  100% {
    box-shadow: 0.625em 0.875em 0 -0.125em rgba(255, 255, 255, 0.2),
      -0.875em 1.125em 0 -0.125em rgba(255, 255, 255, 0.2),
      -1.375em -0.125em 0 #0cf;
  }
}

@keyframes lightning {
  45% {
    color: #fff;
    background: #fff;
    opacity: 0.2;
  }
  50% {
    color: #0cf;
    background: #0cf;
    opacity: 1;
  }
  55% {
    color: #fff;
    background: #fff;
    opacity: 0.2;
  }
}
</style>
