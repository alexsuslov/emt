# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Symbol extends Quote
  description: "Текст и абзацы"
  version:'0.0.0'
  configName:'Symbol'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "tm_replace",
    "r_sign_replace",
    "copy_replace",
    "apostrophe",
    "degree_f",
    "euro_symbol",
    "arrows_symbols",
    ]

module.exports = Symbol

if typeof window isnt 'undefined'
  App.Rules.Symbol = Symbol
