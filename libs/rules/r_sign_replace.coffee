# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена (R) на символ зарегистрированной торговой марки'
  version:'0.0.0'
  configName:'r_sign_replace'

  replace:->

    # Список правил
    rex = [
      /(.|^)\(r\)(.|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , "#{m[1]}&reg;#{m[2]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['r_sign_replace'] = Rule
