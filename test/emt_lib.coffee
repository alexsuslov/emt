assert = require("assert")

EMTLib = require( '../libs/emt_lib').EMTLib
emtlib = new EMTLib()

describe "EMTLib", ->
  describe "isInt", ->
    it '1', ->
      assert.equal true, emtlib.isInt 1
    it '1.25', ->
      assert.equal false, emtlib.isInt 1.25

  describe "isArray", ->

    it 'array', ->
      assert.equal true, emtlib.isArray [1,2,3]

    it 'object', ->
      assert.equal false, emtlib.isArray {a:1,b:2,c:3}

    it 'number', ->
      assert.equal false, emtlib.isArray 1

    it 'string', ->
      assert.equal false, emtlib.isArray 'test'

    it 'function', ->
      assert.equal false, emtlib.isArray ->

  describe "isObject", ->
    it 'array', ->
      assert.equal false, emtlib.isObject [1,2,3]

    it 'object', ->
      assert.equal true, emtlib.isObject {a:1,b:2,c:3}

    it 'number', ->
      assert.equal false, emtlib.isObject 1

    it 'string', ->
      assert.equal false, emtlib.isObject 'test'

    it 'function', ->
      assert.equal false, emtlib.isObject ->

  it 'trim', ->
    assert.equal 'привет всем', emtlib.trim '  привет всем     '

  it "encrypt_tag / decrypt_tag", ->
    str = 'your text'
    encStr = emtlib.encrypt_tag( str)
    emtlib.decrypt_tag( encStr  )
    assert.equal str, emtlib.decrypt_tag( encStr  )

  it "decode_internal_blocks / encode_internal_blocks", ->
    block = '<a href="http://mdash.ru">test</a><p>test</p>'
    assert.equal block, emtlib.decode_internal_blocks emtlib.iblock block

  it "safe_tag_chars", ->
    text = '<a href="http://mdash.ru">test</a><p>test</p>'
    assert.equal text,
      emtlib.safe_tag_chars emtlib.safe_tag_chars(text, true), false




