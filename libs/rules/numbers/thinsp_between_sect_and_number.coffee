# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел между параграфом и числом'
  version:'0.0.0'
  configName:'thinsp_between_sect_and_number'

  replace:->

    # Список правил
    rex = [
      /(§|\&sect\;)(\s|&nbsp;)*(\d+|[IVX]+|[a-zа-яё]+)/i
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "&sect;&thinsp;#{m[3]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['thinsp_between_sect_and_number'] = Rule
