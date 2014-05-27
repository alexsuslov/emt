# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class EmtDate extends Quote
  description: "Даты и дни"
  version:'0.0.0'
  configName:'EmtDate'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "years",
    "mdash_month_interval",
    "space_posle_goda",
    "nbsp_posle_goda_abbr",
    ]

module.exports = EmtDate
if typeof window isnt 'undefined'
  App.Rules['EmtDate'] = EmtDate
