# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Обрамление пятисимвольных слов разделенных дефисом в неразрывные блоки'
  version:'0.0.0'
  configName:'hyphen_nowrap'

  replace:->

    # Список правил
    rex = [
      /(\&nbsp\;|\s|\>|^)([a-zа-яё]{1}\-[a-zа-яё]{4}|[a-zа-яё]{2}\-[a-zа-яё]{3}|[a-zа-яё]{3}\-[a-zа-яё]{2}|[a-zа-яё]{4}\-[a-zа-яё]{1}|когда\-то|кое\-как|кой\-кого|вс[её]\-таки|[а-яё]+\-(кась|ка|де))(\s|\.|\,|\!|\?|\&nbsp\;|\&hellip\;|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag($m[2], "span", array("class"=>"nowrap")) . $m[4]'
      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[4]}C#{m[6]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['hyphen_nowrap'] = Rule
