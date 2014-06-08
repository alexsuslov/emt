# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Отсутствие пробела после троеточия после открывающей кавычки'
  version:'0.0.0'
  configName:'no_space_posle_hellip'

  replace:->

    # Список правил
    rex = [
      /(\&laquo\;|\&bdquo\;)(\s|\&nbsp\;)?\&hellip\;(\s|\&nbsp\;)?([a-zа-яё])/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[1] ,  "#{m[1]}&hellip;#{m[4]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['no_space_posle_hellip'] = Rule
