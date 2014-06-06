# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило AutoLinks
##
class AutoLinks extends OpenQuote
  description: 'Выделение ссылок из текста'
  version:'0.0.0'
  configName:'auto_links'

  replace:->

    # Список правил
    rex = [
      /(\s|^)(http|ftp|mailto|https)(:\/\/)([^\s\,\!\<]{4,})(\s|\.|\,|\!|\?|\<|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      subM4 = m[4].substr(-1)
      pntM4 = ( if subM4 is "." then '.' else m[4])

      str =  m[1] +  @ntag( pntM4 , "a" , {href : m[2] + m[3] + pntM4} ) + ( if m[4].substr(-1) is "." then "." else "") + m[5]

      @text = @text.replace m[0] , str

    !!m

module.exports = AutoLinks

if typeof window isnt 'undefined'
  App.Rules['auto_links'] = AutoLinks
