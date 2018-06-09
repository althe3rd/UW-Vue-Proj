<template>
  <div class="busdata">
    <h1>
      <svg height="141.732" width="141.732" xmlns="http://www.w3.org/2000/svg"><path d="M114.944 118.188h-14.396v14.752a7.196 7.196 0 1 0 14.391 0l.005-14.752zm-73.762 0H26.787v14.752a7.197 7.197 0 1 0 14.392 0l.003-14.752zm73.941-55.491a3.687 3.687 0 0 1-3.688 3.688H30.296a3.688 3.688 0 0 1-3.688-3.688V25.809a3.69 3.69 0 0 1 3.696-3.683h81.126l.004-.002a3.685 3.685 0 0 1 3.688 3.685l.001 36.888zm-14.752-51.633a3.688 3.688 0 0 1-3.688 3.688H44.96c-1.987 0-3.604-1.649-3.604-3.688s1.612-3.688 3.604-3.688h51.722a3.688 3.688 0 0 1 3.689 3.688m-73.584 77.45c0-3.881 3.224-7.025 7.194-7.025 3.979 0 7.198 3.146 7.198 7.025s-3.222 7.021-7.198 7.021c-3.971.002-7.194-3.142-7.194-7.021m29.506-5.534a3.51 3.51 0 0 1 3.39-3.504v-.006h22.07v.01c.059-.004.117-.01.178-.01a3.509 3.509 0 0 1 3.51 3.51 3.507 3.507 0 0 1-3.51 3.51c-.061 0-.119-.006-.178-.009v.009h-22.07v-.006a3.505 3.505 0 0 1-3.39-3.504m0 11.065a3.51 3.51 0 0 1 3.39-3.504v-.006h22.07v.01c.059-.004.117-.01.178-.01a3.51 3.51 0 0 1 3.51 3.51 3.51 3.51 0 0 1-3.51 3.513c-.061 0-.119-.006-.178-.011v.011h-22.07v-.006a3.51 3.51 0 0 1-3.39-3.507m44.256-5.531c0-3.881 3.222-7.025 7.197-7.025s7.194 3.146 7.194 7.025-3.223 7.021-7.194 7.021c-3.976.002-7.197-3.142-7.197-7.021M122.5 7.377v-.002A7.378 7.378 0 0 0 115.123 0H26.608a7.377 7.377 0 0 0-7.376 7.375v103.438a7.2 7.2 0 0 0 7.198 7.197c.06 0 .117-.009.178-.011v.188h88.515a7.38 7.38 0 0 0 7.377-7.377V7.377z"/></svg>
      Bus Stop for N Park / University
    </h1>

    <div class="eastSchedule">
        <h2>Eastbound</h2>
        <ul>
            <li v-for="(eastbus, index) of eastbuses.slice(0,3)" :key="eastbus.id" :class="{arriving: eastbus.minutes < 6}">
                <div class="arrivingIcon" v-if="eastbus.minutes < 6"><svg enable-background="new 0 0 141.732 141.732" height="141.732px" id="Livello_1" version="1.1" viewBox="0 0 141.732 141.732" width="141.732px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="Livello_20"><path d="M114.944,118.188h-14.396v14.752c0,3.976,3.222,7.197,7.197,7.197c3.975,0,7.194-3.226,7.194-7.197L114.944,118.188   L114.944,118.188z M41.182,118.188H26.787v14.752c0,3.976,3.224,7.197,7.194,7.197c3.979,0,7.198-3.226,7.198-7.197L41.182,118.188   L41.182,118.188z M115.123,62.697c0,2.037-1.65,3.688-3.688,3.688H30.298h-0.002c-2.036,0-3.688-1.65-3.688-3.688V25.809   c0-2.033,1.655-3.683,3.696-3.683h0.001h81.125c0.001,0,0.003-0.002,0.004-0.002c2.037,0,3.688,1.647,3.688,3.685L115.123,62.697   L115.123,62.697z M100.371,11.064c0,2.037-1.651,3.688-3.688,3.688H96.68h-51.72c-1.987,0-3.604-1.649-3.604-3.688   s1.612-3.688,3.604-3.688h51.722C98.719,7.375,100.371,9.027,100.371,11.064 M26.787,88.514c0-3.881,3.224-7.025,7.194-7.025   c3.979,0,7.198,3.146,7.198,7.025s-3.222,7.021-7.198,7.021C30.01,95.537,26.787,92.393,26.787,88.514 M56.293,82.98   c0-1.896,1.507-3.438,3.39-3.504V79.47h0.119h0.001h21.95v0.01c0.059-0.004,0.117-0.01,0.178-0.01c1.938,0,3.51,1.569,3.51,3.51   c0,1.938-1.567,3.51-3.51,3.51c-0.061,0-0.119-0.006-0.178-0.009v0.009h-22.07v-0.006C57.799,86.422,56.293,84.879,56.293,82.98    M56.293,94.045c0-1.896,1.507-3.438,3.39-3.504v-0.006h22.07v0.01c0.059-0.004,0.117-0.01,0.178-0.01c1.938,0,3.51,1.57,3.51,3.51   c0,1.938-1.567,3.513-3.51,3.513c-0.061,0-0.119-0.006-0.178-0.011v0.011h-22.07v-0.006C57.799,97.486,56.293,95.943,56.293,94.045    M100.549,88.514c0-3.881,3.222-7.025,7.197-7.025c3.975,0,7.194,3.146,7.194,7.025s-3.223,7.021-7.194,7.021   C103.77,95.537,100.549,92.393,100.549,88.514 M122.5,7.377V7.375c0-4.071-3.304-7.375-7.377-7.375H26.609h-0.001   c-4.073,0-7.376,3.304-7.376,7.375v103.438c0,3.976,3.228,7.197,7.198,7.197c0.06,0,0.117-0.009,0.178-0.011v0.188h88.515   c4.07,0,7.377-3.303,7.377-7.377V7.377z"/></g><g id="Livello_1_1_"/></svg></div>
                <strong>#{{ eastbus.routeID }}</strong> arrives in <strong>{{ eastbus.minutes }}</strong> minute<span v-if="eastbus.minutes != 1">s</span>.
            </li>
        </ul>
    </div>

    <div class="westSchedule">
        <h2>Westbound</h2>
        <ul>
            <li v-for="(westbus,index) of westbuses.slice(0,3)" :key="westbus.id" :class="{arriving: westbus.minutes < 6}">
                <div class="arrivingIcon" v-if="westbus.minutes < 6"><svg enable-background="new 0 0 141.732 141.732" height="141.732px" id="Livello_1" version="1.1" viewBox="0 0 141.732 141.732" width="141.732px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="Livello_20"><path d="M114.944,118.188h-14.396v14.752c0,3.976,3.222,7.197,7.197,7.197c3.975,0,7.194-3.226,7.194-7.197L114.944,118.188   L114.944,118.188z M41.182,118.188H26.787v14.752c0,3.976,3.224,7.197,7.194,7.197c3.979,0,7.198-3.226,7.198-7.197L41.182,118.188   L41.182,118.188z M115.123,62.697c0,2.037-1.65,3.688-3.688,3.688H30.298h-0.002c-2.036,0-3.688-1.65-3.688-3.688V25.809   c0-2.033,1.655-3.683,3.696-3.683h0.001h81.125c0.001,0,0.003-0.002,0.004-0.002c2.037,0,3.688,1.647,3.688,3.685L115.123,62.697   L115.123,62.697z M100.371,11.064c0,2.037-1.651,3.688-3.688,3.688H96.68h-51.72c-1.987,0-3.604-1.649-3.604-3.688   s1.612-3.688,3.604-3.688h51.722C98.719,7.375,100.371,9.027,100.371,11.064 M26.787,88.514c0-3.881,3.224-7.025,7.194-7.025   c3.979,0,7.198,3.146,7.198,7.025s-3.222,7.021-7.198,7.021C30.01,95.537,26.787,92.393,26.787,88.514 M56.293,82.98   c0-1.896,1.507-3.438,3.39-3.504V79.47h0.119h0.001h21.95v0.01c0.059-0.004,0.117-0.01,0.178-0.01c1.938,0,3.51,1.569,3.51,3.51   c0,1.938-1.567,3.51-3.51,3.51c-0.061,0-0.119-0.006-0.178-0.009v0.009h-22.07v-0.006C57.799,86.422,56.293,84.879,56.293,82.98    M56.293,94.045c0-1.896,1.507-3.438,3.39-3.504v-0.006h22.07v0.01c0.059-0.004,0.117-0.01,0.178-0.01c1.938,0,3.51,1.57,3.51,3.51   c0,1.938-1.567,3.513-3.51,3.513c-0.061,0-0.119-0.006-0.178-0.011v0.011h-22.07v-0.006C57.799,97.486,56.293,95.943,56.293,94.045    M100.549,88.514c0-3.881,3.222-7.025,7.197-7.025c3.975,0,7.194,3.146,7.194,7.025s-3.223,7.021-7.194,7.021   C103.77,95.537,100.549,92.393,100.549,88.514 M122.5,7.377V7.375c0-4.071-3.304-7.375-7.377-7.375H26.609h-0.001   c-4.073,0-7.376,3.304-7.376,7.375v103.438c0,3.976,3.228,7.197,7.198,7.197c0.06,0,0.117-0.009,0.178-0.011v0.188h88.515   c4.07,0,7.377-3.303,7.377-7.377V7.377z"/></g><g id="Livello_1_1_"/></svg></div>
                <strong>#{{ westbus.routeID }}</strong> arrives in <strong>{{ westbus.minutes }}</strong> minute<span v-if="westbus.minutes != 1">s</span>.
            </li>
        </ul>
    </div>

    <div class="key">
      <svg enable-background="new 0 0 141.732 141.732" height="141.732px" id="Livello_1" version="1.1" viewBox="0 0 141.732 141.732" width="141.732px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="Livello_20"><path d="M114.944,118.188h-14.396v14.752c0,3.976,3.222,7.197,7.197,7.197c3.975,0,7.194-3.226,7.194-7.197L114.944,118.188   L114.944,118.188z M41.182,118.188H26.787v14.752c0,3.976,3.224,7.197,7.194,7.197c3.979,0,7.198-3.226,7.198-7.197L41.182,118.188   L41.182,118.188z M115.123,62.697c0,2.037-1.65,3.688-3.688,3.688H30.298h-0.002c-2.036,0-3.688-1.65-3.688-3.688V25.809   c0-2.033,1.655-3.683,3.696-3.683h0.001h81.125c0.001,0,0.003-0.002,0.004-0.002c2.037,0,3.688,1.647,3.688,3.685L115.123,62.697   L115.123,62.697z M100.371,11.064c0,2.037-1.651,3.688-3.688,3.688H96.68h-51.72c-1.987,0-3.604-1.649-3.604-3.688   s1.612-3.688,3.604-3.688h51.722C98.719,7.375,100.371,9.027,100.371,11.064 M26.787,88.514c0-3.881,3.224-7.025,7.194-7.025   c3.979,0,7.198,3.146,7.198,7.025s-3.222,7.021-7.198,7.021C30.01,95.537,26.787,92.393,26.787,88.514 M56.293,82.98   c0-1.896,1.507-3.438,3.39-3.504V79.47h0.119h0.001h21.95v0.01c0.059-0.004,0.117-0.01,0.178-0.01c1.938,0,3.51,1.569,3.51,3.51   c0,1.938-1.567,3.51-3.51,3.51c-0.061,0-0.119-0.006-0.178-0.009v0.009h-22.07v-0.006C57.799,86.422,56.293,84.879,56.293,82.98    M56.293,94.045c0-1.896,1.507-3.438,3.39-3.504v-0.006h22.07v0.01c0.059-0.004,0.117-0.01,0.178-0.01c1.938,0,3.51,1.57,3.51,3.51   c0,1.938-1.567,3.513-3.51,3.513c-0.061,0-0.119-0.006-0.178-0.011v0.011h-22.07v-0.006C57.799,97.486,56.293,95.943,56.293,94.045    M100.549,88.514c0-3.881,3.222-7.025,7.197-7.025c3.975,0,7.194,3.146,7.194,7.025s-3.223,7.021-7.194,7.021   C103.77,95.537,100.549,92.393,100.549,88.514 M122.5,7.377V7.375c0-4.071-3.304-7.375-7.377-7.375H26.609h-0.001   c-4.073,0-7.376,3.304-7.376,7.375v103.438c0,3.976,3.228,7.197,7.198,7.197c0.06,0,0.117-0.009,0.178-0.011v0.188h88.515   c4.07,0,7.377-3.303,7.377-7.377V7.377z"/></g><g id="Livello_1_1_"/></svg>
      Indicates a bus will arrive soon.
    </div>
  </div>
</template>

<script>
import $ from "jquery";
var vm = "";

export default {
  name: "BusSchedule",
  data() {
    return {
      eastbuses: [],
      westbuses: []
    };
  },
  created: function() {
    var obj = this;
    vm = this;

    var eastbuses = localStorage.getItem("eastbuses");
    var westbuses = localStorage.getItem("westbuses");

    if (eastbuses) {
      this.eastbuses = JSON.parse(eastbuses);
    }

    if (westbuses) {
      this.westbuses = JSON.parse(westbuses);
    }

    this.getArrivals("0100", "kiosk", "east");
    this.getArrivals("0538", "kiosk", "west");

    setInterval(function() {
      obj.getArrivals("0100", "kiosk", "east");
      obj.getArrivals("0538", "kiosk", "west");
    }, 20000);
  },
  methods: {
    getArrivals: function(stopID, key, direction) {
      var url = "https://api.smsmybus.com/v1/getarrivals";

      $.ajax({
        type: "GET",
        url: url,
        data: { key: key, stopID: stopID },
        dataType: "jsonp",
        success: function(data) {
          if (data.status == -1) {
            console.log("error with route ID");
          } else {
            //console.log(data.stop.route);
            if (direction == "east") {
              vm.eastbuses = data.stop.route;
              localStorage.setItem(
                "eastbuses",
                JSON.stringify(data.stop.route)
              );
            } else if (direction == "west") {
              vm.westbuses = data.stop.route;
              localStorage.setItem(
                "westbuses",
                JSON.stringify(data.stop.route)
              );
            }
          }
        }
      }); // .ajax
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.busdata {
  padding: 4rem;
  position: absolute;
  bottom: 0px;
  right: 0px;
  left: 0px;
  text-align: left;
}

.arriving {
  font-weight: bold;
  color: #c5050c;
  font-size: 1.6rem;
}

.arrivingIcon {
  position: absolute;
  top: 0px;
  left: -30px;
  height: 1.5rem;
  width: 1.5rem;
  animation-name: rumble;
  animation-duration: 1.5s;
  animation-iteration-count: infinite;
  animation-direction: alternate;

  svg {
    width: 100%;
    height: 100%;
  }
}

.key {
  margin-top: 2rem;
  font-size: 1.2rem;

  svg {
    display: inline-block;
    height: 1rem;
    width: 1rem;
  }
}

.busdata .eastSchedule {
  margin-bottom: 2rem;
}

h1 {
  font-size: 1.3rem;
  border-bottom: 1px solid rgba(0, 0, 0, 0.3);
  padding-bottom: 1rem;

  svg {
    display: inline-block;
    width: 1.2rem;
    height: 1.2rem;

    path {
      fill: rgba(0, 0, 0, 0.3);
    }
  }
}

h2 {
  color: rgba(0, 0, 0, 0.5);
  font-size: 1rem;
}

ul {
  list-style: none;
  margin: 0px;
  padding: 0px;

  li {
    position: relative;
    margin: 0px;
    padding: 0px;
    font-size: 1.4rem;
  }
}

@media only screen and (max-width: 1300px) {
  ul li {
    font-size: 1.4rem;
  }

  .arriving {
    font-weight: bold;
    color: #c5050c;
    font-size: 1.2rem;
  }

  .arrivingIcon {
    height: 1.5rem;
    width: 1.5rem;
  }

  .key {
    margin-top: 2rem;
    font-size: 1rem;
  }
}

@keyframes rumble {
  0% {
    transform: rotate(2deg) translate(0px, 0px);
    transform-origin: center center;
  }
  10% {
    transform: rotate(0deg) translate(0px, -0.3px);
    transform-origin: center center;
  }
  20% {
    transform: rotate(0deg) translate(0px, 0.6px);
    transform-origin: center center;
  }

  30% {
    transform: rotate(0deg) translate(0px, -0.2px);
    transform-origin: center center;
  }

  40% {
    transform: rotate(-2deg) translate(0px, 0.3px);
    transform-origin: center center;
  }

  50% {
    transform: rotate(0deg) translate(0px, 0.6px);
    transform-origin: center center;
  }

  60% {
    transform: rotate(0deg) translate(0px, -0.5px);
    transform-origin: center center;
  }

  70% {
    transform: rotate(0deg) translate(0px, 0px);
    transform-origin: center center;
  }

  80% {
    transform: rotate(0deg) translate(0px, 0.3px);
    transform-origin: center center;
  }

  90% {
    transform: rotate(0deg) translate(0px, -0.5px);
    transform-origin: center center;
  }

  100% {
    transform: rotate(0deg) translate(0px, 0px);
    transform-origin: center center;
  }
}
</style>
