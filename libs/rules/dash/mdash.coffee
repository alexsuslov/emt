# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: "Тире после кавычек, скобочек, пунктуации"
  version:'0.0.0'
  configName:'mdash'

  replace:->
    # return if @config.on
    self = @
    use = true

    # Правило
    re = /([a-zа-яё0-9]+|\,|\:|\)|\&(ra|ld)quo\;|\|\"|\>)(\040|\t)(—|\-|\&mdash\;)(\s|$|\<)/
    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str
        self.debug m

        m[1] + '&nbsp;&mdash;' + m[5]
    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash'] = Rule
