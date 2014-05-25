assert = require("assert")

Rule = require( '../libs/rules/mdash')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


# describe "Rules", ->
#   describe rule.description, ->

#     text = " привет,- привет"

#     it text, ->
#       rule.text = text
#       rule.apply()
#       assert.equal "привет &laquo;test\" привет", rule.text

