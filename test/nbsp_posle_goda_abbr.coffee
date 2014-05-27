assert = require("assert")

Rule = require( '../libs/rules/nbsp_posle_goda_abbr')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' 1999г. '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " 1999 год ", rule.text

