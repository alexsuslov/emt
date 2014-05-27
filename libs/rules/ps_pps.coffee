# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение сокращений P.S., P.P.S.'
  version:'0.0.0'
  configName:'ps_pps'

  replace:->
    # Список правил
    rex = [
      /(^|\040|\t|\>|\r|\n)(p\.\040?)(p\.\040?)?(s\.)([^\<])/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag(trim($m[2]) . " " . ($m[3] ? trim($m[3]) . " " : ""). $m[4], "span",  array("class" => "nowrap") ).$m[5] '
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['ps_pps'] = Rule
