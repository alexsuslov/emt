# Зависимости
OpenQuote = require( './open_quote')

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: "Замена символа тире на html конструкцию"
  version:'0.0.0'
  configName:'mdush2html'
  config:
    on: true
    log: true
    debug:true

  replace:->
    use = true
    @text = @text.replace /-/ , ->
      use = false
      '&mdash;'
    use

module.exports = Rule

