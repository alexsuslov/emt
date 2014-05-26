assert = require("assert")

Rule = require( '../libs/rules/thinsp_between_no_and_number')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = '№ 4, № 5'

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal "&#8470;&thinsp;4, &#8470;&thinsp;5", rule.text

