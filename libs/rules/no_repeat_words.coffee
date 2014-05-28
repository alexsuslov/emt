# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Удаление повторяющихся слов'
  version:'0.0.0'
  configName:'email'

  replace:->

    # Список правил
    rex = [
      /([а-яё]{3,})( |\t|\&nbsp\;)\1/i
      /(\s|\&nbsp\;|^|\.|\!|\?)(([А-ЯЁ])([а-яё]{2,}))( |\t|\&nbsp\;)(([а-яё])\4)/
    ]
    res = [
      (m)->
        m[1]
    ,
      (m)=>
        m[1] + ( if m[7] is @Lib.strtolower( m[3]) then m[2] else m[2] + m[5] + m[6] )
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , res[idx] m

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['no_repeat_words'] = Rule
