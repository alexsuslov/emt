require = (str)->
  # console.log str
class UnTest
  test:(data)->

    console.log data.res if data.debug
    report = []

    if @emt
      report.push data.text

      text = @emt.simple data.text

      console.log text if data.debug

      report.push text
      if text is data.res
        report.push 'ok'
      else
        report.push 'error'
      report.push data.res
    report

  constructor:(@opt)->
    @emt = @opt.emt
    @

class Symbol
  description:'Символы'
  tests: [
    {
      text: "(tm)"
      res: "&trade;"
    }
    {
      text: "(r)"
      res: "&reg;"
    }
    {
      text: "(c)"
      res: "&copy;"
    }
    {
      text: " тест'test"
      res: " тест&rsquo;test"
    }
    {
      text: " 40F "
      res: " <span class='nowrap'>40 &deg;F</span>"
    }
    {
      text: " € "
      res: " &euro;"
    }
    {
      text: " <- -> → ←"
      res: " &larr; &rarr; &rarr; &larr;"
    }
    {
      text: " +/- "
      res: " &plusmn;"
    }
    ]
  constructor:(@opt)->
    @emt = @opt.emt
    @el = @opt.el
    @report = []

    @unTest = new UnTest
      emt: @emt
    @el.append "<tr><th colspan='5'>#{@description}</th><tr>"
    @
  test:()->
    for data in @tests
      @report.push @unTest.test data
    @report

  display:->
    for report, idx in @report
      paint = 'success'
      paint = 'danger' unless report[2] is 'ok'
      @el.append(
        $("<tr class='#{paint}'></tr>")
          .append( "<td>#{idx}</td>")
          .append( "<td>#{report[0]}</td>")
          .append( "<td>#{report[1]}</td>")
          .append( $( "<td></td>").text( report[3]))
          .append( $( "<td></td>").text( report[1]))
        )

class Number extends Symbol
  description:'Числа, дроби, математические знаки'
  tests: [
      {
        text: " 1-1 "
        res: " 1&minus;1"
      }
      {
        text: ' test 10х20х30 '
        res: ' test 10&times;20&times;30'
      }
      {
        text: ' test 1/2 1/4 3/4'
        res: " test &frac12; &frac14; &frac34;"
      }
      {
        text: ' 123 123 123 '
        res: " 123&thinsp;123&thinsp;123"
      }
      {
        text: '№ 4, № 5'
        res: "&#8470;&thinsp;4, &#8470;&thinsp;5"
      }
      {
        text: '§ 1'
        res: "&sect;&thinsp;1"
      }
      {
        text: " test_3 "
        res: " test<sub><small>3</small></sub>"
      }
      {
        text: " test^3 "
        res: " test<sup><small>3</small></sup>"
      }
    ]

class Punctmark extends Symbol
  description:'Пунктуация и знаки препинания'
  tests: [
      {
        text: 'тест а тест но'
        res: "тест, а&nbsp;тест но"
      }
      {
        text: ' !!!! '
        res: " !!!"
      }
      {
        text: '::'
        res: ":"
      }
      {
        text: ' ... '
        res: " &hellip;"
      }
      {
        text: ' test!? '
        res: " test?!"
      }
      {
        text: ' test!! '
        res: " test!"
      }
      {
        text: ' (   deijdei   ) '
        res: " (deijdei)"
      }
      {
        text: 'vfvfvf(   deijdei   ) '
        res: "vfvfvf (deijdei)"
      }
      {
        text: 'vfvfvf '
        res: "vfvfvf."
      }
    ]

class Abbr extends Symbol
  description:'Сокращения'
  tests: [
    {
      text: ' гл. 4, стр. 5, рис. 7, илл. 9, ст. 6, п. 9 '
      res: " гл&nbsp;4, стр&nbsp;5, рис&nbsp;7, илл&nbsp;9, ст&nbsp;6, п&nbsp;9"
    }
    {
      text: ' см. 2, им. 4'
      res:" см&nbsp;2, им&nbsp;4"
    }
    {
      text: ' г. Тест, пр-кт Тест,  д. 4 '
      res: " г.&nbsp;Тест, пр&mdash;кт&nbsp;Тест, д.&nbsp;4"
    }
    {
      text: ' 1 м2 '
      res: ' 1&nbsp;м&sup2;'
    }
    {
      text: ' 1кг. '
      res: ' 1&nbsp;кг.'
    }
    {
      text: ' 10в. '
      res: " 10&nbsp;В."
    }
    {
      text: ' ООО Биомед '
      res: ' ООО&nbsp;Биомед'
    }
    {
      text: " 300 dpi 150 lpi "
      res: " 300&nbsp;dpi 150&nbsp;lpi"
    }
    {
      text: " P. S. , P.P.S. "
      res: " <span class='nowrap'>P. S.</span>, <span class='nowrap'>P. P. S.</span>"
    }
    {
      text: " и т. д. и т. п. в т.ч."
      res: " <span class='nowrap'>и т. д.</span> <span class='nowrap'>и т. п.</span> <span class='nowrap'>и т. ч.</span>"
    }
    {
      text: " 40 тыс. руб."
      res: " 40&nbsp;тыс.&nbsp;руб."

    }
    {
      text: " ГОСТ 123-123 "
      res: " <span class='nowrap'>ГОСТ 123&ndash;123</span>"
    }
    {
      text: " тест те."
      res: " тест<span class='nowrap'>те</span>"
    }
  ]

class Dash extends Symbol
  description: "Дефисы и тире"
  tests: [
    {
      text: "привет - привет"
      res: "привет&nbsp;&mdash; привет"
      debug:true
    }
    {
      text: " привет, - привет"
      res: " привет,&nbsp;&mdash; привет"
    }
    {
      text: " привет\n- привет"
      res: " привет\n&nbsp;&mdash;привет"
    }
    {
      text: " привет! - привет"
      res: " привет!&nbsp;&mdash;привет"
    }
    {
      text: " из -за, из -под "
      res: " из &mdash;за, из &mdash;под"
    }
    {
      text: " кто -то кто -либо кто -нибудь"
      res: " кто &mdash;то кто &mdash;либо кто &mdash;нибудь"
    }
    {
      text: "Кое -как,  кой -кого,  все -таки"
      res: "Кое &mdash;как, кой &mdash;кого, все &mdash;таки"
    }
    {
      text: 'скажите ка, он де, ну кась '
      res: "скажите&mdash;ка, он&mdash;де, ну&mdash;кась"
    }
  ]

class EmtDate extends Symbol
  description: "Даты и дни"
  tests: [
    {
      text: ' с 1990-2000 '
      res: " с&nbsp;1990&mdash;2000"
    }
    {
      text: ' сентября-август '
      res: " сентября&mdash;август"
    }
    {
      text: ' 1999год '
      res: " 1999 год"
    }
    {
      text: ' 1999г. '
      res: " 1999&nbsp;г."
    }
    {
      text: ' 24.03.1999 '
      res: " <span class='nowrap'>24.03.1999 г.</span>"
    }
  ]
class Etc extends Symbol
  description: "Прочее"
  tests: [
    {
      obj: require( '../libs/rules/etc/acute_accent')
      text: ' приве`т '
      res: " приве&#769;т"
    }
    {
      obj: require( '../libs/rules/etc/word_sup')
      text: ' приве ^т '
      res: " приве<sup><small>т</small></sup>"
    }
    {
      obj: require( '../libs/rules/etc/century_period')
      text: ' X-V в '
      res: " <span class='nowrap'>X&mdash;V вв.</span>"
    }
    {
      obj: require( '../libs/rules/etc/time_interval')
      text: ' 10:00-20:00 '
      res: " <span class='nowrap'>10:00&mdash;20:00</span>"
    }
  ]
class NoBr extends Symbol
  description: "Неразрывные конструкции"
  tests: [
    {
      obj: require( '../libs/rules/nobr/super_nbsp')
      text: ' к вам '
      res: " к&nbsp;вам"
    }
    {
      obj: require( '../libs/rules/nobr/nbsp_v_kak_to')
      text: ' как то '
      res: " как&nbsp;то"
    }
    {
      obj: require( '../libs/rules/nobr/nbsp_before_particle')
      text: ' вам ли '
      res: " вам&nbsp;ли"
    }
    {
      obj: require( '../libs/rules/nobr/nbsp_celcius')
      text: ' 10 &deg;С '
      res: " 10&nbsp;&deg;C"
    }
    # {
    #   obj: require( '../libs/rules/nobr/nbsp_in_the_end')
    #   text: 'ссс cc. Dfdfd'
    #   res: "ссс&nbsp;cc. Dfdfd"
    # }
    # {
    #   obj: require( '../libs/rules/nobr/phone_builder')
    #   text: '+7(123)123 12-12'
    #   res: "<span class='nowrap'>+7(123)123&nbsp;12-12,</span>"
    # }
    {
      obj: require( '../libs/rules/nobr/ip_address')
      text: '123.123.123.123'
      res: "<span class='nowrap'>123.123.123.123</span>"
    }
    {
      obj: require( '../libs/rules/nobr/spaces_nobr_in_surname_abbr')
      text: ' Ccccc A.A. '
      res: " <span class='nowrap'>Ccccc A. A.</span>"
    }
  ]

class Quote extends Symbol
  description: "Кавычки"
  tests : [
    {
      obj: require( '../libs/rules/quote/open_quote')
      text: "привет \"test\" привет. привет \"test\" привет"
      res: "привет «test» привет. привет «test» привет"
    }
    {
      obj: require( '../libs/rules/quote/close_quote')
      text: "привет \"test\" привет"
      res: "привет «test» привет"
    }

  ]
class Space extends Quote
  description: "Расстановка и удаление пробелов"
  tests : [
    {
      obj: require( '../libs/rules/space/nobr_twosym_abbr')
      text: "test test AS "
      res: "test test&nbsp;AS"
    }
    {
      obj: require( '../libs/rules/space/remove_space_before_punctuationmarks')
      text: "test test ; AS ; "
      res: "test test; AS;"
    }
    {
      obj: require( '../libs/rules/space/autospace_after_comma')
      text: " ,9 9,3 "
      res: ", 9 9, 3"
    }
    {
      obj: require( '../libs/rules/space/autospace_after_pmarks')
      text: "asasa ,ddsdss  asasa .ddsdss "
      res:  "asasa, ddsdss asasa. ddsdss"
    }
    {
      obj: require( '../libs/rules/space/autospace_after_dot')
      text: "  test.ru привет.привет "
      res:  "  test.\\ru привет. привет"
    }
    {
      obj: require( '../libs/rules/space/autospace_after_hellips')
      text: "!..привет "
      res:  "!.. привет"
    }
    {
      obj: require( '../libs/rules/space/many_spaces_to_one')
      text: "привет  привет "
      res:  "привет"
    }
    {
      obj: require( '../libs/rules/space/clear_percent')
      text: " 10 % "
      res:  " 10%"
    }
    {
      obj: require( '../libs/rules/space/nbsp_before_open_quote')
      text: " a &laquo; "
      res:  " a&nbsp;&laquo;"
    }
    {
      obj: require( '../libs/rules/space/nbsp_before_month')
      text: " 1 мая "
      res:  " 1&nbsp;мая"
    }
    {
      obj: require( '../libs/rules/space/spaces_on_end')
      text: "test "
      res:  "test"
    }
    # {
    #   obj: require( '../libs/rules/space/no_space_posle_hellip')
    #   text: " &laquo; &hellip; eweew"
    #   res:  " 1 мая"
    # }
  ]
class Text extends Quote
  description: "Текст и абзацы"
  tests : [
    {
      obj: require( '../libs/rules/text/auto_links')
      text: " http://alexsuslov.github.io/emt/ "
      res: " <a href='http://alexsuslov.github.io/emt/'>alexsuslov.github.io/emt/</a>"
    }
    {
      obj: require( '../libs/rules/text/email')
      text: " alexsuslov@github.com "
      res: " <a href='mailto:alexsuslov@github.com'>alexsuslov@github.com</a>"
    }
    {
      obj: require( '../libs/rules/text/no_repeat_words')
      text: " привет привет "
      res: " привет"
    }
    # {
    #   obj: require( '../libs/rules/paragraphs')
    #   text: " привет привет "
    #   res: " привет "
    # }
    # {
    #   obj: require( '../libs/rules/breakline')
    #   text: " привет привет "
    #   res: " привет "
    # }
  ]
for Obj in [Symbol, Number, Abbr, Dash, EmtDate, Etc, NoBr, Quote, Space, Text, Punctmark ]
  test = new Obj
    emt: new EMT()
    el: $('.report tbody')
  test.test()
  test.display()



