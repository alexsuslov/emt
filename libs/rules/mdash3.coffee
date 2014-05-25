# Зависимости
OpenQuote = require( './open_quote')

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Тире после знаков восклицания, троеточия и прочее'
  version:'0.0.0'
  configName:'mdash2'

  replace:->
    # return if @config.on
    self = @

    # Правило
    re = /(\.|\!|\?|\&hellip\;)(\040|\t|\&nbsp\;)(\-|\&mdash\;)(\040|\t|\&nbsp\;)/
    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str
        self.debug m

        m[1] + '&nbsp;&mdash;'

    !!m

module.exports = Rule

