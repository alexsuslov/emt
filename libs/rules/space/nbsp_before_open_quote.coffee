# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Неразрывный пробел перед открывающей скобкой'
  version:'0.0.0'
  configName:'nbsp_before_open_quote'

  replace:->

    # Список правил
    rex = [
      /(^|\s|\t|>)([a-zа-яё]{1,2})\s(\&laquo\;|\&bdquo\;)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] ,  "#{m[1]}#{m[2]}&nbsp;#{m[3]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_before_open_quote'] = Rule
