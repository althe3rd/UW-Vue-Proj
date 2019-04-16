module.exports = {
  lintOnSave: undefined,

  pwa: {
    name: "UW News",
    themeColor: "#D3231C"
  },

  publicPath:
    process.env.NODE_ENV === "production" ? "/production-sub-path/" : "/"
};
