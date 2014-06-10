# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Numbers extends Quote
  description: "Сокращения"
  version:'0.0.0'
  configName:'Numbers'

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "minus_between_nums"
    "minus_in_numbers_range"
    "auto_times_x"
    "numeric_sub"
    "numeric_sup"
    "simple_fraction"
    "math_chars"
    "thinsp_between_number_triads"
    "thinsp_between_no_and_number"
    "thinsp_between_sect_and_number"
    ]

module.exports = Numbers

if typeof window isnt 'undefined'
  App.Rules.Numbers = Numbers
