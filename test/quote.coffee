# Quote Кавычки
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/quote/open_quote')
    text: "привет \"test\" привет. привет \"test\" привет"
    res: "привет «test\" привет. привет «test\" привет"
  }
  {
    obj: require( '../libs/rules/quote/close_quote')
    text: "привет \"test\" привет"
    res: "привет \"test» привет"
  }

]

# for test in tests
#   console.log new test.obj({}).configName

describe "Правило ", ->
  describe "Кавычки", ->
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
