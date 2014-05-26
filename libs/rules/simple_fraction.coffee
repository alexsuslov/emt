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
      /(^|\D)1\/(2|4)(\D)/
      /(^|\D)3\/4(\D)/
    ]
    rep = [
      (m)->
        "#{m[1]}&frac1#{m[2]};#{m[3]}"
      (m)->
        "#{m[1]}&frac34;#{m[2]}"
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , rep[idx] m

    !!m

module.exports = Rule

