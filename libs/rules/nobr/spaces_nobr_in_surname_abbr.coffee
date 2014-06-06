# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка инициалов к фамилиям'
  version:'0.0.0'
  configName:'spaces_nobr_in_surname_abbr'

  replace:->

    # Список правил
    rex = [
      /(\s|^|\.|\,|\;|\:|\?|\!|\&nbsp\;)([A-ZА-ЯЁ])\.?(\s|\&nbsp\;)?([A-ZА-ЯЁ])(\.(\s|\&nbsp\;)?|(\s|\&nbsp\;))([A-ZА-ЯЁ][a-zа-яё]+)(\s||\.|\,|\;|\:|\?|\!|\&nbsp\;)/
      /(\s|^|\.|\,|\;|\:|\?|\!|\&nbsp\;)([A-ZА-ЯЁ][a-zа-яё]+)(\s|\&nbsp\;)([A-ZА-ЯЁ])\.?(\s|\&nbsp\;)?([A-ZА-ЯЁ])\.?(\s|$|\.|\,|\;|\:|\?|\!|\&nbsp\;)/
    ]
    res = [
      (m)=>
        m[1] + @ntag(m[2] + ". " + m[4] + ". " + m[8], "span", {class:"nowrap"}) + m[9]
    ,
      (m)=>
        m[1] + @ntag(m[2] + " " + m[4] + ". " + m[6] + ".", "span",  {class:"nowrap"}) + m[7]
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , res[idx] m

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['spaces_nobr_in_surname_abbr'] = Rule
