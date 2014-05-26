# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел после года'
  version:'0.0.0'
  configName:'nbsp_posle_goda_abbr'

  replace:->
    # Список правил
    rex = [
     /(^|\040|\&nbsp\;|\"|\&laquo\;)([0-9]{3,4})[ ]?(г\.)([^a-zа-яё]|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[3]}#{m[5]}"

    !!m

module.exports = Rule

