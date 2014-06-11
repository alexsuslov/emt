# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote
###
Правило OaOquote

Расстановка знака минус между числами
###
class OaOquote extends OpenQuote
  description: 'Оптическое выравнивание открывающей кавычки'
  version:'0.0.0'
  configName:'oa_oquote'

  # Замена
  replace:->
    # Список правил
    rex = [
      /([a-zа-яё\-]{3,})(\s|\&nbsp\;|\t)(\&laquo\;)/i
      /(\n|\r|^)(\&laquo\;)/i
    ]
    res = [
      (m)=>
        m[1] + @ntag( m[2], "span", {class:"oa_oqoute_sp_s"} ) + @ntag( m[3], "span", {class:"oa_oqoute_sp_q"} )
    ,
      (m)=>
        m[1] + @ntag(m[2], "span", {class:"oa_oquote_nl"} )
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , res[idx] m

    !!m

module.exports = OaOquote

if typeof window isnt 'undefined'
  App.Rules['oa_oquote'] = OaOquote
