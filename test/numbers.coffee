# Number Числа, дроби, математические знаки
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/numbers/minus_between_nums')
    text: " 1-1 "
    res: " 1&minus;1 "
  }
  {
    obj: require( '../libs/rules/numbers/auto_times_x')
    text: ' test 10х20х30 '
    res: ' test 10&times;20&times;30 '
  }
  {
    obj: require( '../libs/rules/numbers/simple_fraction')
    text: ' test 1/2 1/4 3/4'
    res: " test &frac12; &frac14; &frac34;"
  }
  {
    obj: require( '../libs/rules/numbers/thinsp_between_number_triads')
    text: ' 123 123 123 '
    res: " 123&thinsp;123&thinsp;123 "
  }
  {
    obj: require( '../libs/rules/numbers/thinsp_between_no_and_number')
    text: '№ 4, № 5'
    res: "&#8470;&thinsp;4, &#8470;&thinsp;5"
  }
  {
    obj: require( '../libs/rules/numbers/thinsp_between_sect_and_number')
    text: '§ 1'
    res: "&sect;&thinsp;1"
  }
  {
    obj: require( '../libs/rules/numbers/numeric_sub')
    text: " test_3 "
    res: " test<sub><small>3</small></sub> "
  }
  {
    obj: require( '../libs/rules/numbers/numeric_sup')
    text: " test^3 "
    res: " test<sup><small>3</small></sup> "
  }

]

# for test in tests
#   console.log new test.obj({}).configName

describe "Правило ", ->
  describe " Числа, дроби, математические знаки ", ->
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
