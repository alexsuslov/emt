assert = require("assert")

Rule = require( '../libs/rules/nobr_sm_im')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' см. 2, им. 4'

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " см&nbsp;2, им&nbsp;4", rule.text

