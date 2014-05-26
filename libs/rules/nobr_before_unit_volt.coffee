# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Установка пробельных символов в сокращении вольт'
  version:'0.0.0'
  configName:'nobr_before_unit_volt'

  replace:->
    # Список правил
    rex = [
      /(\d+)([вВ]| В)(\s|\.|\!|\?|\,|$)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

