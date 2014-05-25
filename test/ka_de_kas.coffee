assert = require("assert")

Rule = require( '../libs/rules/ka_de_kas')
EMTLib = require( '../libs/emt_lib').EMTLib

rule = new Rule
  Lib: new EMTLib


# describe "Rules", ->
#   describe rule.description, ->
#     text = " Кое -как,  кой -кого,  все -таки "
#     eqs = " Кое-как,  кой-кого,  все-таки "


#     it text, ->
#       rule.text = text
#       rule.apply()
#       assert.equal " Кое-как,  кой-кого,  все-таки ", rule.text

