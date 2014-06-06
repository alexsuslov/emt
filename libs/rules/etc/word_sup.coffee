# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Надстрочный текст после символа ^'
  version:'0.0.0'
  configName:'word_sup'

  replace:->
    # Список правил
    rex = [
      /((\s|\&nbsp\;|^)+)\^([a-zа-яё0-9\.\:\,\-]+)(\s|\&nbsp\;|$|\.$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = @ntag( @ntag( m[3], "small"), "sup" ) + m[4]
      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['word_sup'] = Rule
