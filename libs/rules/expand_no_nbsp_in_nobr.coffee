# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Удаление nbsp в nobr/nowrap тэгах'
  version:'0.0.0'
  configName:'expand_no_nbsp_in_nobr'

  replace:->
    # @todo function
    # # Список правил
    # rex = [
    #   /([^\d\>]|^)([\d]{1,2}\:[\d]{2})(-|\&mdash\;|\&minus\;)([\d]{1,2}\:[\d]{2})([^\d\<]|$)/i
    # ]


    # for re, idx in rex
    #   m = @text.match re
    #   break if m

    # if m

    #   @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    # !!m

module.exports = Rule

