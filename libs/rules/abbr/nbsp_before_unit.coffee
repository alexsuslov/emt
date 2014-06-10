# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote
### Правило NbspBeforeUnit
Замена символов и привязка сокращений в весовых величинах: г, кг, мг…
###
class NbspBeforeUnit extends OpenQuote
  description: 'Замена символов и привязка сокращений в весовых величинах: г, кг, мг…'
  version:'0.0.0'
  configName:'nbsp_before_unit'

  replace:->
    # Список правил
    rex = [
      new RegExp @re.prefix + /(\d+)(\s)?/.source + @re.ed + @re.sufix, 'i'
      new RegExp @re.prefix + /(\d+)(\s)?/.source +
      @re.ed + /([32]|&sup3;|&sup2;)/.source + @re.sufix , 'i'
    ]
    # console.log rex[1]
    strs = [
      (m)->
        m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      (m)->
        str = m[1] + m[2] + "&nbsp;" + m[4]
        if m[5] in ["3", "2"]
          str += "&sup" + m[5] + ";"
        else
           str += m[5]
        str + m[6]

      ]


    for re, idx in rex
      m = @text.match re
      break if m
    if m
      @text = @text.replace m[0] , strs[idx](m)

    !!m

module.exports = NbspBeforeUnit

if typeof window isnt 'undefined'
  App.Rules['nbsp_before_unit'] = NbspBeforeUnit
