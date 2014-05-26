assert = require("assert")

Rule = require( '../libs/rules/nbsp_before_unit')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' 1 см. 1 м2 '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal ' 1&nbsp;см. 1&nbsp;м&sup2; ', rule.text

