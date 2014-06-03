module.exports = (grunt) ->
  grunt.initConfig
    watch:
      config:
        files: ['Gruntfile.coffee']
        options:
          reload: true
      html:
        files: ['src/**.html']
      sass:
        files: ['src/sass/**.scss']
        tasks: ['sass']
      livereload:
        files: [
          'src/**.html'
          'src/css/**/*.css'
        ]
        options:
          livereload: true
    sass:
      dist:
        files: [
          expand: true
          cwd: 'src/sass'
          src: ['**.scss']
          dest: 'src/css'
          ext: '.css'
        ]
    connect:
      server:
        options:
          base: 'src'
          port: 8080

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-sass'

  grunt.registerTask 'default', ['connect', 'watch']