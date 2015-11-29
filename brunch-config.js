/* global exports */

'use strict';

exports.config = {
  files: {
    javascripts: {
      joinTo: {
        'main.js': /^app/,
      },
    },
  },

  modules: {
    autoRequire: {
      'main.js': ['main'],
    },
  },

  plugins: {
    babel: {
      ignore: [/\/vendor\//],
    },
  },
};
