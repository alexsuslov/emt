# Symbol Специальные символы
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/tm_replace')
    text: "(tm)"
    res: "&trade;"
  }
  {
    obj: require( '../libs/rules/r_sign_replace')
    text: "(r)"
    res: "&reg;"
  }
  {
    obj: require( '../libs/rules/copy_replace')
    text: "(c)"
    res: "&copy;"
  }
  {
    obj: require( '../libs/rules/apostrophe')
    text: " тест'test"
    res: " тест&rsquo;test"
  }
  {
    obj: require( '../libs/rules/degree_f')
    text: " 40F "
    res: " <span class='nowrap'>40 &deg;F</span> "
  }
  {
    obj: require( '../libs/rules/euro_symbol')
    text: " € "
    res: " &euro; "
  }
  {
    obj: require( '../libs/rules/arrows_symbols')
    text: " <- -> → ←"
    res: " &rarr; &rarr; &rarr; &larr;"
  }

]

describe "Правило ", ->
  describe "Специальные символы", ->
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
