# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило FixPmarks

Замена сдвоенных знаков препинания на одинарные
###
class FixPmarks extends OpenQuote
  description: 'Замена сдвоенных знаков препинания на одинарные'
  version:'0.0.0'
  configName:'fix_pmarks'

  replace:->

    # Список правил
    rex = [
      /([^\!\?])\.\./
      /([a-zа-яё0-9])(\!|\.)(\!|\.|\?)(\s|$|\<)/i
      /([a-zа-яё0-9])(\?)(\?)(\s|$|\<)/i
    ]
    res = [
      (m)->
        "#{m[1]}."
    ,
      (m)->
        "#{m[1]}#{m[2]}#{m[4]}"
    ,
      (m)->
        "#{m[1]}#{m[2]}#{m[4]}"

    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0], res[idx] m

    !!m

module.exports = FixPmarks

if typeof window isnt 'undefined'
  App.Rules['fix_pmarks'] = FixPmarks
