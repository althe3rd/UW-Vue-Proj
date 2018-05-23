<template>
    <div class="logo">
      <div class="glyph">
        <img src="../assets/uw_logo.svg" alt="University of Wisconsin News" />
      </div>

      <div class="text">
        <h1>IT Professionals Conference</h1>
        <h2>University of Wisconsin Madison</h2>
      </div>
    </div>
</template>

<script>
export default {
  name: "Logo"
};
</script>

<style scoped lang="scss">
.logo {
  display: flex;
  position: fixed;
  top: 30px;
  left: 30px;
  max-height: 100px;
  z-index: 20;
  flex-direction: row;
  color: #fff;
  align-items: center;
}

.text {
  text-align: left;
  margin-left: 0.7rem;
  text-shadow: 0px 2px 10px rgba(0, 0, 0, 0.3);

  h1 {
    font-family: "Verlag-Black";
    margin: 0px;
    font-size: 1.5rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  h2 {
    font-family: "Verlag-Light";
    font-size: 0.8rem;
    margin: 0px;
    color: rgba(255, 255, 255, 0.8);
  }
}
</style>