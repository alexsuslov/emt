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
  {
    obj: require( '../libs/rules/nbsp_in_the_end')
    text: 'ссс cc. Dfdfd'
    res: "ссс&nbsp;cc. Dfdfd"
  }
  {
    obj: require( '../libs/rules/phone_builder')
    text: '+7 123 123 12-12, 123 12-12.'
    res: "+7 123<span class='nowrap'> 123&nbsp;12-12,</span><span class='nowrap'> 123&nbsp;12-12.</span>"
  }
  {
    obj: require( '../libs/rules/ip_address')
    text: '123.123.123.123'
    res: "<span class='nowrap'>123.123.123.123</span>"
  }
  {
    obj: require( '../libs/rules/spaces_nobr_in_surname_abbr')
    text: ' Ccccc A.A. '
    res: " <span class='nowrap'>Ccccc A. A.</span> "
  }
]

# for test in tests
#   console.log new test.obj({}).configName


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
