assert = require("assert")

Rule = require( '../libs/rules/mdash_month_interval')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' сентября-август '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " сентября&mdash;август ", rule.text

