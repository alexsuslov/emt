# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило NobrAbbreviation

Расстановка пробелов перед сокращениями dpi, lpi
###
class NobrAbbreviation extends OpenQuote
  description: 'Расстановка пробелов перед сокращениями dpi, lpi'
  version:'0.0.0'
  configName:'nobr_abbreviation'

  replace:->
    # return if @config.on
    self = @
    use = 0

    # Правило
    rex = [
      /(\s+|^|\>)(\d+)(\040|\t)*(dpi|lpi)([\s\;\.\?\!\:\(]|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = NobrAbbreviation

if typeof window isnt 'undefined'
  App.Rules['nobr_abbreviation'] = NobrAbbreviation
