# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение в неразрывные конструкции номеров телефонов'
  version:'0.0.0'
  configName:'phone_builder'

  replace:->

    # Список правил
    rex = [
      /([^\d\+]|^)([\+]?[0-9]{1,3})( |\&nbsp\;|\&thinsp\;)([0-9]{3,4}|\([0-9]{3,4}\))( |\&nbsp\;|\&thinsp\;)([0-9]{2,3})(-|\&minus\;)([0-9]{2})(-|\&minus\;)([0-9]{2})([^\d]|$)/
      /([^\d\+]|^)([\+]?[0-9]{1,3})( |\&nbsp\;|\&thinsp\;)([0-9]{3,4}|[0-9]{3,4})( |\&nbsp\;|\&thinsp\;)([0-9]{2,3})(-|\&minus\;)([0-9]{2})(-|\&minus\;)([0-9]{2})([^\d]|$)/
    ]



    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1]  .
      # (
      #   ($m[1] == ">" || $m[11] == "<") ? $m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10] :$this->tag($m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10], "span", array("class"=>"nowrap")
      #     )
      #   ).$m[11]',
      # '$m[1]  .(($m[1] == ">" || $m[11] == "<") ? $m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10] :$this->tag($m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10], "span", array("class"=>"nowrap"))  ).$m[11]'
      if idx is 0
        str = m[1]

      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

