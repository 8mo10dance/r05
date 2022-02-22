const path = require("path");

const config = {
  entry: {
    home: path.resolve(__dirname, "./src/home/index.tsx"),
  },
  output: {
    path: path.resolve(__dirname, "../app/javascript"),
    filename: "[name]/webpack/bundle.js",
  },
  module: {
    rules: [
      {
        test: /\.(j|t)sx?$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
    ],
  },
  resolve: {
    extensions: [".ts", ".tsx", ".js"],
  },
};

module.exports = (env, argv) => {
  if (argv.mode === "development") {
    config.devtool = "source-map";
  }

  return config;
};
