# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Надстрочный текст после символа ^'
  version:'0.0.0'
  configName:'word_sup'

  replace:->
    # Список правил
    rex = [
      /((\s|\&nbsp\;|^)+)\^([a-zа-яё0-9\.\:\,\-]+)(\s|\&nbsp\;|$|\.$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '"" . $this->tag($this->tag($m[3],"small"),"sup") . $m[4]'
      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = Rule

