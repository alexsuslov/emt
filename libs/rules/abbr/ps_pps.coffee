# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

###
Правило PsPps

Объединение сокращений P.S., P.P.S.
###
class PsPps extends OpenQuote
  description: 'Объединение сокращений P.S., P.P.S.'
  version:'0.0.0'
  configName:'ps_pps'

  replace:->
    # Список правил
    rex = [
      /(^|\s)(p\.\s?)(p\.\s?)?(s\.)(\s|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      content = @Lib.trim( m[2] ) + ' '
      content += @Lib.trim( m[3] ) + ' ' if m[3]

      reStr = m[1] + @ntag( content + m[4] , "span", {class:"nowrap"} ) + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = PsPps

if typeof window isnt 'undefined'
  App.Rules['ps_pps'] = PsPps
