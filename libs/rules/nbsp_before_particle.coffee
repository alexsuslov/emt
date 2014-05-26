# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Неразрывный пробел перед частицей'
  version:'0.0.0'
  configName:'nbsp_before_particle'

  replace:->

    # Список правил
    rex = [
      /(\040|\t)+(ли|бы|б|же|ж)(\&nbsp\;|\.|\,|\:|\;|\&hellip\;|\?|\s)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      str = "&nbsp;#{m[2]}"
      str += $m[3] unless m[3] == "&nbsp;"

      @text = @text.replace m[0] , str

    # !!m

module.exports = Rule

