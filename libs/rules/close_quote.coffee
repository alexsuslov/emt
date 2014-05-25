# Зависимости
OpenQuote = require( './open_quote')

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
    use = false
    # Правило
    re = /([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)(\"+)(\.|\&hellip\;|\;|\:|\?|\!|\,|\s|\)|\<\/|$)/i

    # Замена
    @text = @text.replace re , (str)->
      self.debug str

      m = str.match re
      self.debug m
      use = true
      m[1] + self.Lib.QUOTE_FIRS_CLOSE + m[3]

    use

module.exports = CloseQuote

