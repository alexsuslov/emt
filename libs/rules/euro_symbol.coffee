# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Символ евро'
  version:'0.0.0'
  configName:'euro_symbol'

  replace:->

    # Список правил
    rex = [
      /€/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , '&euro;'

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['euro_symbol'] = Rule
