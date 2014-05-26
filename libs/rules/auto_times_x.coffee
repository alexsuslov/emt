# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена x на символ × в размерных единицах'
  version:'0.0.0'
  configName:'auto_times_x'

  replace:->

    # Список правил
    rex = [
      /([^a-zA-Z><]|^)(\&times\;)?(\d+)(\040*)(x|х)(\040*)(\d+)([^a-zA-Z><]|$)/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      str = [ m[1], m[2], m[3], "&times;", m[7], m[8] ].join ''


      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

