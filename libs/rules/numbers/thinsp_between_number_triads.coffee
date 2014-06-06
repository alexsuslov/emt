# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение триад чисел полупробелом'
  version:'0.0.0'
  configName:'thinsp_between_number_triads'

  replace:->

    # Список правил
    rex = [
      /([0-9]{1,3}( [0-9]{3}){1,})(.|$)/
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m
      if m[3] is '-'
        str = m[0]
      else
        str = m[1].replace " ", "&thinsp;"
      str += m[3]

      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['thinsp_between_number_triads'] = Rule
