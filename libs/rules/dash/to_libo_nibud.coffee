# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Автоматическая простановка дефисов в обезличенных местоимениях и междометиях'
  version:'0.0.0'
  configName:'to_libo_nibud'

  replace:->
    # return if @config.on
    self = @

    # Правило
    re = /(\s|^|\&nbsp\;|\>)(кто|кем|когда|зачем|почему|как|что|чем|где|чего|кого)\-?(\040|\t|\&nbsp\;)\-?(то|либо|нибудь)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i

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

if typeof window isnt 'undefined'
  App.Rules['to_libo_nibud'] = Rule
