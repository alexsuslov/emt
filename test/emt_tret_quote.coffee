assert = require("assert")

EMTLib = require( '../libs/emt_lib').EMTLib
EMT = require( '../libs/emt_tret_quote').EMTretQuote

emt = new EMT
  Lib: new EMTLib()

describe "EMTretQuote", ->
