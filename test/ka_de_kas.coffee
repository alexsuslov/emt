assert = require("assert")

Rule = require( '../libs/rules/ka_de_kas')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe rule.description, ->
    text = ' скажите ка, он де, ну кась '

    it text, ->
      rule.text = text
      rule.apply()
      assert.equal " скажите-ка, он-де, ну-кась ", rule.text

