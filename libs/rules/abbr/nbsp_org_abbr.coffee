# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote
###
Правило NbspOrgAbbr
###
class NbspOrgAbbr extends OpenQuote
  description: 'Привязка сокращений форм собственности к названиям организаций'
  version:'0.0.0'
  configName:'nbsp_org_abbr'

  replace:->
    # Список правил
    rex = [
      /([^a-zA-Zа-яёА-ЯЁ]|^)(ООО|ЗАО|ОАО|НИИ|ПБОЮЛ)\s([a-zA-Zа-яёА-ЯЁ]|\"|\&laquo\;|\&bdquo\;|<)/
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[3]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = NbspOrgAbbr

if typeof window isnt 'undefined'
  App.Rules['nbsp_org_abbr'] = NbspOrgAbbr
