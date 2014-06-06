# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote
###
Правило Акцент AcuteAccent
###
class AcuteAccent extends OpenQuote
  description: 'Акцент'
  version:'0.0.0'
  configName:'acute_accent'

  replace:->
    # Список правил
    rex = [
     /([уеыаоэяиюё])\`([а-яё])/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = AcuteAccent

if typeof window isnt 'undefined'
  App.Rules['acute_accent'] = AcuteAccent
