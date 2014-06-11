config =
  locations:
    build: './_build/dev'
    dist: './_build/dist'


module.exports = (grunt) ->
  grunt.initConfig
    watch:
      config:
        files: ['Gruntfile.coffee']
        options:
          reload: true
      static:
        files: ['src/**.html', 'src/img/**']
        tasks: ['copy:static']
      sass:
        files: ['src/sass/**.scss']
        tasks: ['sass']
      bower:
        files: ['bower.json']
        tasks: ['bower']
      livereload:
        files: [
          "#{config.locations.build}/**.html"
          "#{config.locations.build}/css/**/*.css"
          "#{config.locations.build}/js/**/*.js"
        ]
        options:
          livereload: true
    sass:
      dist:
        files: [
          expand: true
          cwd: 'src/sass'
          src: ['**.scss']
          dest: "#{config.locations.build}/css"
          ext: '.css'
        ]
    connect:
      server:
        options:
          base: "#{config.locations.build}"
          port: 8081
    bower:
      install:
        options:
          cleanBowerDir: true
          targetDir: "#{config.locations.build}/js/vendor"
    copy:
      static:
        files: [
          expand: true
          cwd: 'src'
          src: ['**.html', 'img/**']
          dest: "#{config.locations.build}"
        ]

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'build-dev', ['bower', 'sass', 'copy:static']
  #grunt.registerTask 'build-dist', ['build-dev', 'minimize', 'test', 'copy;dist']
  grunt.registerTask 'default', ['build-dev', 'connect', 'watch']