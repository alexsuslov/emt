# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote
###
Правило Hellip

Замена трех точек на знак многоточия
###
class Hellip extends OpenQuote
  description: 'Замена трех точек на знак многоточия'
  version:'0.0.0'
  configName:'hellip'

  replace:->

    # Список правил
    rex = [
      /\.\.\./i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0], "&hellip;"

    !!m

module.exports = Hellip

if typeof window isnt 'undefined'
  App.Rules['hellip'] = Hellip
