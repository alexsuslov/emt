assert = require("assert")

EMTypograph = require( '../libs/emt_typograph').EMTypograph
EMTLib = require( '../libs/emt_lib').EMTLib

emt = new EMTypograph
  Lib: new EMTLib


describe "EMTypograph", ->

  describe "set_text", ->
    it "@_text = 'test ", ->
      emt.set_text 'test'
      assert.equal 'test', emt._text

  describe 'apply', ->
    it 'test', ->
      assert.equal 'test', emt.apply()

    it "<a href='#test'> \"test\"</a>", ->
      emt.set_text '<a href="#test"> "test"</a>'
      # res = '<a href="#test"> "test"</a>'
      res = '<%%___YSBocmVmPSIjdGVzdCI==> "test"</%%___YQ===>'
      assert.equal res, emt.apply()






