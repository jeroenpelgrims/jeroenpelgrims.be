require.config({
  baseUrl: 'js',

  paths: {
    'jquery': 'vendor/jquery/jquery',
    'bootstrap': 'vendor/bootstrap/bootstrap'
  },

  shim: {
    'bootstrap': {
      deps: ['jquery']
    }
  },

  deps: [
    'bootstrap'
  ]
});