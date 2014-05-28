isClient = !(typeof window is 'undefined')

if isClient
  module = {}

  App =
    rules:[]
    text:''
    Lib:{}
    Rules:{}
    order:[
      'Quote'
      'Abbr'
      'Numbers'
      'Dash'
      'EmtDate'
      'Etc'
      'NoBr'
      'Text'
      'Symbol'
      'Space'
    ]


    apply:->
      @text = @el.html()

      for rule in @rules
        rule.text = @text
        rule.apply()
        @text = rule.text

      @el.html @text
      @


    init: (@opt, @el)->

      # Добавляю правила в очередь
      for ruleName in @order
        if @Rules[ruleName]
          @rules.push new @Rules[ruleName]
            Rules:  @Rules
            Lib:    @Lib

      @apply()
      @

  window.App = App

  $ ->
    $.fn.emt = (options)->
      App.init options, @

