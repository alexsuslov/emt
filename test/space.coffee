# Space Расстановка и удаление пробелов
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/nobr_twosym_abbr')
    text: "test test AS "
    res: "test test&nbsp;AS "
  }
  {
    obj: require( '../libs/rules/remove_space_before_punctuationmarks')
    text: "test test ; AS ; "
    res: "test test; AS; "
  }
  {
    obj: require( '../libs/rules/autospace_after_comma')
    text: " ,9 9,3 "
    res: ", 9 9, 3 "
  }
  {
    obj: require( '../libs/rules/autospace_after_pmarks')
    text: "  asasa ,ddsdss  asasa .ddsdss "
    res:  "  asasa, ddsdss  asasa .ddsdss "
  }
  {
    obj: require( '../libs/rules/autospace_after_dot')
    text: "  test.ru привет.привет "
    res:  "  test.\\ru привет. привет "
  }
  {
    obj: require( '../libs/rules/autospace_after_hellips')
    text: "  !..привет "
    res:  "  !.. привет "
  }
  {
    obj: require( '../libs/rules/many_spaces_to_one')
    text: " привет  привет "
    res:  " привет привет "
  }
  {
    obj: require( '../libs/rules/clear_percent')
    text: " 10 % "
    res:  " 10% "
  }
  {
    obj: require( '../libs/rules/nbsp_before_open_quote')
    text: " a &laquo; "
    res:  " a&nbsp;&laquo; "
  }
  {
    obj: require( '../libs/rules/nbsp_before_month')
    text: " 1 мая "
    res:  " 1&nbsp;мая "
  }
  {
    obj: require( '../libs/rules/spaces_on_end')
    text: " 1 мая "
    res:  " 1 мая"
  }
  # {
  #   obj: require( '../libs/rules/no_space_posle_hellip')
  #   text: " &laquo; &hellip; eweew"
  #   res:  " 1 мая"
  # }
]

describe "Правило ", ->
  describe "Расстановка и удаление пробелов", ->
    for test in tests
      ((test)->
        rule = new test.obj
          Lib: new EMTLib
        describe rule.description, ->
          it test.text, ->
            rule.text = test.text
            rule.apply()
            assert.equal test.res, rule.text
        )(test)
