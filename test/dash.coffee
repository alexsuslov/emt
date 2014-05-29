# Dash Дефисы и тире
assert = require("assert")
EMTLib = require( '../libs/emt_lib').EMTLib
# Список тестов
tests = [
  {
    obj: require( '../libs/rules/mdash_2_html')
    text: " привет - привет "
    res: " привет &mdash; привет "
  }
  {
    obj: require( '../libs/rules/mdash')
    text: "  привет, - привет"
    res: "  привет,&nbsp;&mdash; привет"
  }
  {
    obj: require( '../libs/rules/mdash2')
    text: "  привет\n- привет"
    res: "  привет\n&nbsp;&mdash;привет"
  }
  {
    obj: require( '../libs/rules/mdash3')
    text: "  привет! - привет"
    res: "  привет!&nbsp;&mdash;привет"
  }
  {
    obj: require( '../libs/rules/iz_za_pod')
    text: " из -за, из -под "
    res: " из-за, из-под "
  }
  {
    obj: require( '../libs/rules/to_libo_nibud')
    text: " кто -то кто -либо кто -нибудь"
    res: " кто-то кто-либо кто-нибудь"
  }
  {
    obj: require( '../libs/rules/koe_kak')
    text: " Кое -как,  кой -кого,  все -таки "
    res: " Кое-как,  кой-кого,  все-таки "
  }
  {
    obj: require( '../libs/rules/ka_de_kas')
    text: ' скажите ка, он де, ну кась '
    res: " скажите-ка, он-де, ну-кась "
  }
]

# for test in tests
#   console.log new test.obj({Lib:{}}).configName


describe "Правило ", ->
  describe "Дефисы и тире", ->
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
