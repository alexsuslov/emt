# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Оптическое выравнивание"
###
class OptAlign extends Quote
  description: "Оптическое выравнивание"
  version:'0.0.0'
  configName:'OptAlign'
  classes:[
    oa_obracket_sp_s : "margin-right:0.3em;"
    oa_obracket_sp_b : "margin-left:-0.3em;"
    oa_obracket_nl_b : "margin-left:-0.3em;"
    oa_comma_b       : "margin-right:-0.2em;"
    oa_comma_e       : "margin-left:0.2em;"
    oa_oquote_nl     : "margin-left:-0.44em;"
    oa_oqoute_sp_s   : "margin-right:0.44em;"
    oa_oqoute_sp_q   : "margin-left:-0.44em;"
  ]

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "oa_oquote"
    # 'oa_obracket_coma'
    ]

module.exports = OptAlign

if typeof window isnt 'undefined'
  App.Rules.OptAlign = OptAlign
