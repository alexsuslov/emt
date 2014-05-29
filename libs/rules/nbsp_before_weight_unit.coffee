# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

###
Правило NbspBeforeWeightUnit
###
class NbspBeforeWeightUnit extends OpenQuote
  description: 'Замена символов и привязка сокращений в весовых величинах: г, кг, мг…'
  version:'0.0.0'
  configName:'nbsp_before_weight_unit'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\&nbsp\;|\,)(\d+)(\s)?(г|кг|мг|т)(\s|\.|\!|\?|\,|$|\&nbsp\;|\;)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[4]}#{m[5]}"

    !!m

module.exports = NbspBeforeWeightUnit

if typeof window isnt 'undefined'
  App.Rules['nbsp_before_weight_unit'] = NbspBeforeWeightUnit
