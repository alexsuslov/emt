# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Неразрывный пробел в датах перед числом и месяцем'
  version:'0.0.0'
  configName:'nbsp_before_month'

  replace:->

    # Список правил
    rex = [
      /(\d)(\s)+(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря)([^\<]|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] ,  "#{m[1]}&nbsp;#{m[3]}#{m[4]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_before_month'] = Rule
