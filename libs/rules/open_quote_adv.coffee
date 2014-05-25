# Зависимости
Rules = require( './rules')

###
## Открывающая кавычка особые случаи
###
class OpenQuoteAdv extends Rules.open_quote
  description: "Открывающая кавычка особые случаи"
  version:'0.0.0'
  configName:'OpenQuoteAdv'

  apply:->
    return if @config.on
    self = @
    debug = @config.debug

    # Правилo 1

    re = /(^|\(|\s|\>)(\"|\\\")(\s)(\S+)/i
    # Замена
    @text = @text.replace re , (str)->
      self.debug str if debug

      m = str.match re
      self.debug m if debug

      m[1] + self.Lib.QUOTE_FIRS_OPEN + m[4]

    @

module.exports = OpenQuoteAdv


