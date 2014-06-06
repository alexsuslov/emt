# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Расстановка дефисов с частицами ка, де, кась'
  version:'0.0.0'
  configName:'ka_de_kas'

  replace:->
    # return if @config.on
    self = @
    use = 0

    # Правило
    rex = [
      /(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(ка)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
      /(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(де)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
      /(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(кась)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = ''
      reStr += m[1] unless m[1] is "&nbsp;"
      reStr += "#{m[2]}-#{m[4]}"
      reStr += m[5] unless m[5] is "&nbsp;"

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['ka_de_kas'] = Rule
