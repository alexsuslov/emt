isClient = !(typeof window is 'undefined')

if isClient
  module = {}

  App =
    Lib:{}
    Rules:{}


  class Emt
    text:''
    rules:[]
    order:[
      'Abbr'
      'Symbol'
      'Numbers'
      'NoBr'

      'Punctmark'
      'Quote'

      'Dash'
      'EmtDate'
      'Space'

      'OptAlign'
      'Etc'
      'Text'
    ]
    # Конфиг для теста
    config:
      on:     on
      log:    off
      debug:  off

    tipo:(@text)->
      @simple @text

    simple:(@text)->
      return unless @text
      for rule in @rules
        rule.text = @text
        rule.apply()
        @text = rule.text
      @text

    apply:->
      if @el
        @el.html @tipo @el.html()
      @

    constructor:(@opt, @el)->
      @config = @opt.config if @opt?.config
      @Rules = App.Rules
      @Lib = App.Lib
      # Добавляю правила в очередь
      for ruleName in @order
        if @Rules[ruleName]
          @rules.push new @Rules[ruleName]
            Rules:  @Rules
            Lib:    @Lib
            config: @config
      @inited = true
      @

  window.EMT = Emt

  $ ->
    $.fn.emt = (options)->
      if Object.prototype.toString.call(@) is '[object Array]'
        @EMTS = []
        for el in @
          @EMTS.push new Emt( options, el).apply()
      else if @
        @emt = new Emt options, @
        @emt.apply()
      else
        console.log 'no element'
      @





