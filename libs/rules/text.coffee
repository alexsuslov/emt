# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Text extends Quote
  description: "Текст и абзацы"
  version:'0.0.0'
  configName:'text'

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "auto_links",
    "email",
    "no_repeat_words",
    'paragraphs'
    # 'breakline'
    ]

module.exports = Text

if typeof window isnt 'undefined'
  App.Rules.Text = Text
