assert = require("assert")

Rule = require( '../libs/rules/nbsp_v_kak_to')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' как то '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " как&nbsp;то ", rule.text

