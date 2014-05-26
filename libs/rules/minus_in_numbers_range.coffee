# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка знака минус между диапозоном чисел'
  version:'0.0.0'
  configName:'minus_in_numbers_range'

  replace:->

    # Список правил
    rex = [
      /(^|\s|\&nbsp\;)(\&minus\;|\-)(\d+)(\.\.\.|\&hellip\;)(\s|\&nbsp\;)?(\+|\-|\&minus\;)?(\d+)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] ."&minus;".$m[3] . $m[4].$m[5].($m[6]=="+"?$m[6]:"&minus;").$m[7]'
      str = m[1] + "&minus;" + m[3] + m[4] + m[5]

      if m[6] is "+"
        str += $m[6]
      else
        str += "&minus;"
      str += m[7]

      @text = @text.replace m[0] , str

    # !!m

module.exports = Rule

