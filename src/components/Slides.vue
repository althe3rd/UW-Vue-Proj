<template>
  <div class="wpSlides">
    <transition-group name="slide-fade" tag="ul" mode="in-out">
      <li v-for="(post,index) of posts" :key="post.id" v-if="index == postindex && post._embedded['wp:featuredmedia']">
        <div class="slideCopy">
            <h1 v-html="post.title.rendered"></h1>
            <div class="excerpt" v-html="post.excerpt.rendered"></div>
        </div>
        <img :src="post._embedded['wp:featuredmedia'][0].media_details.sizes['full'].source_url" />
      </li>
    </transition-group>

    <div class="prefetch" aria-hidden="true">
        <div v-for="post of posts" :key="post.id" v-if="post._embedded['wp:featuredmedia']" v-images-loaded:on.done="imageProgress">
            <img :src="post._embedded['wp:featuredmedia'][0].media_details.sizes['full'].source_url" />
        </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import imagesLoaded from "vue-images-loaded";

export default {
  name: "Slides",
  props: ["slidesurl"],
  data() {
    return {
      posts: [],
      errors: [],
      postindex: 0,
      imagesloading: 0
    };
  },
  directives: {
    imagesLoaded
  },
  created: function() {
    var obj = this;

    //Slide auto rotate setup
    setInterval(function() {
      obj.changeSlide();
    }, 15000);

    //Auto check for new slide content once every 30 minutes
    setInterval(function() {
      obj.refreshSlides();
    }, 1800000);

    //retrieve posts
    obj.refreshSlides();
  },
  methods: {
    changeSlide() {
      if (this.postindex < this.posts.length - 1) {
        this.postindex++;
      } else {
        this.postindex = 0;
      }
    },
    refreshSlides() {
      //retrieve posts
      axios
        .get(this.slidesurl + `/wp-json/wp/v2/posts/?_embed&per_page=20`)
        .then(response => {
          // JSON responses are automatically parsed.
          var initialslides = response.data;
          var newslides = [];

          //Look in array to see that an image exists for a post.
          var i;
          for (i = 0; i < initialslides.length; i++) {
            var checkon = initialslides[i]._embedded["wp:featuredmedia"];
            if (checkon) {
              newslides.push(initialslides[i]);
            }
          }

          //Save the 5 more recent slides to vue data.
          this.posts = newslides.slice(0, 5);
        })
        .catch(e => {
          this.errors.push(e);
        });
    },
    imageProgress() {
      this.imagesloading = this.imagesloading + 1;

      var loaded = this.imagesloading;
      var available = this.posts.length;
      //console.log(loaded + " out of " + available);

      if (loaded == available) {
        //console.log("images are loaded");
        this.imagesloaded = true;
        this.$emit("imagecheck", true);
      }

      //const result = image.isLoaded ? "loaded" : "broken";
      //console.log("image is " + result + " for " + image.img.src);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.wpSlides {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100%;
  z-index: 1;
  overflow: hidden;

  .prefetch {
    opacity: 0;
  }

  ul {
    margin: 0px;
    padding: 0px;
    list-style: none;

    li:nth-child(1) {
      z-index: 10;
    }

    li:nth-child(2) {
      z-index: 9;
    }

    li:nth-child(3) {
      z-index: 8;
    }

    li:nth-child(4) {
      z-index: 7;
    }

    li:nth-child(5) {
      z-index: 6;
    }

    li:nth-child(6) {
      z-index: 5;
    }

    li:nth-child(7) {
      z-index: 4;
    }

    li:nth-child(8) {
      z-index: 3;
    }

    li:nth-child(9) {
      z-index: 2;
    }

    li:nth-child(10) {
      z-index: 1;
    }

    li:before {
      content: "";
      display: block;
      position: absolute;
      top: 0px;
      left: 0px;
      right: 0px;
      height: 30%;
      z-index: 1;
      background: -moz-linear-gradient(
        top,
        rgba(0, 0, 0, 0.65) 0%,
        rgba(0, 0, 0, 0) 100%
      ); /* FF3.6-15 */
      background: -webkit-linear-gradient(
        top,
        rgba(0, 0, 0, 0.65) 0%,
        rgba(0, 0, 0, 0) 100%
      ); /* Chrome10-25,Safari5.1-6 */
      background: linear-gradient(
        to bottom,
        rgba(0, 0, 0, 0.65) 0%,
        rgba(0, 0, 0, 0) 100%
      ); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
      filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6000000', endColorstr='#00000000',GradientType=0 ); /* IE6-9 */
    }

    li:after {
      content: "";
      display: block;
      position: absolute;
      bottom: 0px;
      left: 0px;
      right: 0px;
      height: 50%;
      z-index: 1;
      background: -moz-linear-gradient(
        top,
        rgba(0, 0, 0, 0) 0%,
        rgba(0, 0, 0, 0.75) 100%
      ); /* FF3.6-15 */
      background: -webkit-linear-gradient(
        top,
        rgba(0, 0, 0, 0) 0%,
        rgba(0, 0, 0, 0.75) 100%
      ); /* Chrome10-25,Safari5.1-6 */
      background: linear-gradient(
        to bottom,
        rgba(0, 0, 0, 0) 0%,
        rgba(0, 0, 0, 0.75) 100%
      ); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
      filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#bf000000',GradientType=0 ); /* IE6-9 */
    }

    li {
      display: block;
      position: absolute;
      margin: 0px;
      top: 0px;
      left: 0px;
      right: 0px;
      bottom: 0px;

      z-index: 10;

      .slideCopy {
        font-family: "Verlag-light";
        position: absolute;
        bottom: 2rem;
        left: 2rem;
        z-index: 3;
        border-left: 6px solid #c5050c;
        padding-left: 2rem;
        padding-right: 2rem;

        h1 {
          font-family: "Verlag-Black";
          margin: 0px;
          display: block;
          color: #fff;
          z-index: 6;
          font-size: 3rem;
          text-align: left;
          line-height: 1;
          text-transform: uppercase;
        }

        .excerpt {
          margin: 0px;
          display: block;
          color: #fff;
          z-index: 6;
          font-size: 2rem;
          text-align: left;
          font-weight: 300;
          line-height: 1;
        }
      }

      img {
        object-position: 50% 50%;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }
  }
}

@media only screen and (max-width: 1300px) {
  .wpSlides ul li .slideCopy h1 {
    font-size: 2rem;
  }

  .wpSlides ul li .slideCopy .excerpt {
    font-size: 1.5rem;
  }
}

.slide-fade-enter-active {
  transition: all 1s ease;
  transition-delay: 0.5s;
}
.slide-fade-leave-active {
  transition: all 0.7s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(100px) rotate(10deg) scale(0.9);
  transform-origin: center bottom;
  opacity: 0;
}

.slide-fade-leave-to {
  transform: translateX(-100px) rotate(-10deg) scale(0.9);
  transform-origin: center bottom;
  opacity: 0;
}
</style>

<style lang="scss">
.excerpt p {
  margin-top: 1rem;
  margin-bottom: 0px;
  line-height: 1.2;
}
</style>
