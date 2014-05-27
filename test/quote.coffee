# Quote Кавычки
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/open_quote')
    text: "привет \"test\" привет. привет \"test\" привет"
    res: "привет &laquo;test\" привет. привет &laquo;test\" привет"
  }
  {
    obj: require( '../libs/rules/close_quote')
    text: "привет \"test\" привет"
    res: "привет \"test&raquo; привет"
  }

]

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
