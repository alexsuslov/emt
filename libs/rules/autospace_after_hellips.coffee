# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило AutospaceAfterHellips
##
class AutospaceAfterHellips extends OpenQuote
  description: 'Пробел после знаков троеточий с вопросительным или восклицательными знаками'
  version:'0.0.0'
  configName:'autospace_after_hellips'

  replace:->

    # Список правил
    rex = [
      /([\?\!]\.\.)([а-яёa-z])/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] ,  "#{m[1]} #{m[2]}"

    !!m

module.exports = AutospaceAfterHellips

if typeof window isnt 'undefined'
  App.Rules['autospace_after_hellips'] = AutospaceAfterHellips
