assert = require("assert")

Rule = require( '../libs/rules/auto_times_x')
EMTLib = require( '../libs/emt_lib').EMTLib

open_quote = new Rule
  Lib: new EMTLib


describe "Rules", ->
  describe "Открывающая кавычка", ->

    text = ' test 10х20х30 '

    it text, ->
      open_quote.text = text
      open_quote.apply()
      assert.equal ' test 10&times;20&times;30 ', open_quote.text

