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
  {
    obj: require( '../libs/rules/nobr_locations')
    text: ' г. Тест, пр-кт Тест,  д. 4 '
    res: " г.&nbsp;Тест, пр-кт&nbsp;Тест,  д.&nbsp;4 "
  }
  {
    obj: require( '../libs/rules/nbsp_before_unit')
    text: ' 1 см. 1 м2 '
    res: ' 1&nbsp;см. 1&nbsp;м&sup2; '
  }
  {
    obj: require( '../libs/rules/nbsp_before_weight_unit')
    text: ' 1кг. '
    res: ' 1&nbsp;кг. '
  }
  {
    obj: require( '../libs/rules/nobr_before_unit_volt')
    text: ' 10в. '
    res: " 10&nbsp;В. "
  }
  {
    obj: require( '../libs/rules/nbsp_org_abbr')
    text: ' ООО Биомед '
    res: ' ООО&nbsp;Биомед '
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
