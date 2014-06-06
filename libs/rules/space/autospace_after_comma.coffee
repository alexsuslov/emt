# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило AutospaceAfterComma
##
class AutospaceAfterComma extends OpenQuote
  description: 'Пробел после запятой'
  version:'0.0.0'
  configName:'autospace_after_comma'

  replace:->

    # Список правил
    rex = [
      /(\040|\t|\&nbsp\;)\,([а-яёa-z0-9])/i
      /([0-9])\,([а-яёa-z0-9])/i
    ]
    res = [
      (m)->
        ", #{m[2]}"
    ,
      (m)->
        "#{m[1]}, #{m[2]}"
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , res[idx] m

    !!m

module.exports = AutospaceAfterComma

if typeof window isnt 'undefined'
  App.Rules['autospace_after_comma'] = AutospaceAfterComma
