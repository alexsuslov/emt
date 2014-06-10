# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект
###
class Space extends Quote
  description: "Расстановка и удаление пробелов"
  version:'0.0.0'
  configName:'Space'

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
      'nobr_twosym_abbr'
      'remove_space_before_punctuationmarks'
      'autospace_after_comma'
      'autospace_after_pmarks'
      'autospace_after_dot'
      'autospace_after_hellips'
      'many_spaces_to_one'
      'clear_percent'
      'nbsp_before_open_quote'
      'nbsp_before_month'
      'spaces_on_end'
    ]

module.exports = Space

if typeof window isnt 'undefined'
  App.Rules.Space = Space
