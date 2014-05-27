assert = require("assert")

Rule = require( '../libs/rules/numeric_sup')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


# describe "Rules", ->
#   describe rule.description, ->

#     text = " test^3 "


#     it text, ->
#       rule.text = text
#       rule.apply()
#       assert.equal " test<c3Vw=><c21hbGw==>3</c21hbGw==></c3Vw=> ", rule.text

