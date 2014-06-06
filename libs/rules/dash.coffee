# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Dash extends Quote
  description: "Дефисы и тире"
  version:'0.0.0'
  configName:'Dash'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "mdash_2_html",
    "mdash",
    "mdash2",
    "mdash3",
    "iz_za_pod",
    "to_libo_nibud",
    "koe_kak",
    "ka_de_kas"
    ]

module.exports = Dash
if typeof window isnt 'undefined'
  App.Rules['Dash'] = Dash
