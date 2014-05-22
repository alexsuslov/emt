assert = require("assert")

EMTLib = require( '../libs/emt_lib').EMTLib
EMT = require( '../libs/emt_tret_nobr').EMTretNobr

emt = new EMT
  Lib: EMTLib

describe "EMTretNobr", ->
  describe "set_text", ->
    it "@_text = 'test ", ->
      emt.set_text 'test'
      assert.equal 'test', emt._text

  # describe 'set_tag_layout', ->
  #   it "set_tag_layout()", ->
  #     emtret.set_tag_layout()
  #     assert.equal emtret.LAYOUT_STYLE , emtret.use_layout

  #   it "set_tag_layout(10)", ->
  #     emtret.set_tag_layout(10)
  #     assert.equal 10 , emtret.use_layout


  # describe 'set_rule', ->
  #   it 'rulename key value', ->
  #     emtret.set_rule 'rulename', 'key', 'value'
  #     console.log
  #     assert.equal 'value', emtret.rules.rulename.key





