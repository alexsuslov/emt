assert = require("assert")

Rule = require( '../libs/rules/years')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' с 1990-2000 '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " с 1990&mdash;2000 ", rule.text

