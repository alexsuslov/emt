# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class CloseQuote extends OpenQuote
  description: "Закрывающая кавычка"
  version:'0.0.0'
  configName:'CloseQuote'

  apply:->
    # return if @config.on
    self = @

    # Правило
    re = /([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)(\"+)(\.|\&hellip\;|\;|\:|\?|\!|\,|\s|\)|\<\/|$)/i
    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str
        self.debug m

        m[1] + self.Lib.QUOTE_FIRS_CLOSE + m[3]

    !!m

# module.exports = CloseQuote

module.exports = CloseQuote
