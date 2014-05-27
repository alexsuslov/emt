# Abbr Сокращения
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/nobr_acronym')
    text: ' гл. 4, стр. 5, рис. 7, илл. 9, ст. 6, п. 9 '
    res: " гл&nbsp;4, стр&nbsp;5, рис&nbsp;7, илл&nbsp;9, ст&nbsp;6, п&nbsp;9 "
  }
  {
    obj: require( '../libs/rules/nobr_sm_im')
    text: ' см. 2, им. 4'
    res:" см&nbsp;2, им&nbsp;4"
  }

]

describe "Правила для ", ->
  describe "Сокращения", ->
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
