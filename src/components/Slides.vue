<template>
  <div class="wpSlides">
    <carousel :autoplay="true">
      <slide v-for="post of posts" :key="post.id" v-if="post._embedded['wp:featuredmedia'][0].media_details.sizes['full']">
        <h1 class="headline mb-0" v-html="post.title.rendered"></h1>
        <img :src="post._embedded['wp:featuredmedia'][0].media_details.sizes['full'].source_url" />
      </slide>
    </carousel>
  </div>
</template>

<script>
import axios from "axios";
import { Carousel, Slide } from "vue-carousel";

export default {
  name: "Slides",
  data() {
    return {
      posts: [],
      errors: []
    };
  },
  components: {
    carousel: Carousel,
    slide: Slide
  },
  created: function() {
    var obj = this;

    //retrieve posts
    axios
      .get(`https://news.wisc.edu/wp-json/wp/v2/posts/?_embed&per_page=10`)
      .then(response => {
        // JSON responses are automatically parsed.
        this.posts = response.data;
      })
      .catch(e => {
        this.errors.push(e);
      });
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.wpSlides {
  position: relative;

  .VueCarousel-slide {
    position: relative;
    background: #42b983;
    color: #fff;
    font-family: Arial;
    font-size: 24px;
    text-align: center;
    min-height: 100px;
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

    li {
      display: block;
      position: fixed;
      margin: 0px;
      top: 0px;
      left: 0px;
      width: 100%;
      height: 100%;
      z-index: 10;

      h1 {
        margin: 0px;
        display: block;
        position: absolute;
        bottom: 2rem;
        left: 2rem;
        color: #fff;
        z-index: 6;
        font-size: 3rem;
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
</style>
