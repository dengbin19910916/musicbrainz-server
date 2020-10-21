module.exports = [
  /*
   * The modules in the negative-lookahead assertion (?!...) are exceptions
   * to the node_modules exclusion. These most likely use language features
   * that aren't supported in IE11.
   */
  /node_modules\/(?!@babel\/runtime|@popperjs|jed|mutate-cow|react)/,
  /root\/static\/scripts\/tests\/typeInfo\.js/,
  /root\/static\/build\/jed-[A-z_-]+?\.source\.js$/,
];
