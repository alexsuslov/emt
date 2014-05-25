assert = require("assert")

Rule = require( '../libs/rules/mdash3')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = "  привет! - привет"

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal "  привет!&nbsp;&mdash;привет", rule.text

