module.exports = (grunt)->
  require('load-grunt-tasks')(grunt)
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    coffeelint:
      app: ['Gruntfile.coffee','libs/*.coffee', 'emt.coffee']
    # coffee:
      # для браузера
      # compile:
      #   options:
      #     bare: true
      #     sourceMap: true
      #   files:
      #     'dist/ems.js':[
      #       'libs/*.coffee'
      #       'emt.coffee'
      #     ]
      # тесты для браузера
      # test:
      #   options:
      #     bare: true
      #     sourceMap: true
      #   files:
      #     'js/ems.test.js':[
      #       'libs/*.coffee'
      #       'emt.coffee'
      #       'browser/*.coffee'
      #     ]
    codo: options:
      # undocumented: true
      title: "Emt"
      output: "gh-pages"
      inputs: [
        "libs/"
      ]

    # uglify:
    #   translate:
    #     files:
    #       'js/emt.min.js':[
    #         'js/translate.js'
    #       ]
    # concat:
    #   options:
    #     separator: '; ; ; ;;; ;;; ;;; ; ; ;'
    #   dist:
    #     src:[
    #       'js/emt.min.js'
    #     ]
    #     dest:'js/test.min.js'
    # connect:
    #   server:
    #     options:
    #       hostname:'localhost'
    #       port: 9001
    #       # base: 'www-root'
    #       livereload: true
    watch:
      config:
        files: ['Gruntfile.coffee']
        tasks: ['coffeelint']
      tests:
        files: ['test/*.coffee']
        tasks: ['coffeelint']
      app:
        files: ['libs/*.coffee']
        tasks: [
          'coffeelint'
          # 'coffee'
          'codo'
          # 'uglify'
          # 'concat'
        ]

  grunt.registerTask('default', [
    'coffeelint'
    # 'coffee'
    'codo'
    # 'uglify'
    # 'concat'
    # 'connect'
    'watch'
    ])
