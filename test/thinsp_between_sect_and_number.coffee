assert = require("assert")

Rule = require( '../libs/rules/thinsp_between_sect_and_number')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = '§ 1'

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal "&sect;&thinsp;1", rule.text

