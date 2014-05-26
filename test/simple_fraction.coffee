assert = require("assert")

Rule = require( '../libs/rules/simple_fraction')
EMTLib = require( '../libs/emt_lib').EMTLib

open_quote = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe "Открывающая кавычка", ->

    text = ' test 1/2 1/4 3/4'

    it text, ->
      open_quote.text = text
      open_quote.apply()
      assert.equal " test &frac12; &frac14; &frac34;", open_quote.text

