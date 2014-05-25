assert = require("assert")

Rules = require( '../libs/rules/rules')
EMTLib = require( '../libs/emt_lib').EMTLib

close_quote = new Rules.close_quote
  Lib: new EMTLib




describe "Rules", ->
  describe "Закрывающая кавычка", ->

    text = "привет \"test\" привет"

    it text, ->
      close_quote.text = text
      close_quote.apply()
      assert.equal "привет \"test&raquo; привет", close_quote.text

