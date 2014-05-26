# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение сокращений и т.д., и т.п., в т.ч.'
  version:'0.0.0'
  configName:'nobr_vtch_itd_itp'

  replace:->
    # Список правил
    rex = [
      /(^|\s|\&nbsp\;)и( |\&nbsp\;)т\.?[ ]?д(\.|$|\s|\&nbsp\;)/
      /(^|\s|\&nbsp\;)и( |\&nbsp\;)т\.?[ ]?п(\.|$|\s|\&nbsp\;)/
      /(^|\s|\&nbsp\;)в( |\&nbsp\;)т\.?[ ]?ч(\.|$|\s|\&nbsp\;)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
        # '$m[1].$this->tag("и т. д.", "span",  array("class" => "nowrap")).($m[3]!="."? $m[3] : "" )',
        # '$m[1].$this->tag("и т. п.", "span",  array("class" => "nowrap")).($m[3]!="."? $m[3] : "" )',
        # '$m[1].$this->tag("в т. ч.", "span",  array("class" => "nowrap")).($m[3]!="."? $m[3] : "" )','
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

