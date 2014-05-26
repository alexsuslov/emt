# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена символов и привязка сокращений в размерных величинах: м, см, м2…'
  version:'0.0.0'
  configName:'nbsp_before_unit'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\&nbsp\;|\,)(\d+)( |\&nbsp\;)?(м|мм|см|дм|км|гм|km|dm|cm|mm)(\s|\.|\!|\?|\,|$|\&plusmn\;|\;)/i
      /(\s|^|\>|\&nbsp\;|\,)(\d+)( |\&nbsp\;)?(м|мм|см|дм|км|гм|km|dm|cm|mm)([32]|&sup3;|&sup2;)(\s|\.|\!|\?|\,|$|\&plusmn\;|\;)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      if idx in [0]
        reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      else
        reStr = m[1] + m[2] + '&nbsp;' + m[4]

        if m[5] in [ "2", "3"]
          reStr += "&sup" + m[5] + ";"
        else
          reStr += m[5]

        reStr += m[6]

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

