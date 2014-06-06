# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило  CopyReplace
##
class CopyReplace extends OpenQuote
  description: 'Замена (c) на символ копирайт'
  version:'0.0.0'
  configName:'copy_replace'

  replace:->

    # Список правил
    rex = [
      /\((c|с)\)\s+/i
      /\((c|с)\)($|\.|,|!|\?)/i
    ]
    res  = [
      (m)->'&copy;&nbsp;'
      (m)->"&copy;#{m[2]}"
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , res[idx] m

    !!m

module.exports = CopyReplace

if typeof window isnt 'undefined'
  App.Rules['copy_replace'] = CopyReplace
