# Зависимости
OpenQuote = require( './open_quote')

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка тире и объединение в неразрывные периоды дней'
  version:'0.0.0'
  configName:'nbsp_and_dash_month_interval'

  replace:->
    # Список правил
    rex = [
      /([^\>]|^)(\d+)(\-|\&minus\;|\&mdash\;)(\d+)( |\&nbsp\;)(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря)([^\<]|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      # 'm[1].$this->tag($m[2]."&mdash;".$m[4]." ".$m[6],"span", array("class"=>"nowrap")).$m[7]'

      @text = @text.replace m[0] , "#{m[1]}&mdash;#{m[8]}"

    !!m

module.exports = Rule

