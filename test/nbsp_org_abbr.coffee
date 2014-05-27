assert = require("assert")

Rule = require( '../libs/rules/nbsp_org_abbr')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' ООО Биомед '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal ' ООО&nbsp;Биомед ', rule.text

