# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Акцент'
  version:'0.0.0'
  configName:'acute_accent'

  replace:->
    # Список правил
    rex = [
     /(у|е|ы|а|о|э|я|и|ю|ё)\`(\w)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = Rule

