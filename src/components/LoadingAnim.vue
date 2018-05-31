<template>
    <div class="loadinganimation">
        <img src="../assets/uw_logo_dark.svg" alt="University of Wisconsin" />
        <div class="loadingtext"><span>Grow.</span><span>Share.</span><span>Learn.</span></div>
    </div>
</template>

<script>
export default {
  name: "LoadingAnim"
};
</script>


<style lang="scss">
.loadinganimation {
  position: absolute;
  top: 50%;
  left: 50%;
  color: #000;
  transform: translate(-50%, -50%);
  transition: opacity 0.4s;
  opacity: 1;

  img {
    height: 170px;
    margin-bottom: 50px;
  }
}

.loaded .loadinganimation {
  opacity: 0;
}

.loadingtext {
  font-size: 1rem;
  font-family: "Verlag-Black";
  color: rgba(0, 0, 0, 0.5);
  text-transform: uppercase;

  span {
    display: inline-block;
    margin-right: 1rem;
    opacity: 0;
    animation-name: fadein;
    animation-duration: 0.8s;
    animation-fill-mode: forwards;
  }

  span:nth-child(1) {
    animation-delay: 0.4s;
  }

  span:nth-child(2) {
    animation-delay: 1s;
  }

  span:nth-child(3) {
    animation-delay: 1.6s;
  }
}

@keyframes fadein {
  0% {
    opacity: 0;
  }

  100% {
    opacity: 1;
  }
}
</style>