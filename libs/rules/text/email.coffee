# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Выделение эл. почты из текста'
  version:'0.0.0'
  configName:'email'

  replace:->

    # Список правил
    rex = [
      /(\s|^|\&nbsp\;|\()([a-z0-9\-\_\.]{2,})\@([a-z0-9\-\.]{2,})\.([a-z]{2,6})(\)|\s|\.|\,|\!|\?|$|\<)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      tag = @ntag(m[2] + "@" + m[3] + "." + m[4], "a", {href:"mailto:" + m[2] + "@" + m[3] + "." + m[4]})

      @text = @text.replace m[0] , m[1]+ tag + m[5]

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['email'] = Rule
