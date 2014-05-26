assert = require("assert")

Rule = require( '../libs/rules/thinsp_between_number_triads')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' 123 123 123 '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " 123&thinsp;123&thinsp;123 ", rule.text

