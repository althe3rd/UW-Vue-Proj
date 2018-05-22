<template>
  <div class="busdata">
    <div class="eastSchedule">
        <h2>Eastbound</h2>
        <ul>
            <li v-for="(eastbus, index) of eastbuses.slice(0,3)" :key="eastbus.id">
                The {{ eastbus.routeID }} is {{ eastbus.minutes }} minutes away.
            </li>
        </ul>
    </div>

    <div class="westSchedule">
        <h2>Westbound</h2>
        <ul>
            <li v-for="(westbus,index) of westbuses.slice(0,3)" :key="westbus.id">
                The {{ westbus.routeID }} is {{ westbus.minutes }} minutes away.
            </li>
        </ul>
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

    this.getArrivals("0573", "kiosk", "east");
    this.getArrivals("0184", "kiosk", "west");

    setInterval(function() {
      obj.getArrivals("0573", "kiosk", "east");
      obj.getArrivals("0184", "kiosk", "west");
    }, 20000);
  },
  methods: {
    getArrivals: function(stopID, key, direction) {
      var url = "http://api.smsmybus.com/v1/getarrivals"; //'http://api.smsmybus.com/v1/getstoplocation';
      $.ajax({
        type: "GET",
        url: url,
        data: { key: key, stopID: stopID },
        dataType: "jsonp",
        success: function(data) {
          //console.log("location: " + data);
          if (data.status == -1) {
            //console.log("all is bad");
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
  padding: 3rem;
}

.busdata > div:first-child {
  margin-bottom: 2rem;
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
    margin: 0px;
    padding: 0px;
  }
}
</style>
