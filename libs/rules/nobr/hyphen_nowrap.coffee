# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило HyphenNowrap
##
class HyphenNowrap extends OpenQuote
  description: 'Отмена переноса слова с дефисом'
  version:'0.0.0'
  configName:'hyphen_nowrap'

  replace:->

    # Список правил
    rex = [
      /iuie/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , m[1] + @ntag( m[2] + m[3], "span", class:"nowrap") + m[6]

    !!m

module.exports = HyphenNowrap

if typeof window isnt 'undefined'
  App.Rules['hyphen_nowrap'] = HyphenNowrap
