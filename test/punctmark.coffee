# Etc Прочее
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/auto_comma')
    text: ' тест а тест но '
    res: " тест, а тест, но "
  }
  {
    obj: require( '../libs/rules/punctuation_marks_limit')
    text: ' !!!! '
    res: " !!! "
  }
  {
    obj: require( '../libs/rules/punctuation_marks_base_limit')
    text: ' :: '
    res: " : "
  }
  {
    obj: require( '../libs/rules/hellip')
    text: ' ... '
    res: " &hellip; "
  }
  {
    obj: require( '../libs/rules/fix_excl_quest_marks')
    text: ' test!? '
    res: " test?! "
  }
  {
    obj: require( '../libs/rules/fix_pmarks')
    text: ' test!! '
    res: " test! "
  }
  {
    obj: require( '../libs/rules/fix_brackets')
    text: ' (   deijdei   ) '
    res: " (deijdei) "
  }
  {
    obj: require( '../libs/rules/fix_brackets_space')
    text: 'vfvfvf(   deijdei   ) '
    res: "vfvfvf (   deijdei   ) "
  }
  {
    obj: require( '../libs/rules/dot_on_end')
    text: 'vfvfvf '
    res: "vfvfvf."
  }
]
# for test in tests
#   console.log new test.obj({}).configName

describe "Правило ", ->
  describe "Пунктуация и знаки препинания", ->
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
