# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило ClearPercent
##
class ClearPercent extends OpenQuote
  description: 'Удаление пробела перед символом процента'
  version:'0.0.0'
  configName:'clear_percent'

  replace:->

    # Список правил
    rex = [
      /(\d+)([\t\040]+)\%/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] ,  "#{m[1]}%"

    !!m

module.exports = ClearPercent

if typeof window isnt 'undefined'
  App.Rules['clear_percent'] = ClearPercent
