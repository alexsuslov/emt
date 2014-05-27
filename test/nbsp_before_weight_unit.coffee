assert = require("assert")

Rule = require( '../libs/rules/nbsp_before_weight_unit')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' 1кг. '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal ' 1&nbsp;кг. ', rule.text

