# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

###

Правило NbspMoneyAbbr

###
class NbspMoneyAbbr extends OpenQuote
  description: 'Форматирование денежных сокращений (расстановка пробелов и привязка названия валюты к числу)'
  version:'0.0.0'
  configName:'nbsp_money_abbr'

  replace:->

    # Список правил
    rex = [
      /(\d)(\s)?(тыс|млн|млрд)\.?(\s)?(у\.е\.|руб\.|долл\.|евро|€|&euro;|\$)/i
      /(\d)(\s)?(руб\.|долл\.|евро|€|&euro;|\$)/i
    ]
    res = [
      (m)->
        m[1] + '&nbsp;' + m[3] + '.' + '&nbsp;' + m[5]
      (m)->
        m[1] + '&nbsp;' + m[3]
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , res[idx] m

    !!m

module.exports = NbspMoneyAbbr

if typeof window isnt 'undefined'
  App.Rules['nbsp_money_abbr'] = NbspMoneyAbbr
