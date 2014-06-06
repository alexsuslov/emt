# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote
###
Правило FixExclQuestMarks

Замена восклицательного и вопросительного знаков местами
###
class FixExclQuestMarks extends OpenQuote
  description: 'Замена восклицательного и вопросительного знаков местами'
  version:'0.0.0'
  configName:'fix_excl_quest_marks'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё0-9])\!\?(\s|$|\<)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0], "#{m[1]}?!#{m[2]}"

    !!m

module.exports = FixExclQuestMarks

if typeof window isnt 'undefined'
  App.Rules['fix_excl_quest_marks'] = FixExclQuestMarks
