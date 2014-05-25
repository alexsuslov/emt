assert = require("assert")

Rules = require( '../libs/rules/rules')
EMTLib = require( '../libs/emt_lib').EMTLib

open_quote = new Rules.open_quote
  Lib: new EMTLib


describe "Rules", ->
  describe "Открывающая кавычка", ->

    text = "привет \"test\" привет. привет \"test\" привет"

    it text, ->
      open_quote.text = text
      open_quote.apply()
      console.log 'profiling: ', open_quote.profiling
      assert.equal "привет &laquo;test\" привет. привет &laquo;test\" привет", open_quote.text

