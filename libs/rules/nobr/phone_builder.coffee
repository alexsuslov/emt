# Зависимости
OpenQuote = require( '../open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение в неразрывные конструкции номеров телефонов'
  version:'0.0.0'
  configName:'phone_builder'

  replace:->

    # Список правил
    rex = [
      /(^|\>|\s)(\+)([0-9]{1})(\(|\s)([0-9]{3})(\)|\s)([0-9]{1,3})(\.|\,|\s|\-)([0-9]{2,3})(\s|\-)([0-9]{2,3})($|\<|\s)/
      /(^|\>|\s)([0-9]{3})(\s|\-)([0-9]{2,3})(\s|\-)([0-9]{2,3})(\.|\,|$|\<|\s)/
    ]
    res = [
      (m)=>
        m[4] = '('
        m[6] = ')'
        m[8] = '&nbsp;'
        m[10] = '-'
        m.splice 0, 1

        @ntag m.join(''), "span", {class:"nowrap"}
    ,
      (m)=>
        first = ''
        if m[1] is '>'
          m[1] = ''
          first = '>'

        last = ''
        if m[7] is '<'
          m[7] = ''
          last = '<'

        m[3] = '&nbsp;'
        m[5] = '-'

        m.splice 0, 1


        first + @ntag( m.join(''), "span", {class:"nowrap"} ) + last
    ]


    for re, idx in rex
      m = @text.match re
      if m
        m = false if m[1] is '>' and m[12] is '<'
        m = false if m[1] is '>' and m[7] is '<'
      break if m

    if m

      @text = @text.replace re , res[idx] m

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['phone_builder'] = Rule
