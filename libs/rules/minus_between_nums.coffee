# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило MinusBetweenNums

Расстановка знака минус между числами
###
class MinusBetweenNums extends OpenQuote
  description: 'Расстановка знака минус между числами'
  version:'0.0.0'
  configName:'minus_between_nums'

  # Замена
  replace:->
    # Список правил
    rex = [
      /(\d+)\-(\d)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag($m[2].$m[3], "span", array("class"=>"nowrap")) . $m[6]'
      @text = @text.replace m[0] , "#{m[1]}&minus;#{m[2]}"

    # !!m

module.exports = MinusBetweenNums

if typeof window isnt 'undefined'
  App.Rules['minus_between_nums'] = MinusBetweenNums
