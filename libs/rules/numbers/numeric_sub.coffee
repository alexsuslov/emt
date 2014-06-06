# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Нижний индекс'
  version:'0.0.0'
  configName:'numeric_sub'

  replace:->

    # # Список правил
    rex = [
      /([a-zа-яё0-9])\_([\d]{1,3})([^а-яёa-z0-9]|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = m[1] + @ntag( @ntag( m[2], "small"), "sub") + m[3]
      @text = @text.replace m[0] , str


    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['numeric_sub'] = Rule
