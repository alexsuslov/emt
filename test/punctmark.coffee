# Etc Прочее
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/punctmark/auto_comma')
    text: ' тест а тест но '
    res: " тест, а тест, но "
  }
  {
    obj: require( '../libs/rules/punctmark/punctuation_marks_limit')
    text: ' !!!! '
    res: " !!! "
  }
  {
    obj: require( '../libs/rules/punctmark/punctuation_marks_base_limit')
    text: ' :: '
    res: " : "
  }
  {
    obj: require( '../libs/rules/punctmark/hellip')
    text: ' ... '
    res: " &hellip; "
  }
  {
    obj: require( '../libs/rules/punctmark/fix_excl_quest_marks')
    text: ' test!? '
    res: " test?! "
  }
  {
    obj: require( '../libs/rules/punctmark/fix_pmarks')
    text: ' test!! '
    res: " test! "
  }
  {
    obj: require( '../libs/rules/punctmark/fix_brackets')
    text: ' (   deijdei   ) '
    res: " (deijdei) "
  }
  {
    obj: require( '../libs/rules/punctmark/fix_brackets_space')
    text: 'vfvfvf(   deijdei   ) '
    res: "vfvfvf (   deijdei   ) "
  }
  {
    obj: require( '../libs/rules/punctmark/dot_on_end')
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
