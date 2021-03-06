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
    coffee:
      # для браузера
      compile:
        options:
          bare: false
          sourceMap: true
        files:
          'dist/emt.js':[
            'emt.coffee'
            'libs/chars_table.coffee'
            'libs/html4_char_ents.coffee'
            'libs/emt_lib.coffee'
            'libs/rules/dep/*.coffee'
            'libs/rules/**/*.coffee'
            '!libs/rules/quote.coffee'
            '!libs/rules/quote/open_quote.coffee'
            '!libs/test*.coffee'
          ]
      # тесты для браузера
      test:
        options:
          bare: true
          sourceMap: true
        files:
          'js/emt.test.js':[
            'libs/test*.coffee'
          ]
    codo: options:
      # undocumented: true
      title: "Emt"
      output: "../emt_pages"
      inputs: [
        "libs/"
      ]

    mochaTest:
      spec:
        options:
          reporter: 'spec'
          require: 'coffee-script/register'
        src: ['test/**/*.coffee']
      md:
        options:
          reporter: 'Markdown'
          require: 'coffee-script/register'
          quiet: true
          captureFile: 'report.md'
        src: ['test/**/*.coffee']




    uglify:
      main:
        files:
          'dist/emt.min.js':[
            'dist/emt.js'
          ]
      test:
        files:
          '../emt_pages/js/emt.min.js':[
            'dist/emt.js'
          ]
      test1:
        files:
          '../emt_pages/js/emt.test.min.js':[
            'js/emt.test.js'
          ]
    # concat:
    #   options:
    #     separator: '; ; ; ;;; ;;; ;;; ; ; ;'
    #   dist:
    #     src:[
    #       'js/emt.min.js'
    #     ]
    #     dest:'js/test.min.js'
    connect:
      server:
        options:
          hostname:'localhost'
          port: 9001
          # base: 'www-root'
          livereload: true
    watch:
      config:
        options:
          livereload: true
        files: ['Gruntfile.coffee']
        tasks: ['coffeelint','coffee']
      tests:
        options:
          livereload: true
        files: ['test/*.coffee']
        tasks: ['coffeelint','mochaTest:spec' ]
      app:
        options:
          livereload: true
        files: ['emt.coffee','libs/**/*.coffee']
        tasks: [
          'coffeelint'
          'coffee'
          'codo'
          'mochaTest:spec'
          'uglify'
          # 'concat'
        ]


  grunt.registerTask('default', [
    'coffeelint'
    'coffee'
    'uglify'
    # 'concat'
    'codo'
    'mochaTest:md'
    ])
  grunt.registerTask('serve', [
    'coffeelint'
    'mochaTest:spec'
    'coffee'
    'connect'
    'watch'
    ])
