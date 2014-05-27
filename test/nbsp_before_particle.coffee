assert = require("assert")

Rule = require( '../libs/rules/nbsp_before_particle')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' вам ли '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " вам&nbsp;ли ", rule.text

