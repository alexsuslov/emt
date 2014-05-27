assert = require("assert")

Rule = require( '../libs/rules/nbsp_celcius')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' 10 &deg;С '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " 10&nbsp;&deg;C ", rule.text

