module.exports = (grunt) ->
  grunt.initConfig
    watch:
      html:
        files: ['src/**/*.html']
        options:
          livereload: true
    connect:
      options:
        port: 8080


  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'default', ['watch', 'connect']