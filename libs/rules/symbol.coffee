# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Symbol extends Quote
  description: "Текст и абзацы"
  version:'0.0.0'
  configName:'Symbol'

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "tm_replace"
    "r_sign_replace"
    "copy_replace"
    "apostrophe"
    "degree_f"
    "euro_symbol"
    "arrows_symbols"
    "plus_minus"
    ]

module.exports = Symbol

if typeof window isnt 'undefined'
  App.Rules.Symbol = Symbol
