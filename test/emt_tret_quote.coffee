assert = require("assert")

EMTLib = require( '../libs/emt_lib').EMTLib
EMT = require( '../libs/emt_tret_quote').EMTretQuote

emt = new EMT
  Lib: new EMTLib()

describe "EMTretQuote", ->
  describe 'open_quote', ->
    it 'Тест "Хроники Ехо"?', ->
      emt.set_text 'Тест "Хроники Ехо"?'
      emt.rules.open_quote.fn emt
      assert.equal 'Тест &laquo;Хроники Ехо"?', emt._text

  # describe 'close_quote', ->
  #   it 'Тест "Хроники Ехо"?', ->
  #     emt.rules.close_quote.fn emt
  #     assert.equal 'Тест &laquo;Хроники Ехо&raquo;\"', emt._text






