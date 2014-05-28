# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена (tm) на символ торговой марки'
  version:'0.0.0'
  configName:'tm_replace'

  replace:->

    # Список правил
    rex = [
      /([\040\t])?\(tm\)/i
    ]
    res = [
      (m)->
        m[1]
    ,
      (m)=>
        m[1] + ( if m[7] is @Lib.strtolower( m[3]) then m[2] else m[2] + m[5] + m[6] )
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , '&trade;'

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['tm_replace'] = Rule
