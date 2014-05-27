# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Кое-как, кой-кого, все-таки'
  version:'0.0.0'
  configName:'koe_kak'

  replace:->
    # return if @config.on
    self = @
    use = 0

    # Правило
    rex = [
      /(\s|^|\&nbsp\;|\>)(кое)\-?(\040|\t|\&nbsp\;)\-?(как)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
      /(\s|^|\&nbsp\;|\>)(кой)\-?(\040|\t|\&nbsp\;)\-?(кого)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
      /(\s|^|\&nbsp\;|\>)(вс[её])\-?(\040|\t|\&nbsp\;)\-?(таки)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
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
  App.Rules['koe_kak'] = Rule
