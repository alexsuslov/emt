assert = require("assert")

Rule = require( '../libs/rules/acute_accent')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' приве`т '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " приве&#769;т ", rule.text

