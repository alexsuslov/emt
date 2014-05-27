# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Тире между диапозоном веков'
  version:'0.0.0'
  configName:'time_interval'

  replace:->
    # Список правил
    rex = [
      /([^\d\>]|^)([\d]{1,2}\:[\d]{2})(-|\&mdash\;|\&minus\;)([\d]{1,2}\:[\d]{2})([^\d\<]|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag($m[2]."&mdash;".$m[4],"span", array("class"=>"nowrap")).$m[5]'
      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['time_interval'] = Rule
