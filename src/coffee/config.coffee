require.config
  baseUrl: 'js',

  paths:
    jquery: 'vendor/jquery/jquery'
    bootstrap: 'vendor/bootstrap/bootstrap'
  
  shim:
    jquery:
      exports: '$'
    bootstrap:
      deps: ['jquery']

  deps: [
    'main'
  ]