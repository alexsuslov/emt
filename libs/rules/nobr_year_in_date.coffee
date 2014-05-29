# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка года к дате'
  version:'0.0.0'
  configName:'nobr_year_in_date'

  replace:->
    # Список правил
    rex = [
      /(\s|\&nbsp\;)([0-9]{2}\.[0-9]{2}\.([0-9]{2})?[0-9]{2})(\s|\&nbsp\;)?г(\.|\s|\&nbsp\;)/i,
      /(\s|\&nbsp\;)([0-9]{2}\.[0-9]{2}\.([0-9]{2})?[0-9]{2})(\s|\&nbsp\;|\.(\s|\&nbsp\;|$)|$)/i
    ]

    res = [
      (m)=>
        tag = @ntag( m[2] + " г.", "span", {class:"nowrap"} )
        m[1] + tag + ( if m[5] is "." then "" else " ")
    ,
      (m)=>
        tag = @ntag( m[2] + " г.", "span", {class:"nowrap"} )
        m[1] + tag + m[4]
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , res[idx] m

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_year_in_date'] = Rule
