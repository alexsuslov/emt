# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка градусов к числу'
  version:'0.0.0'
  configName:'nbsp_celcius'

  replace:->

    # Список правил
    rex = [
      /(\s|^|\>|\&nbsp\;)(\d+)(\s)?(°|\&deg\;)(C|С)(\s|\.|\!|\?|\,|$|\&nbsp\;|\;)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[4]}C#{m[6]}"

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_celcius'] = Rule
