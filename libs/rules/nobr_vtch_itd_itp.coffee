# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение сокращений и т.д., и т.п., в т.ч.'
  version:'0.0.0'
  configName:'nobr_vtch_itd_itp'

  replace:->
    # Список правил
    rex = [
      /(^|\s|\&nbsp\;)и(\s|\&nbsp\;)т\.?[ ]?д(\.|$|\s|\&nbsp\;)/
      /(^|\s|\&nbsp\;)и(\s|\&nbsp\;)т\.?[ ]?п(\.|$|\s|\&nbsp\;)/
      /(^|\s|\&nbsp\;)в(\s|\&nbsp\;)т\.?[ ]?ч(\.|$|\s|\&nbsp\;)/
    ]

    res =[
      "и т. д."
      "и т. п."
      "и т. ч."
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      tag = @ntag( res[idx], "span", class:"nowrap")
      reStr = m[1] + tag + ( if m[3] isnt '.' then m[3] else '' )

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_vtch_itd_itp'] = Rule
