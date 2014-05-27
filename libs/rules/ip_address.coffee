# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение IP-адресов'
  version:'0.0.0'
  configName:'ip_address'

  replace:->

    # # Список правил
    # rex = [
    #   /(\s|\&nbsp\;|^)(\d{0,3}\.\d{0,3}\.\d{0,3}\.\d{0,3})/i
    # ]



    # for re, idx in rex
    #   m = @text.match re
    #   break if m

    # if m
    #   # '$m[1]  .
    #   # (
    #   #   ($m[1] == ">" || $m[11] == "<") ? $m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10] :$this->tag($m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10], "span", array("class"=>"nowrap")
    #   #     )
    #   #   ).$m[11]',
    #   # '$m[1]  .(($m[1] == ">" || $m[11] == "<") ? $m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10] :$this->tag($m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10], "span", array("class"=>"nowrap"))  ).$m[11]'
    #   if idx is 0
    #     str = m[1]

    #   @text = @text.replace m[0] , str

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['ip_address'] = Rule
