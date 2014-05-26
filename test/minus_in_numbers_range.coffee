assert = require("assert")

Rule = require( '../libs/rules/minus_in_numbers_range')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


# describe "Rules", ->
#   describe rule.description, ->

#     text = "  -1...-10 "

#     it text, ->
#       rule.text = text
#       rule.apply()
#       assert.equal " 1&minus;1 ", rule.text

