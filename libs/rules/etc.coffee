# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Etc extends Quote
  description: "Прочее"
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
    "acute_accent"
    ]

module.exports = Etc
if typeof window isnt 'undefined'
  App.Rules['Etc'] = Etc
