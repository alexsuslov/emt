isClient = !(typeof window is 'undefined')

if isClient
  module = {}
  App =
    text:''
    Lib:{}
    Rules:{}


    apply:->

      @Rules.openQuote.apply()
      @text = @Rules.openQuote.text

      @Rules.closeQuote.text = @text
      @Rules.closeQuote.apply()
      @text = @Rules.closeQuote.text

      @el.text @text


    init: (@opt, @el)->
      @text = el.text()

      # Quote
      @Rules.openQuote = new OpenQuote
        Lib: @Lib
        text: @text

      @Rules.closeQuote = new CloseQuote
        Lib: @Lib
        text: @text

      @apply()

  window.App = App

  $ ->
    $.fn.emt = (options)->
      App.init options, @

