assert = require("assert")

Rule = require( '../libs/rules/nobr_acronym')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->

    text = ' гл. 4, стр. 5, рис. 7, илл. 9, ст. 6, п. 9 '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " гл&nbsp;4, стр&nbsp;5, рис&nbsp;7, илл&nbsp;9, ст&nbsp;6, п&nbsp;9 ", rule.text

