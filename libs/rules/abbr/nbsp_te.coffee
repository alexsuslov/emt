# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

###
Правило NbspTe

Обработка т.е.
###
class NbspTe extends OpenQuote
  description: 'Обработка т.е.'
  version:'0.0.0'
  configName:'nbsp_te'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё0-9\-]{3,})\s(те|т\.е|т\sе|т\s\.е)\.(\s[A-ZА-ЯЁ]|$)/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = m[1] + @ntag( m[2], "span",  {class: "nowrap"})
      @text = @text.replace m[0] , str

    !!m

module.exports = NbspTe

if typeof window isnt 'undefined'
  App.Rules['nbsp_te'] = NbspTe
