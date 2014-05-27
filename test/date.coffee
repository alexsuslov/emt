# Date Даты и дни
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/years')
    text: ' с 1990-2000 '
    res: " с 1990&mdash;2000 "
  }
  {
    obj: require( '../libs/rules/mdash_month_interval')
    text: ' сентября-август '
    res: " сентября&mdash;август "
  }
  {
    obj: require( '../libs/rules/space_posle_goda')
    text: ' 1999год '
    res: " 1999 год "
  }
  {
    obj: require( '../libs/rules/nbsp_posle_goda_abbr')
    text: ' 1999г. '
    res: " 1999&nbsp;г. "
  }
]

describe "Правило ", ->
  describe "Даты и дни", ->
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
