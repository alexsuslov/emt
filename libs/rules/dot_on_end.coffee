# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило DotOnEnd

Точка в конце текста, если её там нет
###
class DotOnEnd extends OpenQuote
  description: 'Точка в конце текста, если её там нет'
  version:'0.0.0'
  configName:'dot_on_end'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё0-9])(|\040|\t|\&nbsp\;)*$/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0], "#{m[1]}."

    !!m

module.exports = DotOnEnd

if typeof window isnt 'undefined'
  App.Rules['dot_on_end'] = DotOnEnd
