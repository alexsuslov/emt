# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка союзов и предлогов к предыдущим словам в случае конца предложения'
  version:'0.0.0'
  configName:'nbsp_in_the_end'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё0-9\-]{3,}) ([a-zа-яё]{1,2})\.( [A-ZА-ЯЁ]|$)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , "#{m[1]}&nbsp;#{m[2]}#{m[3]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_in_the_end'] = Rule
