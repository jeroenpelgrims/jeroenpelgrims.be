module.exports = (grunt) ->
  grunt.initConfig
    watch:
      html:
        files: ['src/**/*.html']
        options:
          reload: true


  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['watch']