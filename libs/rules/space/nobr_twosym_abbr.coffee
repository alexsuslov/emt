# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Неразрывный перед 2х символьной аббревиатурой'
  version:'0.0.0'
  configName:'nobr_twosym_abbr'

  replace:->

    # Список правил
    rex = [
      /([a-zA-Zа-яёА-ЯЁ])(\s|\t)+([A-ZА-ЯЁ]{2})([\s\;\.\?\!\:\(\"]|\&(ra|ld)quo\;|$)/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , "#{m[1]}&nbsp;#{m[3]}#{m[4]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_twosym_abbr'] = Rule
