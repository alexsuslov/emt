# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote
###
Правило PlusMinus
###
class PlusMinus extends OpenQuote
  description: 'Замена +/- на символ &plusmn;'
  version:'0.0.0'
  configName:'plus_minus'

  replace:->
    # Список правил
    rex = [
     /\+\/\-/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace re , "&plusmn;"

    !!m

module.exports = PlusMinus

if typeof window isnt 'undefined'
  App.Rules['plus_minus'] = PlusMinus
