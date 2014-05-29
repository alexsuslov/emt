# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
###
Правило PunctuationMarksLimit

Лишние восклицательные, вопросительные знаки и точки
###
class PunctuationMarksLimit extends OpenQuote
  description: 'Лишние восклицательные, вопросительные знаки и точки'
  version:'0.0.0'
  configName:'punctuation_marks_limit'

  replace:->

    # Список правил
    rex = [
      /([\!\.\?]){4,}/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , "#{m[1]}#{m[1]}#{m[1]}"

    !!m

module.exports = PunctuationMarksLimit

if typeof window isnt 'undefined'
  App.Rules['punctuation_marks_limit'] = PunctuationMarksLimit
