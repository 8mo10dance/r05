const path = require("path");

const config = {
  entry: {
    home: path.resolve(__dirname, "./src/home/index.js"),
  },
  output: {
    path: path.resolve(__dirname, "../app/javascript"),
    filename: "[name]/webpack/bundle.js",
  },
};

module.exports = (env, argv) => {
  if (argv.mode === "development") {
    config.devtool = "source-map";
  }

  return config;
};
