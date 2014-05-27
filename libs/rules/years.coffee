# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Установка тире и пробельных символов в периодах дат'
  version:'0.0.0'
  configName:'years'

  replace:->
    # Список правил
    rex = [
      /(с|по|период|середины|начала|начало|конца|конец|половины|в|между|\([cс]\)|\&copy\;)(\s+|\&nbsp\;)([\d]{4})(-|\&minus\;)([\d]{4})(( |\&nbsp\;)?(г\.г\.|гг\.|гг|г\.|г)([^а-яёa-z]))?/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2]
      if parseInt [3] >=  parseInt m[5]
        reStr += m[3] + m[4] + m[5]
      else
        reStr += m[3] + "&mdash;" + m[5]

      reStr += "&nbsp;гг." if m[6]
      reStr += m[9] if m[9]

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['years'] = Rule
