# Зависимости
OpenQuote = require( './open_quote')

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Расстановка дефисов между из-за, из-под'
  version:'0.0.0'
  configName:'mdash2'

  replace:->
    # return if @config.on
    self = @

    # Правило
    re = /(\s|\&nbsp\;|\>|^)(из)(\040|\t|\&nbsp\;)\-?(за|под)([\.\,\!\?\:\;]|\040|\&nbsp\;)/i

    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str

        self.debug m
        reStr = ''
        reStr += m[1] unless m[1] is "&nbsp;"
        reStr += "#{m[2]}-#{m[4]}"
        reStr += m[5] unless m[5] is "&nbsp;"

    !!m

module.exports = Rule

