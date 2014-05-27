assert = require("assert")

Rule = require( '../libs/rules/super_nbsp')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' к вам '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " к&nbsp;вам ", rule.text

