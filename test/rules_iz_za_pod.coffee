assert = require("assert")

Rule = require( '../libs/rules/iz_za_pod')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = " из -за, из -под "

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " из-за, из-под ", rule.text

