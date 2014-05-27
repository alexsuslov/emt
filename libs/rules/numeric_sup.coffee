# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Верхний индекс'
  version:'0.0.0'
  configName:'numeric_sup'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё0-9])\^([\d]{1,3})([^а-яёa-z0-9]|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = m[1] + @tag( @tag( m[2], "small"), "sup") + m[3]

      @text = @text.replace m[0] , str


    !!m

module.exports = Rule

