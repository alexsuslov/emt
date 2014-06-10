# Зависимости
Quote = require( './quote') unless Quote
###
Групповой Объект

Пунктуация и знаки препинания
###
class Punctmark extends Quote
  description: "Пунктуация и знаки препинания"
  version:'0.0.0'
  configName:'Punctmark'

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    'auto_comma'
    'punctuation_marks_limit'
    'punctuation_marks_base_limit'
    'hellip'
    'fix_excl_quest_marks'
    'fix_pmarks'
    'fix_brackets'
    'fix_brackets_space'
    # 'dot_on_end'
    ]

module.exports = Punctmark

if typeof window isnt 'undefined'
  App.Rules.Punctmark = Punctmark
