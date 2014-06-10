# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Тире после переноса строки'
  version:'0.0.0'
  configName:'mdash2'

  replace:->
    # return if @config.on
    self = @

    # Правило
    re = /(\n|\r|^|\>)(\-|\&mdash\;)(\t|\040)/
    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , m[1] + '&nbsp;&mdash;'




    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash2'] = Rule
