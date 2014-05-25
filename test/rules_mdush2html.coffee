assert = require("assert")

Rule = require( '../libs/rules/mdash_2_html')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = " привет - привет "
    # rule.apply()
    # rule.test


    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " привет &mdash; привет ", rule.text

