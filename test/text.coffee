# Text Текст и абзацы
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/auto_links')
    text: " http://alexsuslov.github.io/emt/ "
    res: " <a href='http://alexsuslov.github.io/emt/'>alexsuslov.github.io/emt/</a> "
  }
  {
    obj: require( '../libs/rules/email')
    text: " alexsuslov@github.com "
    res: " <a href='mailto:alexsuslov@github.com'>alexsuslov@github.com</a> "
  }
  {
    obj: require( '../libs/rules/no_repeat_words')
    text: " привет привет "
    res: " привет "
  }
  # {
  #   obj: require( '../libs/rules/paragraphs')
  #   text: " привет привет "
  #   res: " привет "
  # }
  # {
  #   obj: require( '../libs/rules/breakline')
  #   text: " привет привет "
  #   res: " привет "
  # }
]

# for test in tests
#   console.log new test.obj({}).configName

describe "Правило ", ->
  describe "Текст и абзацы", ->
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
