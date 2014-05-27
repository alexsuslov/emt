# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка знака минус между диапозоном чисел'
  version:'0.0.0'
  configName:'minus_in_numbers_range'

  replace:->
    # Список правил
    # rex = [
    #   /(^|\s|\&nbsp\;)(\&minus\;|\-)(\d+)(\.\.\.|\&hellip\;)(\s|\&nbsp\;)?(\+|\-|\&minus\;)?(\d+)/i
    # ]

    # for re, idx in rex
    #   m = @text.match re
    #   break if m

    # if m
    #   str = m[1] + "&minus;" + m[3] + m[4] + m[5]

    #   if m[6] is "+"
    #     str += $m[6]
    #   else
    #     str += "&minus;"
    #   str += m[7]

    #   @text = @text.replace m[0] , str

    # false


module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['minus_in_numbers_range'] = Rule
