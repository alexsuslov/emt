# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка пробелов перед сокращениями гл., стр., рис., илл., ст., п.'
  version:'0.0.0'
  configName:'nobr_acronym'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\()(гл|стр|рис|илл?|ст|п|с)\.(\040|\t)*(\d+)(\&nbsp\;|\s|\.|\,|\?|\!|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule
if typeof window isnt 'undefined'
  App.Rules['nobr_acronym'] = Rule


