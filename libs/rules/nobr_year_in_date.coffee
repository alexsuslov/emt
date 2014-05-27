# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка года к дате'
  version:'0.0.0'
  configName:'nobr_year_in_date'

  replace:->
    # Список правил
    rex = [
      /(\s|\&nbsp\;)([0-9]{2}\.[0-9]{2}\.([0-9]{2})?[0-9]{2})(\s|\&nbsp\;)?г(\.|\s|\&nbsp\;)/i,
      /(\s|\&nbsp\;)([0-9]{2}\.[0-9]{2}\.([0-9]{2})?[0-9]{2})(\s|\&nbsp\;|\.(\s|\&nbsp\;|$)|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # if idx is 0
      #   str = m[1].$this->tag($m[2]." г.","span", array("class"=>"nowrap")).($m[5]==="."?"":" ")'
      # else
      #     '$m[1].$this->tag($m[2],"span", array("class"=>"nowrap")).$m[4]'
      # # 'm[1].$this->tag($m[2]."&mdash;".$m[4]." ".$m[6],"span", array("class"=>"nowrap")).$m[7]'

      @text = @text.replace m[0] , "#{m[1]}&mdash;#{m[8]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_year_in_date'] = Rule
