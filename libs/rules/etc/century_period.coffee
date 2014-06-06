# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило CenturyPeriod
##
class CenturyPeriod extends OpenQuote
  description: 'Тире между диапазоном веков'
  version:'0.0.0'
  configName:'century_period'

  replace:->
    # Список правил
    rex = [
      /(\040|\t|\&nbsp\;|^)([XIV]{1,5})(-|\&mdash\;)([XIV]{1,5})(( |\&nbsp\;)?(в\.в\.|вв\.|вв|в\.|в))/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = m[1] + @ntag( m[2] + "&mdash;"+ m[4] + " вв.","span", {class:"nowrap"})
      @text = @text.replace m[0] , str

    !!m

module.exports = CenturyPeriod
if typeof window isnt 'undefined'
  App.Rules['century_period'] = CenturyPeriod


