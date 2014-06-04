module.exports = (grunt) ->
  grunt.initConfig
    watch:
      config:
        files: ['Gruntfile.coffee']
        options:
          reload: true
      html:
        files: ['src/**.html']
      js:
        files: ['src/js/**.js']
      sass:
        files: ['src/sass/**.scss']
        tasks: ['sass']
      bower:
        files: ['bower.json']
        tasks: ['bower']
      livereload:
        files: [
          'src/**.html'
          'src/css/**/*.css',
          'src/js/**/*.js'
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
    bower:
      install:
        options:
          cleanBowerDir: true
          targetDir: 'src/js/vendor'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-bower-task'

  grunt.registerTask 'setup', ['bower', 'sass']
  grunt.registerTask 'default', ['setup', 'connect', 'watch']