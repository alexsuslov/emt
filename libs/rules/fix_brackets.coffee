# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило FixBrackets

Лишние пробелы после открывающей скобочки и перед закрывающей
###
class FixBrackets extends OpenQuote
  description: 'Лишние пробелы после открывающей скобочки и перед закрывающей'
  version:'0.0.0'
  configName:'fix_brackets'

  # Правило для строки
  # функция не должна править строку так чтобы повторно срабатывать
  # @return false если правило не сработало
  replace:->

    # Список правил
    rex = [
      /(\()(\040|\t)+/
      /(\040|\t)+(\))/
    ]
    res  = [
      (m)->"#{m[1]}"
    ,
      (m)->"#{m[2]}"
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0], res[idx] m

    !!m

module.exports = FixBrackets

if typeof window isnt 'undefined'
  App.Rules['fix_brackets'] = FixBrackets
