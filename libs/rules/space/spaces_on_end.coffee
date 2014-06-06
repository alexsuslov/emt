# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Удаление пробелов в конце текста'
  version:'0.0.0'
  configName:'spaces_on_end'

  replace:->

    # Список правил
    rex = [
      /(\s+$)/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace re ,  ''

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['spaces_on_end'] = Rule
