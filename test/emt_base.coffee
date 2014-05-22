assert = require("assert")

EMTLib = require( '../libs/emt_lib').EMTLib
EMT = require( '../libs/emt_base').EMTBase

describe "EMTBase", ->
  emt = new EMT
    Lib: EMTLib

  it "is present EMTretQuote", ->
    assert.equal "Кавычки", emt.tret_objects.EMTretQuote.title

  describe 'add_safe_tag', ->
    pre =
      'close': '\\<\\/pre\\>',
      'tag': 'pre',
      'open': '\\<pre[^>]*?\\>',
      'id': 'pre'

    emt._add_safe_block = (xid, xopen, close, tag) ->
      it 'xid', ->
        assert.equal pre.id,  xid
      it 'xopen', ->
        assert.equal pre.open, xopen
      it 'close', ->
        assert.equal pre.close, close
      it 'tag', ->
        assert.equal pre.tag, tag

    emt.add_safe_tag 'pre'

  describe '_add_safe_block', ->

  # it 'add_safe_block', ->





