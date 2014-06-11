assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/oa/oa_oquote')
    text: "qqq &laquo;"
    res: "qqq<span class='oa_oqoute_sp_s'> </span><span class='oa_oqoute_sp_q'>&laquo;</span>"
  }
  {
    obj: require( '../libs/rules/oa/oa_obracket_coma')
    text: " ("
    res: "<span class='oa_obracket_sp_s'> </span><span class='oa_obracket_sp_b'>(</span>"
  }
  # {
  #   obj: require( '../libs/rules/text/email')
  #   text: " alexsuslov@github.com "
  #   res: " <a href='mailto:alexsuslov@github.com'>alexsuslov@github.com</a> "
  # }
  # {
  #   obj: require( '../libs/rules/text/no_repeat_words')
  #   text: " привет привет "
  #   res: " привет "
  # }
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
  describe "Оптическое выравнивание", ->
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
