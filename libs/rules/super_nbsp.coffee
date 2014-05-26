# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка союзов и предлогов к написанным после словам'
  version:'0.0.0'
  configName:'super_nbsp'

  replace:->

    # Список правил
    rex = [
      /(\s|^|\&(la|bd)quo\;|\>|\(|\&mdash\;\&nbsp\;)([a-zа-яё]{1,2}\s+)([a-zа-яё]{1,2}\s+)?([a-zа-яё0-9\-]{2,}|[0-9])/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = $m[1] + @Lib.trim(m[3]) + "&nbsp;"
      str += @Lib.trim(m[4]) + "&nbsp;" if m[4]
      str += $m[5]

      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

