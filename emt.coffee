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

      @Rules.abbr.text = @text
      @Rules.abbr.apply()
      @text = @Rules.abbr.text

      @el.html @text


    init: (@opt, @el)->
      @text = el.html()

      # Quote
      @Rules.quote = new @Rules.Quote
        Rules:  @Rules
        Lib:    @Lib
      # Abbr =
      @Rules.abbr = new @Rules.Abbr
        Rules:  @Rules
        Lib:    @Lib

      @apply()

  window.App = App

  $ ->
    $.fn.emt = (options)->
      App.init options, @

