<template>
  <div class="wpSlides">
    <ul>
        <li v-for="post of posts" :key="post.id" v-if="post._embedded['wp:featuredmedia'][0].media_details.sizes['large']">

            <h1 class="headline mb-0" v-html="post.title.rendered"></h1>

            <img :src="post._embedded['wp:featuredmedia'][0].media_details.sizes['large'].source_url" />

        </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Slides",
  data() {
    return {
      posts: [],
      errors: []
    };
  },
  created: function() {
    this.isLoading = "yes";

    //retrieve posts
    axios
      .get(`https://news.wisc.edu/wp-json/wp/v2/posts/?_embed`)
      .then(response => {
        // JSON responses are automatically parsed.
        this.posts = response.data;
        this.isLoading = "no";
      })
      .catch(e => {
        this.errors.push(e);
      });
  },
  methods: {
    slideChange: function() {
      console.log("changing slides");
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.wpSlides {
  ul {
    margin: 0px;
    padding: 0px;
    list-style: none;

    li {
      display: block;
      position: fixed;
      margin: 0px;
      top: 0px;
      left: 0px;
      width: 100%;
      height: 100%;
      z-index: 5;

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
