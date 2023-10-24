const path = require("path");

module.exports = {
  mode: "development",
  entry: "./app/javascript/packs/index.js", // Path to your entry point file
  output: {
    filename: "bundle.js", // Name of the bundled file
    path: path.resolve(__dirname, "dist"), // Directory where the bundled file should be saved
  },
  module: {
    rules: [
      {
        test: /\.js$/, // Regex to match JavaScript files
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env", "@babel/preset-react"],
          },
        },
      },
    ],
  },
};
