# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote
###
Правило

###
class AutoComma extends OpenQuote
  description: 'Расстановка запятых перед а, но'
  version:'0.0.0'
  configName:'auto_comma'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё])(\s|&nbsp;)(но|а)(\s|&nbsp;)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , "#{m[1]},#{m[2]}#{m[3]}#{m[4]}"

    !!m

module.exports = AutoComma

if typeof window isnt 'undefined'
  App.Rules['auto_comma'] = AutoComma
