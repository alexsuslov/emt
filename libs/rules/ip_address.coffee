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

    # Список правил
    rex = [
      /(\s|\&nbsp\;|^)(\d{0,3}\.\d{0,3}\.\d{0,3}\.\d{0,3})/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      strIp = @nowrap_ip_address m[2]

      if strIp
        @text = @text.replace m[0] , strIp
      else
        return false

    !!m

  nowrap_ip_address:(ip)->
    triads = ip.split '.'
    for triad in triads
      return false unless 0 <= parseInt( triad ) <= 255
    @ntag triads.join('.'), 'span', class: "nowrap"

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['ip_address'] = Rule
