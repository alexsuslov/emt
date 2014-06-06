# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: "Замена символа тире на html конструкцию"
  version:'0.0.0'
  configName:'mdash_2_html'
  config:
    on: true
    log: true
    debug:true

  replace:->
    m = @text.match /-/
    if m
      @text = @text.replace /-/ , ->
        '&mdash;'
    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash_2_html'] = Rule
