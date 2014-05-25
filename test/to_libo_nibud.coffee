assert = require("assert")

Rule = require( '../libs/rules/to_libo_nibud')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = " кто -то кто -либо кто -нибудь"

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " кто-то кто-либо кто-нибудь", rule.text

