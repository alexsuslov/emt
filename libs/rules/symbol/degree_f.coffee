# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило  DegreeF
##
class DegreeF extends OpenQuote
  description: 'Градусы по Фаренгейту'
  version:'0.0.0'
  configName:'degree_f'

  replace:->

    # Список правил
    rex = [
      /([0-9]+)F($|\s|\.|\,|\;|\:|\&nbsp\;|\?|\!)/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = "" + @ntag( m[1] + " &deg;F", "span", {class:"nowrap"}) + m[2]
      @text = @text.replace m[0] , str

    !!m

module.exports = DegreeF

if typeof window isnt 'undefined'
  App.Rules['degree_f'] = DegreeF
