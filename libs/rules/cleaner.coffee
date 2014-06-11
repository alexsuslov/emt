# Зависимости
Quote = require( './quote') unless Quote

###
# Групповой Объект правил Чистка
###
class Cleaner extends Quote
  description: "Чистка"
  version:'0.0.0'
  configName:'Cleaner'

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "rm_sp"
    ]

module.exports = Cleaner

if typeof window isnt 'undefined'
  App.Rules.Cleaner = Cleaner
