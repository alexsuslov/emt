# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка пробелов в сокращениях г., ул., пер., д.'
  version:'0.0.0'
  configName:'nobr_locations'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>)(г|ул|пер|просп|пл|бул|наб|пр|ш|туп)\.(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i
      /(\s|^|\>)(б\-р|пр\-кт)(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i
      /(\s|^|\>)(д|кв|эт)\.(\040|\t)*(\d+)(\s|\.|\,|\?|\!|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      if idx is 1
        reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      else
        reStr = m[1] + m[2] + '.&nbsp;' + m[4] + m[5]

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

