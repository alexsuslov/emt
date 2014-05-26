# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена символов и привязка сокращений в весовых величинах: г, кг, мг…'
  version:'0.0.0'
  configName:'nbsp_before_weight_unit'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\&nbsp\;|\,)(\d+)( |\&nbsp\;)?(г|кг|мг|т)(\s|\.|\!|\?|\,|$|\&nbsp\;|\;)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

