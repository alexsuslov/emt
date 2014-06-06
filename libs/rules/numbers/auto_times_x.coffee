# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило AutoTimesX
##
class AutoTimesX extends OpenQuote
  description: 'Замена x на символ × в размерных единицах'
  version:'0.0.0'
  configName:'auto_times_x'

  replace:->

    # Список правил
    rex = [
      /(\d+)(x|х)(\d+)(x|х)(\d+)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      str = [ m[1], "&times;", m[3], "&times;", m[5]].join ''

      @text = @text.replace m[0] , str

    !!m

module.exports = AutoTimesX

if typeof window isnt 'undefined'
  App.Rules['auto_times_x'] = AutoTimesX


