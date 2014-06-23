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
      coffee:
        files: ['src/coffee/**.coffee']
        tasks: ['coffee']
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
    coffee:
      compile:
        files: [
          expand: true
          cwd: './src/coffee'
          src: ['**.coffee']
          dest: "#{config.locations.build}/js"
          ext: '.js'
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
      dist:
        files: [
          expand: true
          cwd: "#{config.locations.build}"
          src: ['**']
          dest: "#{config.locations.dist}"
        ]
    uglify:
      dist:
        files: [
          expand: true
          cwd: "#{config.locations.dist}"
          src: ['js/**.js']
          dest: "#{config.locations.dist}"
        ]

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'build:dev', ['bower', 'sass', 'coffee', 'copy:static']
  grunt.registerTask 'build:dist', ['build:dev', 'copy:dist', 'uglify:dist']
  grunt.registerTask 'default', ['build:dev', 'connect', 'watch']