# Date Даты и дни
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/emtdate/years')
    text: ' с 1990-2000 '
    res: " с 1990&mdash;2000 "
  }
  {
    obj: require( '../libs/rules/emtdate/mdash_month_interval')
    text: ' сентября-август '
    res: " сентября&mdash;август "
  }
  {
    obj: require( '../libs/rules/emtdate/space_posle_goda')
    text: ' 1999год '
    res: " 1999 год "
  }
  {
    obj: require( '../libs/rules/emtdate/nbsp_posle_goda_abbr')
    text: ' 1999г. '
    res: " 1999&nbsp;г. "
  }
  {
    obj: require( '../libs/rules/emtdate/nobr_year_in_date')
    text: ' 24.03.1999 '
    res: " <span class='nowrap'>24.03.1999 г.</span> "
  }
]
# for test in tests
#   console.log new test.obj({}).configName

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
