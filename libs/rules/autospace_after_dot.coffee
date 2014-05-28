# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел после точки'
  version:'0.0.0'
  configName:'autospace_after_dot'

  replace:->

    # Список правил
    rex = [
      /(\040|\t|\&nbsp\;|^)([a-zа-яё0-9]+)(\040|\t|\&nbsp\;)?\.([а-яёa-z]{4,})/i
      /(\040|\t|\&nbsp\;|^)([a-zа-яё0-9]+)\.([а-яёa-z]{1,3})/i
    ]
    res = [
      (m)->
        "#{m[1]}#{m[2]}. #{m[4]}"
    ,
      (m)=>

        m[1] + m[2] + "." + ( if @Lib.strtolower( m[3] ) in @Lib.domain_zones then '\\' else " " ) + m[3]
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] ,  res[idx] m

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['autospace_after_dot'] = Rule
