# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена дробей 1/2, 1/4, 3/4 на соответствующие символы'
  version:'0.0.0'
  configName:'simple_fraction'

  replace:->

    # Список правил
    rex = [
      /1\/(2|4)/
      /3\/4/
    ]
    rep = [
      (m)->
        "&frac1#{m[1]};"
      (m)->
        "&frac34;"
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , rep[idx] m

    !!m

module.exports = Rule

