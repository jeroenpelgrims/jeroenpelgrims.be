module.exports = (grunt) ->
  grunt.initConfig
    watch:
      config:
        files: ['Gruntfile.coffee']
        options:
          reload: true
      html:
        files: ['src/**/*.html']
        options:
          livereload: true
    connect:
      server:
        options:
          base: 'src'
          port: 8080
          keepalive: true

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'default', ['connect', 'watch']