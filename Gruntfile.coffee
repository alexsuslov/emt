module.exports = (grunt)->
  require('load-grunt-tasks')(grunt)
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    coffeelint:
      options:
        max_line_length:
          value: 100
          level: "warn"
      app: [
        'Gruntfile.coffee'
        'libs/**/*.coffee'
        'emt.coffee'
      ]
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
      output: "../emt_pages"
      inputs: [
        "libs/"
      ]
    mochaTest:
      test:
        options:
          reporter: 'spec',
          require: 'coffee-script/register'
        src: ['test/**/*.coffee']

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
        tasks: ['coffeelint','mochaTest']
      app:
        files: ['libs/**/*.coffee']
        tasks: [
          'coffeelint'
          'mochaTest'
          # 'coffee'
          'codo'
          # 'uglify'
          # 'concat'
        ]

  grunt.registerTask('default', [
    'coffeelint'
    'mochaTest'
    # 'coffee'
    'codo'
    # 'uglify'
    # 'concat'
    # 'connect'
    'watch'
    ])
