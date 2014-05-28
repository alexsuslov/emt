# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел после знаков пунктуации, кроме точки'
  version:'0.0.0'
  configName:'autospace_after_pmarks'

  replace:->

    # Список правил
    rex = [
      /(\040|\t|\&nbsp\;|^|\n)([a-zа-яё0-9]+)(\040|\t|\&nbsp\;)?(\:|\)|\,|\&hellip\;|(?:\!|\?)+)([а-яёa-z])/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] ,  "#{m[1]}#{m[2]}#{m[4]} #{m[5]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['autospace_after_pmarks'] = Rule
