assert = require("assert")

Rule = require( '../libs/rules/nobr_before_unit_volt')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' 10в. '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " 10&nbsp;В. ", rule.text

