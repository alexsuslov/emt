# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

###
Правило NobrGost

Привязка сокращения ГОСТ к номеру
###
class NobrGost extends OpenQuote
  description: 'Привязка сокращения ГОСТ к номеру'
  version:'0.0.0'
  configName:'nobr_gost'

  replace:->
    # Список правил
    rex = [
      /(\040|\t|\&nbsp\;|^)ГОСТ( |\&nbsp\;)?(\d+)((\-|\&minus\;|\&mdash\;)(\d+))?(( |\&nbsp\;)(\-|\&mdash\;))?/i
      /(\040|\t|\&nbsp\;|^|\>)ГОСТ( |\&nbsp\;)?(\d+)(\-|\&minus\;|\&mdash\;)(\d+)/i
    ]
    res = [
      (m)=>
        ndash = (if m[6] then "&ndash;" + m[6] else "")
        mdash = (if m[7] then " &mdash;" else "")
        m[1] + @ntag( "ГОСТ " + m[3] + ndash + mdash, "span", {class: "nowrap"})
      (m)->
        "m[1]\"ГОСТ \"m[3]\"&ndash;\"m[5]"

    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , res[idx]( m )

    !!m

module.exports = NobrGost

if typeof window isnt 'undefined'
  App.Rules['nobr_gost'] = NobrGost
