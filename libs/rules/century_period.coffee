# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Тире между диапозоном веков'
  version:'0.0.0'
  configName:'century_period'

  replace:->
    # Список правил
    rex = [
      /(\040|\t|\&nbsp\;|^)([XIV]{1,5})(-|\&mdash\;)([XIV]{1,5})(( |\&nbsp\;)?(в\.в\.|вв\.|вв|в\.|в))/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] .$this->tag($m[2]."&mdash;".$m[4]." вв.","span", array("class"=>"nowrap"))'
      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = Rule

