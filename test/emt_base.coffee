assert = require("assert")

EMTLib = require( '../libs/emt_lib').EMTLib
EMT = require( '../libs/emt_base').EMTBase

emt = new EMT
  Lib: EMTLib

describe "EMTBase", ->


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

  describe 'add_safe_block', ->
    emt = new EMT
      Lib: EMTLib

    emt._add_safe_block = (xid, xopen, close, tag) ->
      tag =
        'close': '\\<span\\ class\\=\\"\\_notg\\_end\\"\\>\\<\\/span\\>'
        'tag': ''
        'open': '\\<span\\ class\\=\\"\\_notg\\_start\\"\\>\\<\\/span\\>'
        'id': 'span-notg'
      it 'xid', ->
        assert.equal tag.id,  xid
      it 'xopen', ->
        assert.equal tag.open, xopen
      it 'close', ->
        assert.equal tag.close, close

    emt.add_safe_block('span-notg',
      '<span class="_notg_start"></span>',
      '<span class="_notg_end"></span>')

  # it 'add_safe_block', ->





