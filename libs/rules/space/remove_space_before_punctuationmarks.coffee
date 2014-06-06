# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Удаление пробела перед точкой, запятой, двоеточием, точкой с запятой'
  version:'0.0.0'
  configName:'remove_space_before_punctuationmarks'

  replace:->

    # Список правил
    rex = [
      /((\040|\t|\&nbsp\;)+)([\,\:\.\;\?])(\s+|$)/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '\3\4'
      @text = @text.replace m[0] , "#{m[3]}#{m[4]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['remove_space_before_punctuationmarks'] = Rule
