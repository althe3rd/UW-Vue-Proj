<template>
    <div class="loadinganimation">
        <div class="loadingtext">Loading!!</div>
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
}

.loaded .loadinganimation {
  opacity: 0;
}

.loadingtext {
  font-size: 3rem;
}
</style>