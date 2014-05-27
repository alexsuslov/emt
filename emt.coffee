isClient = !(typeof window is 'undefined')

if isClient
  module = {}

  App =
    text:''
    Lib:{}
    Rules:{}


    apply:->
      @Rules.quote.text = @text
      @Rules.quote.apply()
      @text = @Rules.quote.text

      @el.text @text


    init: (@opt, @el)->
      @text = el.text()

      # Quote
      @Rules.quote = new Quote
        Rules:  @Rules
        Lib:    @Lib

      @apply()

  window.App = App

  $ ->
    $.fn.emt = (options)->
      App.init options, @

