# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Форматирование денежных сокращений (расстановка пробелов и привязка названия валюты к числу)'
  version:'0.0.0'
  configName:'nbsp_money_abbr'

  replace:->

    # Список правил
    rex = [
      /(\d)((\040|\s)?(тыс|млн|млрд)\.?(\040|\&nbsp\;)?)?(\040|\&nbsp\;)?(руб\.|долл\.|евро|€|&euro;|\$|у[\.]? ?е[\.]?)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = m[1] + (if m[4] then "&nbsp;" + m[4] + (
          if m[4] is "тыс" then '.' else ''
          ) else '' ) + "&nbsp;" + (
        if m[7].match /у[\\\\.]? ?е[\\\\.]?/i then "у.е." else m[7]
        )



      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_money_abbr'] = Rule
