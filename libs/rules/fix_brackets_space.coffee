# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило FixBracketsSpace

Пробел перед открывающей скобочкой
###
class FixBracketsSpace extends OpenQuote
  description: 'Пробел перед открывающей скобочкой'
  version:'0.0.0'
  configName:'fix_brackets_space'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё0-9])(\()/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0], "#{m[1]} #{m[2]}"

    !!m

module.exports = FixBracketsSpace

if typeof window isnt 'undefined'
  App.Rules['fix_brackets_space'] = FixBracketsSpace
