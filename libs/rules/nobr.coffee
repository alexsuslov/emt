# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class NoBr extends Quote
  description: "Неразрывные конструкции"
  version:'0.0.0'
  configName:'NoBr'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "super_nbsp"
    "nbsp_v_kak_to"
    "nbsp_before_particle"
    "nbsp_celcius"
    "nbsp_in_the_end"
    "phone_builder"
    "ip_address"
    "spaces_nobr_in_surname_abbr"
    ]

module.exports = NoBr
if typeof window isnt 'undefined'
  App.Rules['NoBr'] = NoBr
