assert = require("assert")

Rule = require( '../libs/rules/nobr_locations')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' г. Тест, пр-кт Тест,  д. 4 '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " г.&nbsp;Тест, пр-кт&nbsp;Тест,  д.&nbsp;4 ", rule.text

