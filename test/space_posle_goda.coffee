assert = require("assert")

Rule = require( '../libs/rules/space_posle_goda')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' 1999год '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " 1999 год ", rule.text

