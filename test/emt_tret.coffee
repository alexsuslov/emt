assert = require("assert")

EMTret = require( '../libs/emt_tret').EMTret
EMTLib = require( '../libs/emt_lib').EMTLib

emtret = new EMTret
  Lib: new EMTLib()

describe "EMTret", ->
  describe "set_text", ->
    it "@_text = 'test ", ->
      emtret.set_text 'test'
      assert.equal 'test', emtret._text

  describe 'set_tag_layout', ->
    it "set_tag_layout()", ->
      emtret.set_tag_layout()
      assert.equal emtret.Lib.LAYOUT_STYLE , emtret.use_layout

    it "set_tag_layout(10)", ->
      emtret.set_tag_layout(10)
      assert.equal 10 , emtret.use_layout

  describe 'set_rule', ->
    it 'rulename key value', ->
      emtret.set_rule 'rulename', 'key', 'value'
      console.log
      assert.equal 'value', emtret.rules.rulename.key

  # it '_apply', ->
  describe 'apply', ->
    emtret._apply = (param)->
      it 'string', ->
        assert.equal 'open_quote',  param[0]
    emtret.apply 'open_quote'

    # array
    emtret._apply = (param)->
      it 'array', ->
        assert.equal 'open_quote',  param[0]
        assert.equal 'open_quote1',  param[1]
    emtret.apply(['open_quote', 'open_quote1' ])






