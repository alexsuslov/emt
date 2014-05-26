# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Неразрывный пробел в как то'
  version:'0.0.0'
  configName:'nbsp_v_kak_to'

  replace:->

    # Список правил
    rex = [
      /как то\:/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "как&nbsp;то:"

    # !!m

module.exports = Rule

