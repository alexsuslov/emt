# Зависимости
OpenQuote = require( './open_quote')

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: "Тире после кавычек, скобочек, пунктуации"
  version:'0.0.0'
  configName:'mdush'

  apply:->
    # return if @config.on
    self = @

    # Правило
    re = /([a-zа-яё0-9]+|\,|\:|\)|\&(ra|ld)quo\;|\|\"|\>)(\040|\t)(—|\-|\&mdash\;)(\s|$|\<)/i

    # Замена
    @text = @text.replace re , (str)->
      self.debug str

      m = str.match re
      self.debug m

      m[1] + '&nbsp;&mdash;' + m[5]
    @

module.exports = Rule

