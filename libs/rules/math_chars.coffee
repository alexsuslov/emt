# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Математические знаки больше/меньше/плюс минус/неравно'
  version:'0.0.0'
  configName:'math_chars'

  replace:->

    # Список правил
    rex = [
      /!=/
      /\<=/
      /([^=]|^)\>=/
      /~=/
      /\+-/
    ]
    rep = [
      (m)->'&ne;'
      (m)->'&le;'
      (m)->"m[1]&ge;"
      (m)->'&cong;'
      (m)->'&plusmn;'
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , rep[idx] m

    !!m

module.exports = Rule

