# Зависимости
Rules = require( './rules')

###
## Правило "Закрывающая кавычка"
###
class CloseQuote extends Rules.open_quote
  description: "Закрывающая кавычка"
  version:'0.0.0'
  configName:'CloseQuote'

  apply:->
    return if @config.on
    self = @
    debug = @config.debug

    # Правило
    re = new RegExp [
        "([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)"
        "((\"|\\\")+)"
        "(\.|\&hellip\;|\;|\:|\?|\!|\,|\s|\)|\<\/|$)"].join ''
      , 'i'

    # Замена
    @text = @text.replace re , (str)->
      self.debug str if debug

      m = str.match re
      self.debug m if debug

      m[1] + @Lib.QUOTE_FIRS_CLOSE + m[3]
    @

exports.module = CloseQuote

