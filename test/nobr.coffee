# Nobr Неразрывные конструкции
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/super_nbsp')
    text: ' к вам '
    res: " к&nbsp;вам "
  }
  {
    obj: require( '../libs/rules/nbsp_v_kak_to')
    text: ' как то '
    res: " как&nbsp;то "
  }
  {
    obj: require( '../libs/rules/nbsp_before_particle')
    text: ' вам ли '
    res: " вам&nbsp;ли "
  }
  {
    obj: require( '../libs/rules/nbsp_celcius')
    text: ' 10 &deg;С '
    res: " 10&nbsp;&deg;C "
  }
]

describe "Правило ", ->
  describe "Неразрывные конструкции", ->
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
