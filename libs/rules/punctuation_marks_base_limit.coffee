# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило PunctuationMarksBaseLimit

Лишние запятые, двоеточия, точки с запятой
###
class PunctuationMarksBaseLimit extends OpenQuote
  description: 'Лишние запятые, двоеточия, точки с запятой'
  version:'0.0.0'
  configName:'punctuation_marks_base_limit'

  replace:->

    # Список правил
    rex = [
      /([\,]|[\:]|[\;]]){2,}/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , "#{m[1]}"

    !!m

module.exports = PunctuationMarksBaseLimit

if typeof window isnt 'undefined'
  App.Rules['punctuation_marks_base_limit'] = PunctuationMarksBaseLimit
