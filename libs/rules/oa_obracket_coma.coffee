# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило OaObracketComa

Оптическое выравнивание для пунктуации (скобка и запятая)
###
class OaObracketComa extends OpenQuote
  description: 'Оптическое выравнивание для пунктуации (скобка и запятая)'
  version:'0.0.0'
  configName:'oa_obracket_coma'

  # Замена
  replace:->
    # Список правил
    rex = [
      /(\040|\&nbsp\;|\t)\(/i
      /(\n|\r|^)\(/i
      /([а-яёa-z0-9]+)\,(\040+)/i
    ]
    res = [
      (m)=>
        @ntag( m[1], "span", {class:"oa_obracket_sp_s"}) + @ntag("(", "span", {class:"oa_obracket_sp_b"})
    ,
      (m)=>
        m[1] + @ntag( "(", "span", {class:"oa_obracket_nl_b"})
    ,
      (m)=>
        m[1] + @ntag(",", "span", {class:"oa_comma_b"}) + @ntag(" ", "span", {class:"oa_comma_e"})
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , res[idx] m

    !!m

module.exports = OaObracketComa

if typeof window isnt 'undefined'
  App.Rules['oa_obracket_coma'] = OaObracketComa
