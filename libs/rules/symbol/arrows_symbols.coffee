# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class ArrowsSymbols extends OpenQuote
  description: 'Замена стрелок вправо-влево на html коды'
  version:'0.0.0'
  configName:'arrows_symbols'

  replace:->

    # Список правил
    rex = [
      /(\s|\>|\&nbsp\;|^)\-\>($|\s|\&nbsp\;|\<)/
      /(\s|\>|\&nbsp\;|^|;)\<\-(\s|\&nbsp\;|$)/
      /→/
      /←/
    ]
    res = [
      (m)->
        "#{m[1]}&rarr;#{m[2]}"
    ,
      (m)->
        "#{m[1]}&larr;#{m[2]}"
    ,
      (m)->
        '&rarr;'
    ,
      (m)->
        '&larr;'
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , res[idx] m

    !!m

module.exports = ArrowsSymbols

if typeof window isnt 'undefined'
  App.Rules['arrows_symbols'] = ArrowsSymbols
