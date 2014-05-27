# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел после года'
  version:'0.0.0'
  configName:'space_posle_goda'

  replace:->
    # Список правил
    rex = [
     /(^|\040|\&nbsp\;)([0-9]{3,4})(год([ауе]|ом)?)([^a-zа-яё]|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}#{m[2]} #{m[3]}#{m[5]}"

    !!m

module.exports = Rule

