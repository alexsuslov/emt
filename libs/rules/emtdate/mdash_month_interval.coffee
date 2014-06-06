# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка тире и объединение в неразрывные периоды месяцев'
  version:'0.0.0'
  configName:'mdash_month_interval'

  replace:->
    # Список правил
    rex = [
      /((январ|феврал|сентябр|октябр|ноябр|декабр)([ьяюе]|[её]м)|(апрел|июн|июл)([ьяюе]|ем)|(март|август)([ауе]|ом)?|ма[йяюе]|маем)\-((январ|феврал|сентябр|октябр|ноябр|декабр)([ьяюе]|[её]м)|(апрел|июн|июл)([ьяюе]|ем)|(март|август)([ауе]|ом)?|ма[йяюе]|маем)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}&mdash;#{m[8]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash_month_interval'] = Rule
