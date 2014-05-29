# Etc Прочее
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/acute_accent')
    text: ' приве`т '
    res: " приве&#769;т "
  }
  {
    obj: require( '../libs/rules/word_sup')
    text: ' приве ^т '
    res: " приве<sup><small>т</small></sup> "
  }
  {
    obj: require( '../libs/rules/century_period')
    text: ' X-V в '
    res: " <span class='nowrap'>X&mdash;V вв.</span> "
  }
  {
    obj: require( '../libs/rules/time_interval')
    text: ' 10:00-20:00 '
    res: " <span class='nowrap'>10:00&mdash;20:00</span> "
  }
]
# for test in tests
#   console.log new test.obj({}).configName

describe "Правило ", ->
  describe "Прочее", ->
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
