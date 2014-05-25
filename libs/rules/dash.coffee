# Зависимости
Quote = require( './quote')

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
    "mdash_symbol_to_html_mdash",
    "mdash",
    "mdash_2",
    "mdash_3",
    "iz_za_pod",
    "to_libo_nibud",
    "koe_kak",
    "ka_de_kas"
    ]

exports.module = Dash
