# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Удаление лишних пробельных символов и табуляций'
  version:'0.0.0'
  configName:'many_spaces_to_one'

  replace:->

    # Список правил
    rex = [
      /(\s\s|\t\s|\t\t|\s\t)+/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] ,  ' '

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['many_spaces_to_one'] = Rule
