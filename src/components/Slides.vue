<template>
  <div class="wpSlides">
    <transition-group name="slide-fade" tag="ul">
      <li v-for="(post,index) of posts" :key="post.id" v-if="index == postindex && post._embedded['wp:featuredmedia'][0].media_details.sizes['full']">
        <div class="slideCopy">
            <h1 v-html="post.title.rendered"></h1>
            <div class="excerpt" v-html="post.excerpt.rendered"></div>
        </div>
        <img :src="post._embedded['wp:featuredmedia'][0].media_details.sizes['full'].source_url" />
      </li>
    </transition-group>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Slides",
  data() {
    return {
      posts: [],
      errors: [],
      postindex: 0
    };
  },
  created: function() {
    var obj = this;

    setInterval(function() {
      obj.changeSlide();
    }, 12000);

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
  },
  methods: {
    changeSlide() {
      if (this.postindex < this.posts.length - 1) {
        this.postindex++;
      } else {
        this.postindex = 0;
      }
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.wpSlides {
  position: fixed;
  top: 0px;
  left: 0px;
  width: 75%;
  height: 100%;
  z-index: 1;

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

.slide-fade-enter-active {
  transition: all 1s ease;
  transition-delay: 0.5s;
}
.slide-fade-leave-active {
  transition: all 0.7s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(100px) rotate(10deg);
  transform-origin: center bottom;
  opacity: 0;
}

.slide-fade-leave-to {
  transform: translateX(-100px) rotate(-10deg);
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
