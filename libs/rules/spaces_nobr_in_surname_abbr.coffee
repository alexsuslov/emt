# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение IP-адресов'
  version:'0.0.0'
  configName:'spaces_nobr_in_surname_abbr'

  replace:->

    # Список правил
    rex = [
      /(\s|^|\.|\,|\;|\:|\?|\!|\&nbsp\;)([A-ZА-ЯЁ])\.?(\s|\&nbsp\;)?([A-ZА-ЯЁ])(\.(\s|\&nbsp\;)?|(\s|\&nbsp\;))([A-ZА-ЯЁ][a-zа-яё]+)(\s|$|\.|\,|\;|\:|\?|\!|\&nbsp\;)/
      /(\s|^|\.|\,|\;|\:|\?|\!|\&nbsp\;)([A-ZА-ЯЁ][a-zа-яё]+)(\s|\&nbsp\;)([A-ZА-ЯЁ])\.?(\s|\&nbsp\;)?([A-ZА-ЯЁ])\.?(\s|$|\.|\,|\;|\:|\?|\!|\&nbsp\;)/
    ]



    # for re, idx in rex
    #   m = @text.match re
    #   break if m

    # if m
    #   # '$m[1].$this->tag($m[2].". ".$m[4].". ".$m[8], "span",  array("class" => "nowrap")).$m[9]',
    #   # '$m[1].$this->tag($m[2]." ".$m[4].". ".$m[6].".", "span",  array("class" => "nowrap")).$m[7]'
    #   if idx is 0
    #     str = m[1]

    #   @text = @text.replace m[0] , str

    # !!m

module.exports = Rule

