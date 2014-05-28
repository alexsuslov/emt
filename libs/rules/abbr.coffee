# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Abbr extends Quote
  description: "Сокращения"
  version:'0.0.0'
  configName:'Abbr'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "nobr_abbreviation",
    "nobr_acronym",
    "nobr_sm_im",
    "nobr_locations",
    "nbsp_before_unit",
    "nbsp_before_weight_unit",
    "nobr_before_unit_volt",
    "ps_pps",
    "nobr_vtch_itd_itp",
    "nbsp_te",
    "nbsp_money_abbr",
    "nbsp_org_abbr",
    "nobr_gost"
    ]

module.exports = Abbr

if typeof window isnt 'undefined'
  App.Rules.Abbr = Abbr