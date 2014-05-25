assert = require("assert")

Rule = require( '../libs/rules/nobr_abbreviation')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->
    text = " 300 dpi 150 lpi "

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " 300&nbsp;dpi 150&nbsp;lpi ", rule.text

