# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

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
      /(\d+)([вВ]|\s[вВ])(\s|\.|\!|\?|\,|$)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '\1&nbsp;В\3'
      reStr = m[1] + '&nbsp;В.'
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_before_unit_volt'] = Rule
