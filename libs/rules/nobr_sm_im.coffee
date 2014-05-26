# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка пробелов перед сокращениями см., им.'
  version:'0.0.0'
  configName:'nobr_sm_im'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\()(см|им)\.(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

